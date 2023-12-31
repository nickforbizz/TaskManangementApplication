<?php

namespace App\Http\Controllers\cms;

use App\Enums\TaskStatus;
use App\Events\TaskCreatedEvent;
use App\Events\TaskUpserted;
use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Storage;
use Illuminate\Support\Str;
use App\Helpers\GlobalHelper;
use DataTables;

use App\Models\Task;
use App\Http\Requests\StoreTaskRequest;
use App\Http\Requests\UpdateTaskRequest;
use App\Models\TaskAttachment;
use App\Models\TaskCategory;
use App\Models\User;

class TaskController extends Controller
{
    /**
     * Display a listing of the resource.
     */
    public function index(Request $request)
    {

        if ($request->ajax()) {
            // return datatable of the makes available
            $data = Task::orderBy('created_at', 'desc')
                            ->with('task_category');

            if (!auth()->user()->hasAnyRole('superadmin|admin')) {
                $data->where('assigned_to', auth()->id())
                ->orWhere('created_by', auth()->id());
            }

            $data = GlobalHelper::dataWithFilters($request, $data);

            $data = $data->get();
            


            return Datatables::of($data)
                ->addIndexColumn()
                ->editColumn('completion_date', function ($row) {
                    return date_format($row->completion_date, 'Y/m/d H:i');
                })
                ->editColumn('deleted_at', function ($row) {
                    return !is_null($row->deleted_at) ? date_format($row->deleted_at, 'Y/m/d H:i') : $row->deleted_at;
                })
                ->editColumn('due_date', function ($row) {
                    return date_format($row->due_date, 'Y/m/d H:i');
                })
                ->editColumn('category_id', function ($row) {
                    return $row->task_category->name;
                })
                ->editColumn('title', function ($row) {
                    return Str::limit($row->title, 10, '...');
                })
                ->editColumn('assigned_to', function ($row) {
                    return  explode('@', $row->user->email)[0];
                })
                ->editColumn('priority', function ($row) {
                    return $row->priority->getLabelText();
                })
                ->editColumn('status', function ($row) {
                    return $row->status->getLabelText();
                })
                ->addColumn('action', function ($row) {
                    $btn_edit = $btn_del = $btn_view = null;
                    $btn_view = '<a data-toggle="tooltip" 
                            href="' . route('tasks.show', $row->id) . '" 
                            class="btn btn-link btn-lg color-primary" 
                            data-original-title="View Record">
                        <i class="fa fa-eye"></i>
                    </a>';

                    if ((auth()->user()->hasAnyRole('superadmin|admin|editor') || 
                            auth()->id() == $row->assigned_to  ||
                                auth()->id() == $row->created_by) && is_null($row->deleted_at)) {
                        $btn_edit = '<a data-toggle="tooltip" 
                                    href="' . route('tasks.edit', $row->id) . '" 
                                    class="btn btn-link btn-lg color-primary" 
                                    data-original-title="Edit Record">
                                <i class="fa fa-edit"></i>
                            </a>';
                    }

                    if (auth()->user()->hasAnyRole('superadmin|admin') && is_null($row->deleted_at)) {
                        $btn_del = '<button type="button" 
                                    data-toggle="tooltip" 
                                    title="" 
                                    class="btn btn-link btn-danger btn-lg" 
                                    onclick="delRecord(`' . $row->id . '`, `' . route('tasks.destroy', $row->id) . '`, `#tb_Tasks`)"
                                    data-original-title="Remove">
                                <i class="fa fa-trash"></i>
                            </button>';
                    }
                    return $btn_view . $btn_edit . $btn_del;
                })
                ->rawColumns(['category_id', 'title', 'assigned_to', 'status',  'priority', 'deleted_at', 'action'])
                ->make(true);
        }

        // render view
        return view('cms.tasks.index');
    }


    

    /**
     * Show the form for creating a new resource.
     */
    public function create()
    {
        $task_categories = TaskCategory::where('active', 1)->get();
        $users = User::where('active', 1)->get();
        return view('cms.tasks.create', compact('task_categories', 'users'));
    }

