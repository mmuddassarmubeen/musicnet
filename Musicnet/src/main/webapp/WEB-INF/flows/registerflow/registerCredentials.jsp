<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<!DOCTYPE>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Login Credentials</title>
<link rel='stylesheet' href='../webjars/bootstrap/3.3.4/dist/css/bootstrap.min.css'>
<link rel="stylesheet" href="../resources/css/bootstrap-select.min.css" />
</head>
<body>
<%@include file="header.jsp" %>


<div class="container-fluid">
    <section class="container">
		<div class="container-page">				
			<div class="col-md-6">
				<h3 class="dark-grey">Add Credentials</h3>

		<form:form method="POST" commandName="accountRequest">				
				<div class="form-group col-lg-12">
					<label>User Name</label>
					<form:input class="form-control" path="username"></form:input>
					<form:errors path="username" cssStyle="#ff0000"></form:errors>
				</div>
				
				<div class="form-group col-lg-12">
					<label>Password</label>
					<form:input type="password" class="form-control" path="password"></form:input>
					<form:errors path="password" cssStyle="#ff0000"></form:errors>
				</div>
				
				<div class="form-group col-lg-12">
					<label>Confirm Password</label>
					<form:input type="password" class="form-control" path="confirmpassword"></form:input>
					<form:errors path="confirmpassword" cssStyle="#ff0000"></form:errors>
				</div>
				
				<div class="form-group col-lg-12">
					<label>Company</label>
					<form:input class="form-control" path="company"></form:input>
					<form:errors path="company" cssStyle="#ff0000"></form:errors>
				</div>
				
				<div class="form-group col-lg-12">
					<label>Role</label>
					<form:select path="role" class="form-control selectpicker" id="rolePicker"></form:select>
					<form:errors path="role" cssStyle="#ff0000"></form:errors>
				</div>
				
				<div class="form-group col-lg-12">
					<button name="_eventId_back" type="submit" class="btn btn-primary">Back</button>
					<button name="_eventId_register" type="submit" class="btn btn-primary">Register</button>
				</div>
		</form:form>
	</div>
		</div>
	</section>
</div>
<script type='text/javascript' src='../webjars/jquery/2.1.3/dist/jquery.min.js'> </script>
<script type='text/javascript' src='../webjars/bootstrap/3.3.4/dist/js/bootstrap.min.js'> </script>
<script type="text/javascript" src="../resources/js/bootstrap-select.min.js"></script>
<script type='text/javascript' src="../resources/js/getRole.js"></script>
</body>
</html>