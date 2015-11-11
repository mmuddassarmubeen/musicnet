<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<!DOCTYPE>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Register</title>
<link rel='stylesheet' href='../webjars/bootstrap/3.3.4/dist/css/bootstrap.min.css'>
<link rel="stylesheet" href="../resources/css/bootstrap-datetimepicker.min.css">
</head>
<body>
<%@include file="header.jsp" %>

<form:form method="POST" commandName="accountRequest">
<div class="container-fluid">
    <section class="container">
		<div class="container-page">				
			<div class="col-md-6">
				<h3 class="dark-grey">Register</h3>
				
				<div class="form-group col-lg-12">
					<label>First Name</label>
					<form:input class="form-control" path="firstname"></form:input>
					<form:errors path="firstname" cssStyle="#ff0000"></form:errors>
				</div>
				
				<div class="form-group col-lg-12">
					<label>Last Name</label>
					<form:input class="form-control" path="lastname"></form:input>
					<form:errors path="lastname" cssStyle="#ff0000"></form:errors>
				</div>
				
				<div class="form-group col-lg-12">
					<label>Email</label>
					<form:input class="form-control" path="email"></form:input>
					<form:errors path="email" cssStyle="#ff0000"></form:errors>
				</div>
				
				<div class="form-group col-lg-12">
					<label>Date Of Birth</label>
					<div class='input-group date' id='datetimepickerDOB'>
					<form:input class="form-control" path="dateOfBirth"></form:input>
					<span class="input-group-addon">
                        <span class="glyphicon glyphicon-calendar"></span>
                    </span>
                    </div>
					<form:errors path="dateOfBirth" cssStyle="#ff0000"></form:errors>
				</div>
				<div class="form-group col-lg-12">
					<button name="_eventId_next" type="submit" class="btn btn-primary">Next</button>
				</div>
			</div>
		
			
		</div>
	</section>
</div>
</form:form>

<script type='text/javascript' src='../webjars/jquery/2.1.3/dist/jquery.min.js'> </script>
<script type='text/javascript' src='../webjars/bootstrap/3.3.4/dist/js/bootstrap.min.js'> </script>
<script type="text/javascript" src="../resources/js/moment.js"></script>
<script type="text/javascript" src="../resources/js/bootstrap-datetimepicker.min.js"></script>
<script type="text/javascript">
$('#datetimepickerDOB').datetimepicker();
</script>
</body>
</html>