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
                <a href="#">feeds</a>
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
                        <a href="{{ route('feeds.index') }}" class="btn btn-primary btn-round ml-auto" >
                            <i class="flaticon-left-arrow-4 mr-2"></i>
                            View Records
                        </a> 
                    </div>
                </div>
                <div class="card-body">

                    <!-- form -->
                    @include('cms.helpers.partials.feedback') 
                    <form id="feeds-create" 
                            action="@if(isset($feed->id))  
                            {{ route('feeds.update', ['feed' => $feed->id]) }}
                            @else {{ route('feeds.store' ) }} @endif"  
                            method="post" 
                            enctype="multipart/form-data">

                        @csrf
                        @if(isset($feed->id))
                            @method('PUT')
                            <input type="hidden" name="fk_user" value="{{ auth()->id() }}">
                        @endif


                        <div class="form-group ">
                            
                            <label for="title" class="placeholder"> Title </label>
                            <input id="title" type="text" class="form-control  @error('title') is-invalid @enderror" name="title"  value="{{ $feed->title ?? '' }}" required />
                            @error('title') <span class="text-danger">{{ $message }}</span>
                            @enderror
                        </div>

                        <div class="form-group ">
                            <label for="description" class="placeholder"> Description</label>
                            <textarea name="content" id="description" class="form-control" >{{ $feed->content ?? '' }}
                            </textarea>
                            @error('content') <span class="text-danger">{{ $message }}</span>
                            @enderror
                        </div>

                        



                        <div class="card">
                            <div class="form-group form-floating-label">
                                <button class="btn btn-primary btn-round btn-block">Submit</button>
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