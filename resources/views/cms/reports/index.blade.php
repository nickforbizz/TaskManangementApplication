@extends('layouts.cms')

@section('content')
<div class="page-inner">
    <div class="page-header">
        <h4 class="page-title"> Reports </h4>
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
                <a href="#">Reports</a>
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

        <div class="col-md-6 p-2">
            <div class="card">
                <div class="card-body">
                    <h2>Tasks Report</h2>
                    <div class="row">
                        <div class="form-group col-8">
                            <label for="tasks_year">Select Year:</label>
                            <select class="form-control" id="tasks_year" name="year" onchange="generate_report('task')">
                                @foreach($tasksYears as $year)
                                <option value="{{ $year }}" {{ $selectedYear == $year ? 'selected' : '' }}>{{ $year }}</option>
                                @endforeach
                            </select>
                        </div>

                        <div class="form-group col-4">
                            <a href="{{ route('reports.download.csv') }}" class="form-control  btn btn-primary btn-round mt-4">Download CSV</a>

                        </div>

                    </div>

                    <canvas id="tasksChart" height="200"></canvas>


                </div>
                <!-- .card-body -->
            </div>
        </div>
        <!-- .col-md-6 p-2 -->

        <div class="col-md-6 p-2">
            <div class="card">
                <div class="card-body">
                    <h2>Feeds Report</h2>
                    <div class="row">
                        <div class="form-group col-8">
                            <label for="feeds_year">Select Year:</label>
                            <select class="form-control" id="feeds_year" name="year" onchange="generate_report('feed')">
                                @foreach($feedsYears as $year)
                                <option value="{{ $year }}" {{ $selectedYear == $year ? 'selected' : '' }}>{{ $year }}</option>
                                @endforeach
                            </select>
                        </div>

                        <div class="form-group col-4">
                            <a href="{{ route('reports.download.csv') }}" class="form-control  btn btn-primary btn-round mt-4">Download CSV</a>

                        </div>

                    </div>

                    <canvas id="feedsChart" height="200"></canvas>


                </div>
                <!-- .card-body -->
            </div>
        </div>
        <!-- .col-md-6 p-2 -->

    </div>
    <!-- .row -->



    <div class="row">

        <div class="col-md-6 p-2">
            <div class="card">
                <div class="card-body">
                    <h2>Posts Report</h2>
                    <div class="row">
                        <div class="form-group col-8">
                            <label for="posts_year">Select Year:</label>
                            <select class="form-control" id="posts_year" name="year" onchange="generate_report('post')">
                                @foreach($postsYears as $year)
                                <option value="{{ $year }}" {{ $selectedYear == $year ? 'selected' : '' }}>{{ $year }}</option>
                                @endforeach
                            </select>
                        </div>

                        <div class="form-group col-4">
                            <a href="{{ route('reports.download.csv') }}" class="form-control  btn btn-primary btn-round mt-4">Download CSV</a>

                        </div>

                    </div>

                    <canvas id="postsChart" height="200"></canvas>


                </div>
                <!-- .card-body -->
            </div>
        </div>
        <!-- .col-md-6 p-2 -->

        <div class="col-md-6 p-2">
            <div class="card">
                <div class="card-body">
                    <h2>Users Report</h2>
                    <div class="row">
                        <div class="form-group col-8">
                            <label for="users_year">Select Year:</label>
                            <select class="form-control" id="users_year" name="year" onchange="generate_report('user')">
                                @foreach($usersYears as $year)
                                <option value="{{ $year }}" {{ $selectedYear == $year ? 'selected' : '' }}>{{ $year }}</option>
                                @endforeach
                            </select>
                        </div>

                        <div class="form-group col-4">
                            <a href="{{ route('reports.download.csv') }}" class="form-control  btn btn-primary btn-round mt-4">Download CSV</a>

                        </div>

                    </div>

                    <canvas id="usersChart" height="200"></canvas>


                </div>
                <!-- .card-body -->
            </div>
        </div>
        <!-- .col-md-6 p-2 -->

    </div>
    <!-- .row -->


</div>
<!-- .page-inner -->

@endsection


@push('scripts')


<script>
    $(document).ready(function() {
        const task_selected_year = $('#tasks_year').val();
        var task_data = {!!json_encode($tasksChartData) !!};
        loadChart(task_data, 'tasksChart', 'Task', task_selected_year)

        const feed_selected_year = $('#feeds_year').val();
        var feed_data = {!!json_encode($feedsChartData) !!};
        loadChart(feed_data, 'feedsChart', 'Feed', feed_selected_year)

        const post_selected_year = $('#posts_year').val();
        var post_data = {!!json_encode($postsChartData) !!};
        loadChart(post_data, 'postsChart', 'Post', post_selected_year)


        const user_selected_year = $('#users_year').val();
        var user_data = {!!json_encode($usersChartData) !!};
        loadChart(user_data, 'usersChart', 'User', user_selected_year)

    });


    function generate_report(type) {
        var year = +$('#' + type + 's_year').val();
        $.ajax({
            url: '{{ route("reports.generateReport") }}',
            data: {
                type,
                year
            },
            headers: {
                'X-CSRF-TOKEN': $('meta[name="csrf-token"]').attr('content')
            },
            method: 'POST',
            success: function(response) {
                let data = response.chartData;
                loadChart(data, type + 'sChart', type, year)
            },
            error: function(error) {
                console.log(error);
            }
        })
    }

    
    function loadChart(data, load_area, entity, selectedYear) {
        entity = capitalize(entity);
        var labels = [];
        var values = [];
        for (var key in data) {
            labels.push(key);
            values.push(data[key]);
        }

        var ctx = document.getElementById(load_area);
        var myChart = new Chart(ctx, {
            type: 'line',
            data: {
                labels: labels,
                datasets: [{
                    label: entity + ' Count',
                    data: values,
                    borderColor: "#1d7af3",
                    pointBorderColor: "#FFF",
                    pointBackgroundColor: "#1d7af3",
                    pointBorderWidth: 2,
                    pointHoverRadius: 4,
                    pointHoverBorderWidth: 1,
                    pointRadius: 4,
                    backgroundColor: 'transparent',
                    fill: true,
                    borderWidth: 2,
                }]
            },
            options: {
                title: {
                    display: true,
                    text: entity + ' Count by Month for Year ' + selectedYear
                },
                scales: {
                    yAxes: [{
                        ticks: {
                            beginAtZero: true
                        }
                    }]
                }
            }
        });
    }
</script>

@endpush