    /**
     * Store a newly created resource in storage.
     */
    public function store(StoreTaskRequest $request)
    {

        $task = Task::create($request->validated());

        $request = $this->storeAttachmentFiles($request, $task);



        // dd("no attachments");


        if ($task) {
            // Dispatch the event
            event(new TaskUpserted(
                $task,
                $new_task = true,
                $updated_assignee = false,
                $updated_priority = false,
                $updated_status = false
            ));

            event(new TaskCreatedEvent($task));

            return redirect()
                ->route('tasks.index')
                ->with('success', 'Record Created Successfully');
        }
        $task_categories = TaskCategory::where('active', 1)->get();
        return redirect()
            ->route('cms.tasks.create', compact('task_categories'))
            ->with('error', 'Error while creating record');
    }

    /**
     * Display the specified resource.
     */
    public function show(Task $task)
    {
        return view('cms.tasks.view', compact('task'));
    }

    /**
     * Show the form for editing the specified resource.
     */
    public function edit(Task $task)
    {
        $task_categories = TaskCategory::where('active', 1)->get();
        $users = User::where('active', 1)->get();
        return view('cms.tasks.create', compact('task', 'task_categories', 'users'));
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  UpdateTaskRequest $request
     * @param  Task              $task
     * @return void
     */
    public function update(UpdateTaskRequest $request, Task $task)
    {
        $old_task = Task::find($task->id);
        $task->update($request->validated());

        $request = $this->storeAttachmentFiles($request, $old_task);


        // Dispatch the event for task reassignment
        if ((int)$old_task->assigned_to != (int)$task->assigned_to) {
            event(new TaskUpserted(
                $task,
                $new_task = false,
                $updated_assignee = true,
                $updated_priority = false,
                $updated_status = false
            ));
        }

        // Dispatch the event for task priority change
        if ((int) $old_task->priority->getLabelVal() != (int) $task->priority->getLabelVal()) {
            event(new TaskUpserted(
                $task,
                $new_task = false,
                $updated_assignee = false,
                $updated_priority = true,
                $updated_status = false
            ));
        }

        // Dispatch the event for task status change
        if ((int) $old_task->status->getLabelVal() != (int) $task->status->getLabelVal()) {
            event(new TaskUpserted(
                $task,
                $new_task = false,
                $updated_assignee = false,
                $updated_priority = false,
                $updated_status = true
            ));

            if ($task->status == TaskStatus::ARCHIVED) {
                $task->active = 0;
                $task->save();
            }
        }

        // Redirect the Task to the Task's profile page
        return redirect()
            ->route('tasks.index')
            ->with('success', 'Record updated successfully!');
    }

    /**
     * Remove the specified resource from storage.
     */
    public function destroy(Task $task)
    {
        // delete Task's profile image if it exists
        if ($task->photo && Storage::disk('public')->exists($task->photo)) {
            Storage::disk('public')->delete($task->photo);
        }

        if ($task->delete()) {
            return response()->json([
                'code' => 1,
                'msg' => 'Record deleted successfully'
            ]);
        }

        return response()->json([
            'code' => -1,
            'msg' => 'Record did not delete'
        ]);
    }


    private function storeAttachmentFiles(Request $request, Task $task)
    {


        // Store Image
        if ($request->hasFile('attachments')) {

            // delete task attachment
            if ($task->attachments->count() > 0) {
                // dd($task->attachments());
                foreach ($task->attachments as $file) {
                    if (Storage::disk('public')->exists('attachments/'.$file->file_name)) {
                        Storage::disk('public')->delete('attachments/'.$file->file_name);
                    }
                }
                $task->attachments()->delete();
            }


            // create task attachment
            $attachments = [];
            foreach ($request->file('attachments') as $file) {
                $uniqueHash = Str::random(10);
                $name = $file->getClientOriginalName();
                // $formattedTime = now()->format('Y-m-d H:i:s');
                $fileName = $uniqueHash . '_' . $file->getClientOriginalName();
                $dbName = 'attachments/' . $fileName;

                // Store the file in a folder 
                Storage::disk('public')->setVisibility($fileName, 'public');
                $file->storeAs('attachments', $fileName, 'public');

                $attachments[] = [
                    'task_id' => $task->id, // Make sure to set the task ID accordingly
                    'name' => $name,
                    'file_name' => $dbName,
                    'created_at' => now(),
                    'updated_at' => now(),
                ];
            }

            // Save its record in the database
            TaskAttachment::insert($attachments);
        }

        return  $request;
    }
}
