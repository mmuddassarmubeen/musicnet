
<!DOCTYPE html>
<html>
<head>
    <title>Minimum Setup</title>
    <link rel="stylesheet" href="../resources/css/calendar.css">
    <link rel="stylesheet" href="../webjars/bootstrap/3.3.4/dist/css/bootstrap.min.css">
    <script type='text/javascript' src='../webjars/bootstrap/3.3.4/dist/js/bootstrap.min.js'> </script>
    
</head>
<body>

<%@include file="eventManagerHeader.jsp" %>
   <div class="container">

	<div class="hero-unit">
		<h1>Calendar</h1>
	</div>
	<div class="page-header">

		<div class="pull-right form-inline">
			<div class="btn-group">
				<button class="btn btn-primary" data-calendar-nav="prev"><< Prev</button>
				<button class="btn" data-calendar-nav="today">Today</button>
				<button class="btn btn-primary" data-calendar-nav="next">Next >></button>
			</div>
			<div class="btn-group">
				<button class="btn btn-warning" data-calendar-view="year">Year</button>
				<button class="btn btn-warning active" data-calendar-view="month">Month</button>
				<button class="btn btn-warning" data-calendar-view="week">Week</button>
				<button class="btn btn-warning" data-calendar-view="day">Day</button>
			</div>
		</div>
	<h3></h3>
	</div>

	<div class="row">
		<div class="col-md-9">
			<div id="calendar"></div>
		</div>
		<div class="col-md-3">
			<div class="row-fluid">
				<select id="first_day" class="span12">
					<option value="" selected="selected">First day of week language-dependant</option>
					<option value="2">First day of week is Sunday</option>
					<option value="1">First day of week is Monday</option>
				</select>
				<label class="checkbox">
					<input type="checkbox" value="#events-modal" id="events-in-modal"> Open events in modal window
				</label>
			</div>

			<h4>Events</h4>
			<small>This list is populated with events dynamically</small>
			<ul id="eventlist" class="nav nav-list"></ul>
		</div>
	</div>

	<div class="clearfix"></div>
	<br><br>
	<br><br>

	<div class="modal hide fade" id="events-modal">
		<div class="modal-header">
			<button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
			<h3>Event</h3>
		</div>
		<div class="modal-body" style="height: 400px">
		</div>
		<div class="modal-footer">
			<a href="#" data-dismiss="modal" class="btn">Close</a>
		</div>
	</div>
	<script type='text/javascript' src='../webjars/jquery/2.1.3/dist/jquery.min.js'> </script>
	<script type="text/javascript" src="../webjars/underscore/1.8.3/underscore.js"></script>
	<script type="text/javascript" src="../resources/js/calendar.js"></script>
    <script type="text/javascript" src="../resources/js/app.js"></script>
	
</div>

</body>
</html>