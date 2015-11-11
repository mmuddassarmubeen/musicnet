
<html>
 <%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<head>
<title>Create User</title>
<link rel="stylesheet" href="../resources/css/bootstrap-select.min.css" />

</head>
<body>

<%@include file="adminHeader.jsp" %>

<form:form method="POST" commandName="user">
<div class="container-fluid">
    <section class="container">
		<div class="container-page">				
			<div class="col-md-6">
				<h3 class="dark-grey">Register User</h3>
				
				<div class="form-group col-lg-12">
					<label>Name</label>
					<form:input class="form-control" path="username"></form:input>
					<form:errors path="username" cssStyle="#ff0000"></form:errors>
				</div>
				
				<div class="form-group col-lg-12">
					<label>Email Address</label>
					<form:input class="form-control" path="email"></form:input>
					<form:errors path="email" cssStyle="#ff0000"></form:errors>
				</div>
				
				<div class="form-group col-lg-6">
					<label>Password</label>
					<form:input class="form-control" path="password"></form:input>
					<form:errors path="password" cssStyle="#ff0000"></form:errors>
				</div>
				
				<div class="form-group col-lg-6">
					<label>Repeat Password</label>
					<form:input class="form-control" path="password"></form:input>
					<form:errors path="password" cssStyle="#ff0000"></form:errors>
				</div>
								
				
				
				<div class="form-group col-lg-6">
					<label>Role</label>
					<select id="role" class="selectpicker"></select>	
				</div>
							
			</div>
		
			<div class="col-md-6">
				<button type="submit" class="btn btn-primary">Register</button>
			</div>
		</div>
	</section>
</div>
</form:form>
<script type="text/javascript" src="../resources/js/bootstrap-select.min.js"></script>
<script type="text/javascript" src="../resources/js/getRole.js"></script>
</body>
</html>