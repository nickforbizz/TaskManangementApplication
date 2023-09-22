<footer class="footer">
	<div class="container-fluid">
		<nav class="pull-left">
			<ul class="nav">
				<li class="nav-item">
					<a target="_blank" class="nav-link" href="{{ config('app.powered_by_url', 'http://localhost') }}">
						{{ config('app.powered_by', 'nickforbizz@gmail.com') }}
					</a>
				</li>
				<li class="nav-item">
					<a class="nav-link" href="#">
						Help
					</a>
				</li>
				<li class="nav-item">
					<a class="nav-link" href="#">
						Licenses
					</a>
				</li>
				<li class="nav-item">
					<a class="nav-link" href="{{ route('cms') }}">
						- Dashboard
					</a>
				</li>
			</ul>
		</nav>
		<div class="copyright ml-auto">
			{{ date('Y') }}, made with <i class="fa fa-heart heart text-danger"></i> by 
			<a target="_blank" href="{{ config('app.powered_by_url', 'http://localhost') }}">{{ config('app.powered_by', 'nickforbizz@gmail.com') }}</a>
		</div>				
	</div>
</footer>