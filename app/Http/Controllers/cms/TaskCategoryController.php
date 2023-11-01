<?php

namespace App\Http\Controllers\cms;

use App\Events\TaskCategoryCreatedEvent;
use App\Helpers\GlobalHelper;
use App\Http\Controllers\Controller;
use App\Models\TaskCategory;
use App\Http\Requests\StoreTaskCategoryRequest;
use App\Http\Requests\UpdateTaskCategoryRequest;

use Illuminate\Http\Request;
use Illuminate\Support\Str;
use DataTables;

class TaskCategoryController extends Controller 
{
    /**
     * Display a listing of the resource.
     */
    public function index(Request $request)
    {
        
        if ($request->ajax()) {
            // return datatable of the makes available
            $data = TaskCategory::orderBy('created_at', 'desc');
    
            // Filter soft-deleted items
            $data = GlobalHelper::dataWithFilters($request, $data);
            
            $data = $data->get();

            return Datatables::of($data)
                ->addIndexColumn()
                ->editColumn('created_at', function ($row) {
                    return date_format($row->created_at, 'Y/m/d H:i');
                })
                ->editColumn('deleted_at', function ($row) {
                    return !is_null($row->deleted_at) ? date_format($row->deleted_at, 'Y/m/d H:i') : $row->deleted_at;
                })
                ->editColumn('description', function ($row) {
                    return Str::limit($row->description, 20, '...');
                })
                ->editColumn('created_by', function ($row) {
                    return isset($row->created_by) ? $row?->user?->email : 'N/A';
                })
                ->addColumn('action', function ($row) {
                    $btn_edit = $btn_del = null;
                    if ((auth()->user()->hasAnyRole('superadmin|admin|editor') || auth()->id() == $row->created_by) && is_null($row->deleted_at)) {
                        $btn_edit = '<a data-toggle="tooltip" 
                                        href="' . route('taskCategories.edit', $row->id) . '" 
                                        class="btn btn-link btn-lg color-primary" 
                                        data-original-title="Edit Record">
                                    <i class="fa fa-edit"></i>
                                </a>';
                    }

                    if (is_null($row->deleted_at) && auth()->user()->hasRole('superadmin')) {
                        $btn_del = '<button type="button" 
                                    data-toggle="tooltip" 
                                    title="" 
                                    class="btn btn-link btn-danger" 
                                    onclick="delRecord(`' . $row->id . '`, `' . route('taskCategories.destroy', $row->id) . '`, `#tb_taskCategories`)"
                                    data-original-title="Remove">
                                <i class="fa fa-trash"></i>
                            </button>';
                    }
                    return $btn_edit . $btn_del;
                })
                ->rawColumns(['description', 'created_at', 'deleted_at', 'created_by', 'action'])
                ->make(true);
        }

        // render view
        return view('cms.taskCategories.index');
    }

    /**
     * Show the form for creating a new resource.
     */
    public function create()
    {
        return view('cms.taskCategories.create');
    }

    /**
     * Store a newly created resource in storage.
     */
    public function store(StoreTaskCategoryRequest $request)
    {
        $task_category = TaskCategory::create($request->validated());

        if ($task_category) {
            event(new TaskCategoryCreatedEvent($task_category));
        }
        
        return redirect()
            ->route('taskCategories.index')
            ->with('success', 'Record created successfully!');
    }

    /**
     * Display the specified resource.
     */
    public function show(TaskCategory $taskCategory)
    {
        return response()
            ->json($taskCategory, 200, ['JSON_PRETTY_PRINT' => JSON_PRETTY_PRINT]);
    }

    /**
     * Show the form for editing the specified resource.
     */
    public function edit(TaskCategory $taskCategory)
    {
        return view('cms.taskCategories.create', compact('taskCategory'));
    }

    /**
     * Update the specified resource in storage.
     */
    public function update(UpdateTaskCategoryRequest $request, TaskCategory $taskCategory)
    {
        $taskCategory->update($request->validated());

        // Redirect the user to the list page
        return redirect()
            ->route('taskCategories.index')
            ->with('success', 'Record updated successfully!');
    }

    /**
     * Remove the specified resource from storage.
     */
    public function destroy(TaskCategory $taskCategory)
    {
        if ($taskCategory->delete()) {
            return response()->json([
                'code' => 1,
                'msg' => 'Record deleted successfully'
            ], 200, ['JSON_PRETTY_PRINT' => JSON_PRETTY_PRINT]);
        }

        return response()->json([
            'code' => -1,
            'msg' => 'Record did not delete'
        ], 422, ['JSON_PRETTY_PRINT' => JSON_PRETTY_PRINT]);
    }
}
