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
                <a href="{{ route('tasks.index') }}">tasks</a>
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
                        <a href="{{ route('tasks.index') }}" class="btn btn-primary btn-round ml-auto">
                            <i class="flaticon-left-arrow-4 mr-2"></i>
                            View Records
                        </a>
                    </div>
                </div>
                <div class="card-body">

                    <!-- form -->
                    @include('cms.helpers.partials.feedback')
                    <form id="tasks-create" action="@if(isset($task->id))  
                            {{ route('tasks.update', ['task' => $task->id]) }}
                            @else {{ route('tasks.store' ) }} @endif" method="POST" enctype="multipart/form-data">

                        @csrf
                        @if(isset($task->id))
                        @method('PUT')
                        <input type="hidden" name="created_by" value="{{ auth()->id() }}">
                        @endif

                        <div class="row">
                            <div class="col-lg-12 form-group">
                                <label for="title">Title</label>
                                <input id="title" type="text" class="form-control" name="title" placeholder="Enter title ..." value="{{ old('title', $task->title ?? '')  }}" />
                                @error('title') <span class="text-danger">{{ $message }}</span>
                                @enderror
                            </div>
                        </div>


                        <div class="row">
                            <div class="col-md-6 form-group">
                                <label for="category_id">Category</label>
                                <select name="category_id" id="task_category" class="form-control select2">
                                    @forelse($task_categories as $category)
                                    <option value="{{ $category->id }}" @if(isset($task->id)) {{ $category->id == $task->category_id ? 'selected' : '' }} @endif> {{ $category->name }} </option>
                                    @empty
                                    <option selected disabled> -- No item -- </option>
                                    @endforelse
                                </select>
                                @error('category_id') <span class="text-danger">{{ $message }}</span>
                                @enderror
                            </div>

                            <div class="col-md-6 form-group">
                                <label for="priority"> Task Priority</label>
                                <select name="priority" id="task_priority" class="form-control">
                                    @forelse(\App\Enums\TaskPriority::values() as $key=>$value)
                                    <option value="{{ $key }}" @if(isset($task->priority)) {{ $task->priority->getLabelVal() == $key ? 'selected' : '' }} @endif> {{ $value }}</option>
                                    @empty
                                    <option selected disabled> -- No item -- </option>
                                    @endforelse
                                </select>
                                @error('priority') <span class="text-danger">{{ $message }}</span>
                                @enderror
                            </div>
                        </div>

                        <div class="row">
                            <div class="col-lg-6 form-group">
                                <label for="due_date">Due Date</label>
                                <input id="due_date" type="datetime-local" class="form-control" name="due_date" placeholder="Enter due_date ..." value="{{ old('due_date', $task->due_date ?? '')  }}" />
                                @error('due_date') <span class="text-danger">{{ $message }}</span>
                                @enderror
                            </div>
                            <div class="col-lg-6 form-group">
                                <label for="assigned_to"> Assign To</label>
                                <select name="assigned_to" id="assigned_to" class="form-control select2">
                                    @forelse($users as $user)
                                    <option value="{{ $user->id }}" @if(isset($task->assigned_to)) {{ $user->id == $task->assigned_to ? 'selected' : '' }} @endif> {{ $user->email }} </option>
                                    @empty
                                    <option selected disabled> -- No item -- </option>
                                    @endforelse
                                </select>
                                @error('assigned_to') <span class="text-danger">{{ $message }}</span>
                                @enderror
                            </div>
                        </div>

                        @if(isset($task->created_by))
                        <div class="row">
                            <div class="col-md-6 form-group">
                                <label for="completion_date">Completed Date</label>
                                <input id="completion_date" type="datetime-local" class="form-control" name="completion_date" placeholder="Enter completion_date ..." value="{{ old('completion_date', $task->completion_date ?? '')  }}" />
                                @error('completion_date') <span class="text-danger">{{ $message }}</span>
                                @enderror
                            </div>


                            <div class="col-md-6 form-group">
                                <label for="status"> Task Status</label>
                                <select name="status" id="task_status" class="form-control">
                                    @forelse(\App\Enums\TaskStatus::values() as $key=>$value)
                                    <option value="{{ $key }}" @if(isset($task->status)) {{ $task->status->getLabelVal() == $key ? 'selected' : '' }} @endif> {{ $value }}</option>
                                    @empty
                                    <option selected disabled> -- No item -- </option>
                                    @endforelse
                                </select>
                                @error('status') <span class="text-danger">{{ $message }}</span>
                                @enderror
                            </div>
                        </div>

                        <div class="row">
                            <div class="col-md-6 form-group">
                                <label for="active"> Active </label>
                                <select name="active" id="task_active" class="form-control">
                                    <option selected disabled> -- No item -- </option>
                                    <option value="1"> ACtivate </option>
                                    <option value="0"> Deactivate </option>
                                </select>
                                @error('active') <span class="text-danger">{{ $message }}</span>
                                @enderror
                            </div>
                        </div>
                        @endif

                        <div class="row">
                            <div class="col-lg-12 form-group">
                                <label for="description">Description</label>
                                <textarea name="description" id="description" class="form-control tiny_textarea" placeholder="Enter description ...">{{ old('description', $task->description ?? '') }}</textarea>
                                @error('description') <span class="text-danger">{{ $message }}</span>
                                @enderror
                            </div>
                        </div>

                        <div class="row">
                            <div class="col-lg-12 form-group">
                                <label for="attachments" class=""> Attachments </label>
                                <input id="attachments" type="file" class="form-control input-border-bottom mt-2" name="attachments[]" multiple />
                                @error('attachments') <span class="text-danger">{{ $message }}</span>
                                @enderror
                            </div>

                            <div class="col-lg-12 Xform-group">
                                @if(isset($task->created_by))
                                @if(!is_null($task->attachments))
                                @forelse($task->attachments as $attachment)
                                <div class="alert alert-warning alert-dismissible fade show" role="alert">
                                    <a href="{{ asset('storage/'.$attachment->file_name) }}" class="mr-2" target="_blank">
                                        <strong>{{ $attachment->name }} </strong>
                                    </a>
                                    <button type="button" class="close" data-dismiss="alert" aria-label="Close" style="top:0!important" onclick="deleteAttachment({{ $attachment->id }})">
                                        <span aria-hidden="true">&times;</span>
                                    </button>
                                </div>
                                @empty
                                <div class="alert alert-info">No attachments for this task</div>
                                @endforelse
                                @endif
                                @endif
                            </div>
                        </div>

                </div>




                <div class="card">
                    <div class="form-group form-floating-label">
                        <button type="submit" class="btn btn-primary btn-round btn-block">Submit</button>
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
        $("#attachments").change(function() {
            readURL(this);
        });

        $('#createallcb').change(function() {
            $('.perm_check').prop('checked', $(this).prop('checked'));
        });
    });
</script>

@endpush