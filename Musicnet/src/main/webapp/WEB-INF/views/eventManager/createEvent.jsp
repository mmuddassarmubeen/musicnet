<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<!DOCTYPE>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Create Event</title>
<link rel="stylesheet" href="../resources/css/bootstrap-datetimepicker.min.css">

</head>
<body>

<%@include file="eventManagerHeader.jsp" %>

<form:form method="POST" commandName="event">
<div class="container-fluid">
    <section class="container">
		<div class="container-page">				
			<div class="col-md-6">
				<h3 class="dark-grey">Create Event</h3>
				
				<div class="form-group col-lg-12">
					<label>Name</label>
					<form:input class="form-control" path="name"></form:input>
					<form:errors path="name" cssStyle="#ff0000"></form:errors>
				</div>
				
				<div class="form-group col-lg-12">
					<label>Description</label>
					<form:input class="form-control" path="description"></form:input>
					<form:errors path="description" cssStyle="#ff0000"></form:errors>
				</div>
				
				<div class="form-group col-lg-6">
					<label>Start</label>
					<div class='input-group date' id='datetimepickerStart'>
					<form:input class="form-control" path="start"></form:input>
					<span class="input-group-addon">
                        <span class="glyphicon glyphicon-calendar"></span>
                    </span>
                    </div>
					<form:errors path="start" cssStyle="#ff0000"></form:errors>
				</div>
				
				<div class="form-group col-lg-6">
					<label>End</label>
					<div class='input-group date' id='datetimepickerEnd'>
					<form:input class="form-control" path="end"></form:input>
					<span class="input-group-addon">
                        <span class="glyphicon glyphicon-calendar"></span>
                    </span>
                    </div>
					<form:errors path="end" cssStyle="#ff0000"></form:errors>
				</div>
							
				<div class="form-group col-lg-12">
					<button id="createEvent" type="submit" class="btn btn-primary">Register</button>
				</div>
			</div>
		
			
		</div>
	</section>
</div>
</form:form>
<script type="text/javascript" src="../resources/js/moment.js"></script>
<script type="text/javascript" src="../resources/js/bootstrap-datetimepicker.min.js"></script>
<script type="text/javascript" src="../resources/js/eventManager.js"></script>
</body>
</html>