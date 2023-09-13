@extends('layouts.cms')

@section('content')
<div class="page-inner">
    <div class="page-header">
        <h4 class="page-title"> Tasks </h4>
        <ul class="breadcrumbs">
            <li class="nav-home">
                <a href="#">
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
                <a href="#">Create</a>
            </li>
        </ul>
    </div>
    <div class="row">


        <div class="col-md-12">
            <div class="card">
                <div class="card-header">
                    <div class="d-flex align-items-center">
                        <h4 class="card-title">Add Record</h4>
                        <a href="{{ route('tasks.index') }}" class="btn btn-primary btn-round ml-auto" >
                            <i class="flaticon-left-arrow-4 mr-2"></i>
                            View Records
                        </a> 
                    </div>
                </div>
                <div class="card-body">

                    <!-- form -->
                    @include('cms.helpers.partials.feedback')
                    <form id="tasks-create" 
                            action="@if(isset($task->id))  
                            {{ route('tasks.update', ['task' => $task->id]) }}
                            @else {{ route('tasks.store' ) }} @endif"  
                            method="post" 
                            enctype="multipart/form-data">

                        @csrf
                        @if(isset($task->id))
                            @method('PUT')
                            <input type="hidden" name="created_by" value="{{ auth()->id() }}">
                        @endif

                        <div class="form-group">
                            <label for="title">Title</label>
                            <input id="title" type="text" class="form-control form-control" 
                                name="title" 
                                placeholder="Enter title ..." 
                                value="{{ old('title', $task->title ?? '')  }}"  />
                            @error('title') <span class="text-danger">{{ $message }}</span>
                            @enderror
                        </div>

                        <div class="form-group">
                            <label for="slug"> Slug</label>
                            <input id="slug" type="text" class="form-control form-control" 
                               
                                disabled
                                value="{{ old('slug', $task->slug ?? '') }}"  />
                            @error('slug') <span class="text-danger">{{ $message }}</span>
                            @enderror
                        </div>

                        <div class="form-group">
                            <label for="category_id">Category</label>
                            <select name="category_id" id="task_category" class="form-control form-control">
                                @forelse($task_categories as $category)
                                    <option value="{{ $category->id }}" @if(isset($task->id)) {{  $category->id == $task->category_id ? 'selected' : '' }} @endif> {{ $category->name }} </option>
                                @empty
                                    <option selected disabled> -- No item -- </option> 
                                @endforelse
                            </select>
                            @error('category_id') <span class="text-danger">{{ $message }}</span>
                            @enderror
                        </div>

                        <div class="form-group">
                            <label for="description">Description</label>
                            <textarea name="description" id="description" class="form-control form-control tiny_textarea" placeholder="Enter description ...">{{ old('description', $task->description ?? '') }}</textarea>
                            @error('description') <span class="text-danger">{{ $message }}</span>
                            @enderror
                        </div>

                        <div class="form-group form-floating-label">
                            <label for="featuredimg" class=""> Photo </label>
                            <input id="featuredimg" type="file" class="form-control input-border-bottom" name="featuredimg" />
                            @if (isset($task->photo))
                                <img id="blah" src="{{ asset('storage/'.$task->photo) }}" alt="current image" height="100px"/>
                            @else
                                <img id="blah" src="#" alt="no image" height="100px"/>
                            @endif
                            @error('photo') <span class="text-danger">{{ $message }}</span>
                            @enderror
                        </div>

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
        $("#featuredimg").change(function() {
			readURL(this);
		});

        $('#createallcb').change(function () {
            $('.perm_check').prop('checked', $(this).prop('checked'));
        });
    });


    
</script>

@endpush