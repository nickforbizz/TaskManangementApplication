<?php

namespace App\Http\Controllers\cms;

use App\Http\Controllers\Controller;

use App\Models\Group;


use App\Http\Requests\StoreGroupRequest;
use App\Http\Requests\UpdateGroupRequest;
use App\Models\User;
use Illuminate\Http\Request;
use Illuminate\Support\Str;
use DataTables;

class GroupController extends Controller
{
    /**
     * Display a listing of the resource.
     */
    public function index(Request $request)
    {
        if ($request->ajax()) {
            // return datatable of the makes available
            $data = Group::orderBy('created_at', 'desc');
    
            // Use the withTrashed method to include soft-deleted records
            $data = $data->withTrashed();
    
            // Filter soft-deleted items
            if ($request->has('trash_filter')) {
                if ((int) $request->trash_filter === 1) {
                    $data->whereNull('deleted_at');
                }elseif ((int) $request->trash_filter === 2) {
                    $data->whereNotNull('deleted_at');
                }
            }

            
            $data = $data->get();
            return Datatables::of($data)
                ->addIndexColumn()
                ->editColumn('created_at', function ($row) {
                    return date_format($row->created_at, 'Y/m/d H:i');
                })
                ->editColumn('description', function ($row) {
                    return Str::limit($row->description, 20, '...');
                })
                ->addColumn('action', function ($row) {
                    $btn_edit = $btn_del = null;
                    if (auth()->user()->hasAnyRole('superadmin|admin|editor') ) {
                        $btn_edit = '<a data-toggle="tooltip" 
                                        href="' . route('groups.edit', $row->id) . '" 
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
                                    onclick="delRecord(`' . $row->id . '`, `' . route('groups.destroy', $row->id) . '`, `#tb_groups`)"
                                    data-original-title="Remove">
                                <i class="fa fa-trash"></i>
                            </button>';
                    }
                    return $btn_edit . $btn_del;
                })
                ->rawColumns(['description', 'action'])
                ->make(true);
        }

        // render view
        return view('cms.groups.index');
    }

    /**
     * Show the form for creating a new resource.
     */
    public function create()
    {
        $users = User::where('active', 1)->with('groups')->get();
        return view('cms.groups.create', compact( 'users'));
    }

    /**
     * Store a newly created resource in storage.
     */
    public function store(StoreGroupRequest $request)
    {
        $group = Group::create($request->validated());
        $group->users()->attach($request->users);
        return redirect()->back()->with('success', 'Record Created Successfully');
    }

    /**
     * Display the specified resource.
     */
    public function show(Group $group)
    {
        return response()
            ->json($group, 200, ['JSON_PRETTY_PRINT' => JSON_PRETTY_PRINT]);
    }

    /**
     * Show the form for editing the specified resource.
     */
    public function edit(Group $group)
    {
        $users = User::where('active', 1)->with('groups')->get();
        return view('cms.groups.create', compact('group', 'users'));
    }

    /**
     * Update the specified resource in storage.
     */
    public function update(UpdateGroupRequest $request, Group $group)
    {
        $group->update($request->validated());
        $group = Group::find($group->id);
        $selected_users =  array_map('intval', $request->users);
        $group->users()->detach(); 
        $group->users()->attach($selected_users);

        // Redirect the user to the user's profile page
        return redirect()
            ->route('groups.index')
            ->with('success', 'Record updated successfully!');
    }

    /**
     * Remove the specified resource from storage.
     */
    public function destroy(Group $group)
    {
        if ($group->delete()) {
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
