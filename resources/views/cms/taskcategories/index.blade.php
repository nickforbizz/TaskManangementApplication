@extends('layouts.cms')

@section('content')
<div class="page-inner">
    <div class="page-header">
        <h4 class="page-title"> Task Categories </h4>
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
                <a href="#"> task Categories</a>
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
                        @can('create task categories')
                        <a href="{{ route('taskCategories.create') }}" class="btn btn-primary btn-round ml-auto">
                            <i class="flaticon-add mr-2"></i>
                            Add Row
                        </a>
                        @endcan
                    </div>
                </div>
                <div class="card-body">


                    @include('cms.helpers.partials.feedback')
                    @include('cms.helpers.partials.trash_filter')
                    <div class="table-responsive">
                        <table id="tb_taskCategories" class="display table table-striped table-hover">
                            <thead>
                                <tr>
                                    <th>#</th>
                                    <th>Name</th>
                                    <th>Description</th>
                                    <th>Created By</th>
                                    <th>Created At</th>
                                    <th>Deleted At</th>
                                    <th>Action</th>
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
        $('#tb_taskCategories').DataTable({
            processing: true,
            serverSide: true,
            ajax: {
                url: "{{ route('taskCategories.index') }}",
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
                    data: 'name'
                },
                {
                    data: 'description'
                },
                {
                    data: 'created_by'
                },
                {
                    data: 'created_at',
                },
                {
                    data: 'deleted_at',
                },
                {
                    data: 'action',
                    name: 'action',
                    orderable: true,
                    searchable: true
                },
            ]
        });

        // Add an event listener to the checkbox to trigger a DataTable search
        filterTbReload('#tb_taskCategories')



    });
</script>

@endpush