
<html>
 <%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<head>
<title>Create Company</title>
</head>
<body>

<%@include file="adminHeader.jsp" %>

<form:form method="POST" commandName="company">
<div class="container-fluid">
    <section class="container">
		<div class="container-page">				
			<div class="col-md-6">
				<h3 class="dark-grey">Register Company</h3>
				
				<div class="form-group col-lg-12">
					<label>Name</label>
					<form:input class="form-control" path="name"></form:input>
					<form:errors path="name" cssStyle="#ff0000"></form:errors>
				</div>
				
				<div class="form-group col-lg-6">
					<label>Password</label>
					<input type="password" name="" class="form-control" id="" value="">
				</div>
				
				<div class="form-group col-lg-6">
					<label>Repeat Password</label>
					<input type="password" name="" class="form-control" id="" value="">
				</div>
								
				<div class="form-group col-lg-6">
					<label>Email Address</label>
					<input type="" name="" class="form-control" id="" value="">
				</div>
				
				<div class="form-group col-lg-6">
					<label>Repeat Email Address</label>
					<input type="" name="" class="form-control" id="" value="">
				</div>			
			</div>
		
			<div class="col-md-6">
				<button type="submit" class="btn btn-primary">Register</button>
			</div>
		</div>
	</section>
</div>
</form:form>
</body>
</html>