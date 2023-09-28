@extends('layouts.cms')

@section('content')
<div class="page-inner">
    <div class="page-header">
        <h4 class="page-title"> Posts </h4>
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
                <a href="#">Posts</a>
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
                        @can('create posts')
                        <a href="{{ route('posts.create') }}" class="btn btn-primary btn-round ml-auto" >
                            <i class="flaticon-add mr-2"></i>
                            Add Record
                        </a> 
                        @endcan
                    </div>
                </div>
                <div class="card-body">

                    @include('cms.helpers.partials.trash_filter')
                    <div class="table-responsive">
                        <table id="tb_posts" class="display table table-striped table-hover">
                            <thead>
                                <tr>
                                    <th>#</th>
                                    <th>Img</th>
                                    <th>Category</th>
                                    <th>Title</th>
                                    <th>Content</th>
                                    <th>Created At</th>
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
        $('#tb_posts').DataTable({
            processing: true,
            serverSide: true,
            ajax: {
                url: "{{ route('posts.index') }}",
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
                    data: 'featured_img'
                },
                {
                    data: 'category_id'
                },
                {
                    data: 'title'
                },
                {
                    data: 'content'
                },					
                {
                    data: 'created_at',
                },
                {
                    data: 'action',
                    name: 'action',
                    orderable: true,
                    searchable: true
                },
            ]
        });
        // #tb_posts

        // Add an event listener to the checkbox to trigger a DataTable search
        filterTbReload('#tb_posts')

  
    });


    
</script>

@endpush