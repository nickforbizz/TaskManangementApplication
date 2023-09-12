<?php

namespace App\Http\Controllers\cms;

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

class TaskController extends Controller
{
    /**
     * Display a listing of the resource.
     */
    public function index(Request $request)
    {
        // return datatable of the makes available
        $data = Task::orderBy('created_at', 'desc')->get();
        if ($request->ajax()) {
            return Datatables::of($data)
                ->addIndexColumn()
                ->editColumn('created_at', function ($row) {
                    return date_format($row->created_at, 'Y/m/d H:i');
                })
                ->editColumn('photo', function ($row) {
                    return '<img class="tb_img" src="' . url('storage/' . $row->photo) . '" alt="' . $row->slug . '" data-toggle="popover" data-placement="top" data-content="<img src=' . url('storage/' . $row->photo) . ' style=\'max-height: 200px; max-width: 200px;\'>">';
                })
                ->editColumn('category_id', function ($row) {
                    return $row->Task_category->name;
                })
                ->editColumn('title', function ($row) {
                    return Str::limit($row->title, 10, '...');
                })
                ->editColumn('description', function ($row) {
                    return Str::limit($row->description, 20, '...');
                })
                ->addColumn('action', function ($row) {
                    $btn_edit = $btn_del = null;
                    if (auth()->user()->hasAnyRole('superadmin|admin|editor') || auth()->id() == $row->created_by) {
                        $btn_edit = '<a data-toggle="tooltip" 
                                    href="' . route('tasks.edit', $row->id) . '" 
                                    class="btn btn-link btn-primary btn-lg" 
                                    data-original-title="Edit Record">
                                <i class="fa fa-edit"></i>
                            </a>';
                    }

                    if (auth()->user()->hasAnyRole('superadmin|admin')) {
                        $btn_del = '<button type="button" 
                                    data-toggle="tooltip" 
                                    title="" 
                                    class="btn btn-link btn-danger" 
                                    onclick="delRecord(`' . $row->id . '`, `' . route('tasks.destroy', $row->id) . '`, `#tb_Tasks`)"
                                    data-original-title="Remove">
                                <i class="fa fa-times"></i>
                            </button>';
                    }
                    return $btn_edit . $btn_del;
                })
                ->rawColumns(['photo', 'category_id', 'title', 'description', 'action'])
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
        return view('cms.tasks.create', compact('task_categories'));
    }

    /**
     * Store a newly created resource in storage.
     */
    public function store(StoreTaskRequest $request)
    {
        $request = $this->storeFeaturedImg($request);
        $task = Task::create($request->all());

        if ($task) {
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
    public function show(Task $Task)
    {
        return $Task;
    }

    /**
     * Show the form for editing the specified resource.
     */
    public function edit(Task $Task)
    {
        $Task_categories = TaskCategory::where('active', 1)->get();
        return view('cms.tasks.create', compact('task', 'task_categories'));
    }

    /**
     * Update the specified resource in storage.
     */
    public function update(UpdateTaskRequest $request, Task $task)
    {
        $request = $this->storeFeaturedImg($request);
        $task->update($request->all());

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


    private function storeFeaturedImg(Request $request, Task $Task = null)
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