@extends('layouts.cms')

@section('content')
<div class="page-inner">
    <div class="page-header">
        <h4 class="page-title"> Feeds </h4>
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
                <a href="{{ route('feeds.index') }}" class="text-primary">feeds</a>
            </li>
            <li class="separator">
                <i class="flaticon-right-arrow"></i>
            </li>
            <li class="nav-item">
                <a href="#">View</a>
            </li>
        </ul>
    </div>
    <div class="row">
   

        <div class="col-md-12">
            <div class="card">
                <div class="card-header">
                    <div class="d-flex align-items-center">
                        <h4 class="card-title">Displaying feed Details</h4>
                         
                        @can('edit feeds')
                        <a href="{{ route('feeds.edit', $feed->id)  }}" class="btn btn-primary btn-round ml-auto" >
                            <i class="flaticon-pencil mr-2"></i>
                            Edit Record
                        </a> 
                        @endcan
                    </div>
                </div>
                <div class="card-body">
                    <ul class="list-group list-group-lg list-group-bordered">
                        <li class="row list-group-item">
                            <div class="col-md-12"><b> Title: </b> <br> {{ $feed->title }} </div>                        
                        </li>
                        
                        <li class="row list-group-item">
                            <div class="col-md-6"> <b> Created At: </b> <br> {{ \Carbon\carbon::parse($feed->created_at)->diffForHumans() }} </div>
                            <div class="col-md-6"> <b> Created By: </b> <br> {{ $feed->user->name }} </div>
                        </li>
                        <li class="row list-group-item">
                            <div class="col-md-12"><b> Description: </b> <br> {!! $feed->content !!} </div>
                        </li>
                    </ul>
                    
                </div>
                <!-- .card-body -->
            </div>
        </div>
    </div>
</div>
<!-- .page-inner -->

@endsection


@push('scripts')


<script>
    $(document).ready(function() {
        

  
    });


    
</script>

@endpush