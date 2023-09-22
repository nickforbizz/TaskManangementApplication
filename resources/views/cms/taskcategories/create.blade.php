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
                <a href="#">task Categories</a>
            </li>
            <li class="separator">
                <i class="flaticon-right-arrow"></i>
            </li>
            <li class="nav-item">
                <a href="#">Create</a>
            </li>
        </ul>
    </div>
    <div class="row">


        <div class="col-md-12">
            <div class="card">
                <div class="card-header">
                    <div class="d-flex align-items-center">
                        <h4 class="card-title">Add|Edit Record</h4>
                        <a href="{{ route('taskCategories.index') }}" class="btn btn-primary btn-round ml-auto" >
                            <i class="flaticon-left-arrow-4 mr-2"></i>
                            View Records
                        </a> 
                    </div>
                </div>
                <div class="card-body">

                    <!-- form -->
                    @include('cms.helpers.partials.feedback')
                    <form id="taskCategories-create" 
                            action="@if(isset($taskCategory->id))  
                            {{ route('taskCategories.update', ['taskCategory' => $taskCategory->id]) }}
                            @else {{ route('taskCategories.store' ) }} @endif"  
                            method="post" 
                            enctype="multipart/form-data">

                        @csrf
                        @if(isset($taskCategory->id))
                            @method('PUT')
                            <input type="hidden" name="created_by" value="{{ auth()->id() }}">
                        @endif


                        <div class="form-group form-floating-label">
                            @if(isset($taskCategory->id)) 
                            <label for="name" class="">Name</label>
                            <input id="name" type="text" class="form-control input-border-bottom @error('name') is-invalid @enderror"  value="{{ $taskCategory->name ?? '' }}" readonly disabled />
                            @else
                            <input id="name" type="text" class="form-control input-border-bottom @error('name') is-invalid @enderror" name="name"  value="{{ $taskCategory->name ?? '' }}" required />
                            <label for="name" class="placeholder">name</label>
                            @endif
                            @error('email') <span class="text-danger">{{ $message }}</span>
                            @enderror
                        </div>

                        <div class="form-group form-floating-label">
                            <textarea name="description" id="description" class="form-control input-border-bottom" >{{ $taskCategory->description ?? '' }}
                            </textarea>
                            <label for="description" class="placeholder"> Description</label>
                            @error('description') <span class="text-danger">{{ $message }}</span>
                            @enderror
                        </div>

                        



                        <div class="card">
                            <div class="form-group form-floating-label">
                                <button class="btn btn-success btn-round float-right">Submit</button>
                            </div>
                        </div>
                    </form>
                    <!-- End form -->

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
        
    });


    
</script>

@endpush