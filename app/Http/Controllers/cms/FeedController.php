<?php

namespace App\Http\Controllers\cms;

use App\Helpers\GlobalHelper;
use App\Http\Controllers\Controller;
use App\Http\Requests\Common\FeedRequest;
use App\Models\Feed;

use Illuminate\Http\Request;
use Illuminate\Support\Str;

class FeedController extends Controller
{
    /**
     * Display a listing of the resource.
     */
    public function index(Request $request)
    {
        
        if ($request->ajax()) {
            // return datatable of the makes available
            $data = Feed::orderBy('created_at', 'desc');
    
            // Filter soft-deleted items
            $data = GlobalHelper::dataWithFilters($request, $data);
            
            $data = $data->get();

            return datatables()::of($data)
                ->addIndexColumn()
                ->editColumn('created_at', function ($row) {
                    return date_format($row->created_at, 'Y/m/d H:i');
                })
                ->editColumn('deleted_at', function ($row) {
                    return !is_null($row->deleted_at) ? date_format($row->deleted_at, 'Y/m/d H:i') : $row->deleted_at;
                })
                ->editColumn('content', function ($row) {
                    return Str::limit($row->content, 20, '...');
                })
                ->editColumn('fk_user', function ($row) {
                    return isset($row->fk_user) ? $row?->user?->email : 'N/A';
                })
                ->addColumn('action', function ($row) {
                    $btn_edit = $btn_del = null;
                    if ((auth()->user()->hasAnyRole('superadmin|admin|editor') || auth()->id() == $row->fk_user) && is_null($row->deleted_at)) {
                        $btn_edit = '<a data-toggle="tooltip" 
                                        href="' . route('feeds.edit', $row->id) . '" 
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
                                    onclick="delRecord(`' . $row->id . '`, `' . route('feeds.destroy', $row->id) . '`, `#tb_feeds`)"
                                    data-original-title="Remove">
                                <i class="fa fa-trash"></i>
                            </button>';
                    }
                    return $btn_edit . $btn_del;
                })
                ->rawColumns(['content', 'created_at', 'deleted_at', 'fk_user,', 'action'])
                ->make(true);
        }

        // render view
        return view('cms.feeds.index');
    }

    /**
     * Show the form for creating a new resource.
     */
    public function create()
    {
        return view('cms.feeds.create');
    }

    /**
     * Store a newly created resource in storage.
     */
    public function store(FeedRequest $request)
    {
        $feed = Feed::create($request->validated());
        
        return redirect()
            ->route('feeds.index')
            ->with('success', 'Record created successfully!');
    }

    /**
     * Display the specified resource.
     */
    public function show(Feed $feed)
    {
        return view('cms.feeds.view', compact('feed'));
    }

    /**
     * Show the form for editing the specified resource.
     */
    public function edit(Feed $feed)
    {
        return view('cms.feeds.create', compact('feed'));
    }

    /**
     * Update the specified resource in storage.
     */
    public function update(FeedRequest $request, Feed $feed)
    {
        $feed->update($request->validated());

        // Redirect the user to the list page
        return redirect()
            ->route('feeds.index')
            ->with('success', 'Record updated successfully!');
    }

    /**
     * Remove the specified resource from storage.
     */
    public function destroy(Feed $feed)
    {
        if ($feed->delete()) {
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
