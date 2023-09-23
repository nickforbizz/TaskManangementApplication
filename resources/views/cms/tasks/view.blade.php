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
                <a href="{{ route('tasks.index') }}" class="text-primary">tasks</a>
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
                        <h4 class="card-title">Displaying Task Details</h4>
                         
                        @can('edit tasks')
                        <a href="{{ route('tasks.edit', $task->id)  }}" class="btn btn-primary btn-round ml-auto" >
                            <i class="flaticon-pencil mr-2"></i>
                            Edit Record
                        </a> 
                        @endcan
                    </div>
                </div>
                <div class="card-body">
                    <ul class="list-group list-group-lg list-group-bordered">
                        <li class="row list-group-item">
                            <div class="col-md-6"><b> Title: </b> <br> {{ $task->title }} </div>                        
                            <div class="col-md-6"><b> Category: </b> <br> {{ $task->task_category->name }} </div>
                        </li>
                        <li class="row list-group-item">
                            <div class="col-md-6"> <b> Priority: </b> <br> {{ $task->priority->getLabelText() }} </div>
                            <div class="col-md-6"> <b> Status: </b> <br> {{ $task->status->getLabelText() }} </div>
                        </li>
                        <li class="row list-group-item">
                            <div class="col-md-6"> <b> Due Date: </b> <br> {{ $task->due_date }} </div>
                            <div class="col-md-6"> <b> Completion Date: </b> <br> {{ $task->completion_date }} </div>
                        </li>
                        <li class="row list-group-item">
                            <div class="col-md-6"> <b> Assigned To: </b> <br> {{ $task->assignee->name }} </div>
                            <div class="col-md-6"> <b> Created By: </b> <br> {{ $task->user->name }} </div>
                        </li>
                        <li class="row list-group-item">
                            <div class="col-md-12"><b> Description: </b> <br> {!! $task->description !!} </div>
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