<?php

namespace App\Http\Controllers\cms;

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
use App\Models\TaskCategory;
use App\Models\User;

class TaskController extends Controller
{
    /**
     * Display a listing of the resource.
     */
    public function index(Request $request)
    {
        // return datatable of the makes available
        $data = Task::orderBy('created_at', 'desc')->with('task_category')->get();
        if ($request->ajax()) {
            return Datatables::of($data)
                ->addIndexColumn()
                ->editColumn('completion_date', function ($row) {
                    return date_format($row->completion_date, 'Y/m/d H:i');
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

                    if (auth()->user()->hasAnyRole('superadmin|admin|editor') || auth()->id() == $row->created_by) {
                        $btn_edit = '<a data-toggle="tooltip" 
                                    href="' . route('tasks.edit', $row->id) . '" 
                                    class="btn btn-link btn-lg color-primary" 
                                    data-original-title="Edit Record">
                                <i class="fa fa-edit"></i>
                            </a>';
                    }

                    if (auth()->user()->hasAnyRole('superadmin|admin')) {
                        $btn_del = '<button type="button" 
                                    data-toggle="tooltip" 
                                    title="" 
                                    class="btn btn-link btn-danger btn-lg" 
                                    onclick="delRecord(`' . $row->id . '`, `' . route('tasks.destroy', $row->id) . '`, `#tb_Tasks`)"
                                    data-original-title="Remove">
                                <i class="fa fa-times"></i>
                            </button>';
                    }
                    return $btn_view . $btn_edit . $btn_del;
                })
                ->rawColumns(['category_id', 'title', 'priority', 'action'])
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
        // $request = $this->storeAttachmentFiles($request);
        
        $task = Task::create($request->validated());

        if ($task) {
            // Dispatch the event
            event(new TaskUpserted($task, $new_task=true, $updated_assignee=false, $updated_priority=false));
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
     */
    public function update(UpdateTaskRequest $request, Task $task)
    {
        // $request = $this->storeAttachmentFiles($request);
        $old_task = Task::find($task->id);
        $task->update($request->validated());
        
        // Dispatch the event for task reassignment
        if ((int)$old_task->assigned_to != (int)$task->assigned_to) {
            event(new TaskUpserted($task, $new_task=false, $updated_assignee=true, $updated_priority=false));
        }
        
        // Dispatch the event for task priority change
        if ((int) $old_task->priority->getLabelVal() != (int) $task->priority->getLabelVal()) {
            event(new TaskUpserted($task, $new_task=false, $updated_assignee=false, $updated_priority=true));
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


    private function storeAttachmentFiles(Request $request, Task $Task = null)
    {


        // Store Image
        if ($request->has('featuredimg')) {
            // Delete Image
            if ($Task) {
                if ($Task->photo && Storage::disk('public')->exists($Task->photo)) {
                    Storage::disk('public')->delete($Task->photo);
                }
            }
            $photo_filename = GlobalHelper::saveImage($request->file('featuredimg'), 'tasks', 'public');
            $request->request->add(['photo' => $photo_filename]);
        }

        return  $request;
    }
}
