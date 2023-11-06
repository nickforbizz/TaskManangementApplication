@extends('layouts.cms')

@section('content')


<div class="panel-header bg-primary-gradient">
	<div class="page-inner py-5">
		<div class="d-flex align-items-left align-items-md-center flex-column flex-md-row">
			<div>
				<h2 class="text-white pb-2 fw-bold">Dashboard</h2>
				<h5 class="text-white op-7 mb-2">System view at a glance</h5>
			</div>
			<div class="ml-md-auto py-2 py-md-0">
				<a href="{{ route('tasks.index') }}" class="btn btn-white btn-border btn-round mr-2">Manage Tasks</a>

				@can('create users')
				<a href="{{ route('users.create') }}" class="btn btn-secondary btn-round">Add User</a>
				@endcan
			</div>
		</div>
	</div>
</div>
<div class="page-inner mt--5">
	<div class="row mt--2">
		<div class="col-md-6">
			<div class="card full-height">
				<div class="card-body">
					<div class="card-title">Overall statistics</div>
					<div class="card-category">Daily information about statistics in system</div>
					<div class="d-flex flex-wrap justify-content-around pb-2 pt-4">
						<div class="px-2 pb-2 pb-md-0 text-center">
							<div id="circles-1"></div>
							<h6 class="fw-bold mt-3 mb-0">New Users</h6>
						</div>
						<div class="px-2 pb-2 pb-md-0 text-center">
							<div id="circles-2"></div>
							<h6 class="fw-bold mt-3 mb-0">My Tasks</h6>
						</div>
						<div class="px-2 pb-2 pb-md-0 text-center">
							<div id="circles-3"></div>
							<h6 class="fw-bold mt-3 mb-0">My Posts</h6>
						</div>
					</div>
				</div>
			</div>
		</div>
		<div class="col-md-6">
			<div class="card full-height">
				<div class="card-body">
					<div class="card-title">Total tasks & status statistics</div>
					<div class="row py-3">
						<div class="col-md-4 d-flex flex-column justify-content-around">
							<div>
								<h6 class="fw-bold text-uppercase text-success op-8">Total Tasks</h6>
								<h3 class="fw-bold">{{ $total_active_tasks }}</h3>
							</div>
							<div>
								<h6 class="fw-bold text-uppercase text-danger op-8">Total Completed</h6>
								<h3 class="fw-bold">{{ $total_completed_tasks }}</h3>
							</div>
						</div>
						<div class="col-md-8">
							<div id="chart-container">
								<canvas id="totalIncomeChart"></canvas>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<div class="row">
		<div class="col-md-12">
			<div class="card">
				<div class="card-header">
					<div class="card-head-row">
						<div class="card-title">User Statistics</div>
						<div class="card-tools">
							<a href="#" class="btn btn-info btn-border btn-round btn-sm mr-2">
								<span class="btn-label">
									<i class="fa fa-pencil"></i>
								</span>
								Export
							</a>
							<a href="#" class="btn btn-info btn-border btn-round btn-sm">
								<span class="btn-label">
									<i class="fa fa-print"></i>
								</span>
								Print
							</a>
						</div>
					</div>
				</div>
				<div class="card-body">
					<div class="chart-container" style="min-height: 375px">
						<canvas id="statisticsChart"></canvas>
					</div>
					<div id="myChartLegend"></div>
				</div>
			</div>
		</div>
	</div>


	<div class="row">
		<div class="col-md-8">
			<div class="card">
				<div class="card-header">
					<div class="card-title">Latest Tasks</div>
				</div>
				<div class="card-body pb-0">
					@forelse($tasks as $task)
					<div class="d-flex">
						<div class="flex-1 pt-1 ml-2">
							<h6 class="fw-bold mb-1">Priority: {{ $task->priority->getLabelText() }}</h6>
							<small class="text-muted">{!! $task->title !!}</small>
						</div>
						<div class="d-flex ml-auto align-items-center">
							<h6 class="text-info fw-bold"><a href="{{ route('tasks.show', $task->id) }}">view</a></h6>
						</div>
					</div>
					<div class="separator-dashed"></div>
					@empty
					<p>No tasks at the moment</p>
					@endforelse
				</div>
			</div>
		</div>
		<div class="col-md-4">
			<div class="card card-primary bg-primary-gradient">
				<div class="card-body">
					<h4 class="mt-3 b-b1 pb-2 mb-4 fw-bold">Active user right now</h4>
					<h1 class="mb-4 fw-bold">17</h1>
					<h4 class="mt-3 b-b1 pb-2 mb-5 fw-bold">Page view per minutes</h4>
					<div id="activeUsersChart"></div>
					<h4 class="mt-5 pb-3 mb-0 fw-bold">Top active pages</h4>
					<ul class="list-unstyled">
						<li class="d-flex justify-content-between pb-1 pt-1"><small>/product/readypro/index.html</small> <span>7</span></li>
						<li class="d-flex justify-content-between pb-1 pt-1"><small>/product/atlantis/demo.html</small> <span>10</span></li>
					</ul>
				</div>
			</div>
		</div>
	</div>
	<div class="row">
		<div class="col-md-6">
			<div class="card full-height">
				<div class="card-header">
					<div class="card-title">Feed Activity</div>
				</div>
				<div class="card-body">
					<ol class="activity-feed">
						@forelse($feeds as $feed)
						<li class="feed-item feed-item-secondary">
							<time class="date" datetime="9-25">{{ \Carbon\Carbon::parse($feed->created_at)->format('M d') }}</time>
							<span class="text"> {{ $feed->title }} <a href="#" class="pull-right">View more >> </a></span>
						</li>
						@empty
						<li class="feed-item feed-item-secondary">
							No feed at the moment
						</li>
						@endforelse
					</ol>
				</div>
			</div>
		</div>
		<div class="col-md-6">
			<div class="card full-height">
				<div class="card-header">
					<div class="card-head-row">
						<div class="card-title">Customer Feedback</div>
						<div class="card-tools">
							<ul class="nav nav-pills nav-secondary nav-pills-no-bd nav-sm" id="pills-tab" role="tablist">
								<li class="nav-item">
									<a class="nav-link" id="pills-month" data-toggle="pill" href="#pills-month" role="tab" aria-selected="false">Latest</a>
								</li>
							</ul>
						</div>
					</div>
				</div>

				<div class="card-body">
					@forelse($feedbacks as $feedback)
					@php 
						$colors = ['info', 'warning', 'primary', 'danger', 'success'];
						$bg_profile = $colors[array_rand($colors)];
					@endphp
					<div class="d-flex">
						<div class="avatar avatar-online">
							<span class="avatar-title rounded-circle border border-white bg-{{$bg_profile}}"> {{ substr($feedback->user->fname, 0, 1) }}{{ substr($feedback->user->lname, 0, 1) }} </span>
						</div>
						<div class="flex-1 ml-3 pt-1">
							<h6 class="text-uppercase fw-bold mb-1"> {{ $feedback->user->name }} 
								<span class="@if($feedback->status->isTodo()) text-warning @elseif($feedback->status->isInProgress()) text-info @elseif($feedback->status->isCompleted()) text-success @endif fw-bold ml-3  pl-3"> 
									{{ $feedback->status->getLabelText() }} 
								</span></h6>
							<span class="text-muted"> {{ $feedback->title }} </span>
						</div>
						<div class="float-right pt-1">
							<small class="text-muted"> {{ \Carbon\Carbon::parse($feed->created_at)->format('h:i M d Y') }} </small>
						</div>
					</div>
					<div class="separator-dashed"></div>
					@empty
					<div class="d-flex">
						<div class="avatar avatar-offline">
							<span class="avatar-title rounded-circle border border-white bg-secondary">N/A</span>
						</div>
						<div class="flex-1 ml-3 pt-1">
							<span class="text-muted"> No feedback at the moment.</span>
						</div>
					</div>
					<div class="separator-dashed"></div>
					@endforelse
					
				</div>
				<!-- .card-body -->

			</div>
		</div>
	</div>
