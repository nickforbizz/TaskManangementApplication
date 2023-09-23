@extends('layouts.cms')

@section('content')
<div class="page-inner">
    <div class="page-header">
        <h4 class="page-title"> Tasks </h4>
        <ul class="breadcrumbs">
            <li class="nav-home">
                <a href="{{ route('cms') }}">
                    <i class="flaticon-home"></i>
                </a>
            </li>
            <li class="separator">
                <i class="flaticon-right-arrow"></i>
            </li>
            <li class="nav-item">
                <a href="#">tasks</a>
            </li>
            <li class="separator">
                <i class="flaticon-right-arrow"></i>
            </li>
            <li class="nav-item">
                <a href="#">Index</a>
            </li>
        </ul>
    </div>
    <div class="row">
   

        <div class="col-md-12">
            <div class="card">
                <div class="card-header">
                    <div class="d-flex align-items-center">
                        <h4 class="card-title">List of Available Record(s)</h4>
                        @can('create tasks')
                        <a href="{{ route('tasks.create') }}" class="btn btn-primary btn-round ml-auto" >
                            <i class="flaticon-add mr-2"></i>
                            Add Record
                        </a> 
                        @endcan
                    </div>
                </div>
                <div class="card-body">

                    @include('cms.helpers.partials.feedback')
                    @include('cms.helpers.partials.trash_filter')
                    <div class="table-responsive">
                        <table id="tb_tasks" class="display table table-striped table-hover">
                            <thead>
                                <tr>
                                    <th>#</th>
                                    <th>Category</th>
                                    <th>Title</th>
                                    <th>Due Date</th>
                                    <th>Completed Date</th>
                                    <th>Priority</th>
                                    <th>Status</th>
                                    <th>Deleted At</th>
                                    <th style="width: 10%">Action</th>
                                </tr>
                            </thead>
                        </table>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<!-- .page-inner -->

@endsection


@push('scripts')


<script>
    $(document).ready(function() {
        $('#tb_tasks').DataTable({
            processing: true,
            serverSide: true,
            ajax: {
                url: "{{ route('tasks.index') }}",
                data: function(d) {
                    // Add custom search parameter for trashed items
                    d.trash_filter = $('.trash_filter').val();
                }
            },
            columns: [{
                    data: 'DT_RowIndex',
                    name: 'DT_RowIndex'
                },
                {
                    data: 'category_id'
                },
                {
                    data: 'title'
                },					
                {
                    data: 'due_date',
                },						
                {
                    data: 'completion_date',
                },							
                {
                    data: 'priority',
                },	
                {
                    data: 'deleted_at',
                },							
                {
                    data: 'status',
                },	
                {
                    data: 'action',
                    name: 'action',
                    orderable: true,
                    searchable: true
                },
            ]
        });
        // #tb_tasks

        // Add an event listener to the checkbox to trigger a DataTable search
        filterTbReload('#tb_tasks')

  
    });


    
</script>

@endpush