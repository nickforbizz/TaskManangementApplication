<?php

namespace App\Http\Controllers\cms;

use App\Helpers\GlobalHelper;
use App\Http\Controllers\Controller;

use App\Models\PostCategory;


use App\Http\Requests\StorePostCategoryRequest;
use App\Http\Requests\UpdatePostCategoryRequest;

use Illuminate\Http\Request;
use Illuminate\Support\Str;
use DataTables;

class PostCategoryController extends Controller
{
    /**
     * Display a listing of the resource.
     */
    public function index(Request $request)
    {
        if ($request->ajax()) {
            // return datatable of the makes available
            $data = PostCategory::orderBy('created_at', 'desc');
    
            // Filter soft-deleted items
            $data = GlobalHelper::dataWithFilters($request, $data);

            $data = $data->where('fk_group', )
            $data = $data->get();
            return Datatables::of($data)
                ->addIndexColumn()
                ->editColumn('created_at', function ($row) {
                    return date_format($row->created_at, 'Y/m/d H:i');
                })
                ->editColumn('created_by', function ($row) {
                    return isset($row->created_by) ? $row?->user?->email : 'N/A';
                })
                ->editColumn('description', function ($row) {
                    return Str::limit($row->description, 20, '...');
                })
                ->addColumn('action', function ($row) {
                    $btn_edit = $btn_del = null;
                    if (auth()->user()->hasAnyRole('superadmin|admin|editor') || auth()->id() == $row->created_by) {
                        $btn_edit = '<a data-toggle="tooltip" 
                                        href="' . route('postCategories.edit', $row->id) . '" 
                                        class="btn btn-link btn-lg color-primary" 
                                        data-original-title="Edit Record">
                                    <i class="fa fa-edit"></i>
                                </a>';
                    }

                    if (auth()->user()->hasRole('superadmin')) {
                        $btn_del = '<button type="button" 
                                    data-toggle="tooltip" 
                                    title="" 
                                    class="btn btn-link btn-danger" 
                                    onclick="delRecord(`' . $row->id . '`, `' . route('postCategories.destroy', $row->id) . '`, `#tb_postCategories`)"
                                    data-original-title="Remove">
                                <i class="fa fa-trash"></i>
                            </button>';
                    }
                    return $btn_edit . $btn_del;
                })
                ->rawColumns(['description', 'created_by', 'action'])
                ->make(true);
        }

        // render view
        return view('cms.postCategories.index');
    }

    /**
     * Show the form for creating a new resource.
     */
    public function create()
    {
        return view('cms.postCategories.create');
    }

    /**
     * Store a newly created resource in storage.
     */
    public function store(StorePostCategoryRequest $request)
    {
        PostCategory::create($request->all());
        return redirect()->back()->with('success', 'Record Created Successfully');
    }

    /**
     * Display the specified resource.
     */
    public function show(PostCategory $postCategory)
    {
        return response()
            ->json($postCategory, 200, ['JSON_PRETTY_PRINT' => JSON_PRETTY_PRINT]);
    }

    /**
     * Show the form for editing the specified resource.
     */
    public function edit(PostCategory $postCategory)
    {
        return view('cms.postCategories.create', compact('postCategory'));
    }

    /**
     * Update the specified resource in storage.
     */
    public function update(UpdatePostCategoryRequest $request, PostCategory $postCategory)
    {

        $postCategory->update($request->all());

        // Redirect the user to the user's profile page
        return redirect()
            ->route('postCategories.index')
            ->with('success', 'Record updated successfully!');
    }

    /**
     * Remove the specified resource from storage.
     */
    public function destroy(PostCategory $postCategory)
    {
        if ($postCategory->delete()) {
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