</div>


@endsection

@push('scripts')

<script>
	let total_active_users = @json($total_active_users);
	let total_users = @json($total_users);

	let user_tasks = @json($user_tasks);
	let total_active_tasks = @json($total_active_tasks);

	let user_posts = @json($user_posts);
	let total_active_posts = @json($total_active_posts);

	Circles.create({
		id: 'circles-1',
		radius: 45,
		value: parseInt(total_active_users)/parseInt(total_users) *100,
		maxValue: 100,
		width: 7,
		text: total_active_users,
		colors: ['#f1f1f1', '#FF9E27'],
		duration: 400,
		wrpClass: 'circles-wrp',
		textClass: 'circles-text',
		styleWrapper: true,
		styleText: true
	})

	Circles.create({
		id: 'circles-2',
		radius: 45,
		value: parseInt(user_tasks)/parseInt(total_active_tasks) *100,
		maxValue: 100,
		width: 7,
		text: parseInt(user_tasks),
		colors: ['#f1f1f1', '#2BB930'],
		duration: 400,
		wrpClass: 'circles-wrp',
		textClass: 'circles-text',
		styleWrapper: true,
		styleText: true
	})

	Circles.create({
		id: 'circles-3',
		radius: 45,
		value: parseInt(user_posts)/parseInt(total_active_posts) *100,
		maxValue: 100,
		width: 7,
		text: parseInt(user_posts),
		colors: ['#f1f1f1', '#F25961'],
		duration: 400,
		wrpClass: 'circles-wrp',
		textClass: 'circles-text',
		styleWrapper: true,
		styleText: true
	})

	var totalIncomeChart = document.getElementById('totalIncomeChart').getContext('2d');

	var mytotalIncomeChart = new Chart(totalIncomeChart, {
		type: 'bar',
		data: {
			labels: ["S", "M", "T", "W", "T", "F", "S", "S", "M", "T"],
			datasets: [{
				label: "Total Income",
				backgroundColor: '#ff9e27',
				borderColor: 'rgb(23, 125, 255)',
				data: [6, 4, 9, 5, 4, 6, 4, 3, 8, 10],
			}],
		},
		options: {
			responsive: true,
			maintainAspectRatio: false,
			legend: {
				display: false,
			},
			scales: {
				yAxes: [{
					ticks: {
						display: false //this will remove only the label
					},
					gridLines: {
						drawBorder: false,
						display: false
					}
				}],
				xAxes: [{
					gridLines: {
						drawBorder: false,
						display: false
					}
				}]
			},
		}
	});

	$('#lineChart').sparkline([105, 103, 123, 100, 95, 105, 115], {
		type: 'line',
		height: '70',
		width: '100%',
		lineWidth: '2',
		lineColor: '#ffa534',
		fillColor: 'rgba(255, 165, 52, .14)'
	});



	var ctx = document.getElementById('statisticsChart').getContext('2d');
	var user_data = @json($data);
	var statisticsChart = new Chart(ctx, {
		type: 'line',
		data: {
			labels: ["Jan", "Feb", "Mar", "Apr", "May", "Jun", "Jul", "Aug", "Sep", "Oct", "Nov", "Dec"],
			datasets: [{
				label: "Subscribers",
				borderColor: '#f3545d',
				pointBackgroundColor: 'rgba(243, 84, 93, 0.6)',
				pointRadius: 0,
				backgroundColor: 'rgba(243, 84, 93, 0.4)',
				legendColor: '#f3545d',
				fill: true,
				borderWidth: 2,
				data: user_data.map(entry => entry.user_count)
			}, 
			// {
			// 	label: "New Visitors",
			// 	borderColor: '#fdaf4b',
			// 	pointBackgroundColor: 'rgba(253, 175, 75, 0.6)',
			// 	pointRadius: 0,
			// 	backgroundColor: 'rgba(253, 175, 75, 0.4)',
			// 	legendColor: '#fdaf4b',
			// 	fill: true,
			// 	borderWidth: 2,
			// 	data: [256, 230, 245, 287, 240, 250, 230, 295, 331, 431, 456, 521]
			// }, {
			// 	label: "Active Users",
			// 	borderColor: '#177dff',
			// 	pointBackgroundColor: 'rgba(23, 125, 255, 0.6)',
			// 	pointRadius: 0,
			// 	backgroundColor: 'rgba(23, 125, 255, 0.4)',
			// 	legendColor: '#177dff',
			// 	fill: true,
			// 	borderWidth: 2,
			// 	data: [542, 480, 430, 550, 530, 453, 380, 434, 568, 610, 700, 900]
			// }
		]
		},
		options: {
			responsive: true,
			maintainAspectRatio: false,
			legend: {
				display: false
			},
			tooltips: {
				bodySpacing: 4,
				mode: "nearest",
				intersect: 0,
				position: "nearest",
				xPadding: 10,
				yPadding: 10,
				caretPadding: 10
			},
			layout: {
				padding: {
					left: 5,
					right: 5,
					top: 15,
					bottom: 15
				}
			},
			scales: {
				yAxes: [{
					ticks: {
						fontStyle: "500",
						beginAtZero: false,
						maxTicksLimit: 5,
						padding: 10
					},
					gridLines: {
						drawTicks: false,
						display: false
					}
				}],
				xAxes: [{
					gridLines: {
						zeroLineColor: "transparent"
					},
					ticks: {
						padding: 10,
						fontStyle: "500"
					}
				}]
			},
			legendCallback: function(chart) {
				var text = [];
				text.push('<ul class="' + chart.id + '-legend html-legend">');
				for (var i = 0; i < chart.data.datasets.length; i++) {
					text.push('<li><span style="background-color:' + chart.data.datasets[i].legendColor + '"></span>');
					if (chart.data.datasets[i].label) {
						text.push(chart.data.datasets[i].label);
					}
					text.push('</li>');
				}
				text.push('</ul>');
				return text.join('');
			}
		}
	});

	var myLegendContainer = document.getElementById("myChartLegend");

	// generate HTML legend
	myLegendContainer.innerHTML = statisticsChart.generateLegend();

	// bind onClick event to all LI-tags of the legend
	var legendItems = myLegendContainer.getElementsByTagName('li');
	for (var i = 0; i < legendItems.length; i += 1) {
		legendItems[i].addEventListener("click", legendClickCallback, false);
	}
</script>
@endpush