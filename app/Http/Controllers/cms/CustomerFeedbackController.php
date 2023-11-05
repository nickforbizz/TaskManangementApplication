<?php

namespace App\Http\Controllers\cms;

use App\Http\Controllers\Controller;
use App\Http\Requests\Common\CustomerFeedbackRequest;
use Illuminate\Http\Request;
use Illuminate\Support\Str;

use App\Helpers\GlobalHelper;
use App\Models\CustomerFeedback;

class CustomerFeedbackController extends Controller
{
    /**
     * Display a listing of the resource.
     */
    public function index(Request $request)
    {
        
        if ($request->ajax()) {
            // return datatable of the makes available
            $data = CustomerFeedback::orderBy('created_at', 'desc');
    
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
                                        href="' . route('customerFeedbacks.edit', $row->id) . '" 
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
                                    onclick="delRecord(`' . $row->id . '`, `' . route('customerFeedbacks.destroy', $row->id) . '`, `#tb_customerFeedbacks`)"
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
        return view('cms.customerFeedbacks.index');
    }

    /**
     * Show the form for creating a new resource.
     */
    public function create()
    {
        return view('cms.customerFeedbacks.create');
    }

    /**
     * Store a newly created resource in storage.
     */
    public function store(CustomerFeedbackRequest $request)
    {
        $feedback = CustomerFeedback::create($request->validated());
        
        return redirect()
            ->route('customerFeedbacks.index')
            ->with('success', 'Record created successfully!');
    }

    /**
     * Display the specified resource.
     */
    public function show(CustomerFeedback $customerFeedback)
    {
        return response()
            ->json($customerFeedback, 200, ['JSON_PRETTY_PRINT' => JSON_PRETTY_PRINT]);
    }

    /**
     * Show the form for editing the specified resource.
     */
    public function edit(CustomerFeedback $customerFeedback)
    {
        return view('cms.customerFeedbacks.create', compact('customerFeedback'));
    }

    /**
     * Update the specified resource in storage.
     */
    public function update(CustomerFeedbackRequest $request, CustomerFeedback $customerFeedback)
    {
        $customerFeedback->update($request->validated());

        // Redirect the user to the list page
        return redirect()
            ->route('customerFeedbacks.index')
            ->with('success', 'Record updated successfully!');
    }

    /**
     * Remove the specified resource from storage.
     */
    public function destroy(CustomerFeedback $customerFeedback)
    {
        if ($customerFeedback->delete()) {
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
