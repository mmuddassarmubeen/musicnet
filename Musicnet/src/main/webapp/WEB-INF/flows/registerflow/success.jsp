<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<!DOCTYPE>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Register</title>
<link rel='stylesheet' href='../webjars/bootstrap/3.3.4/dist/css/bootstrap.min.css'>
</head>
<body>
<%@include file="header.jsp" %>

<form:form method="POST" commandName="accountRequest">
<div class="container-fluid">
    <section class="container">
		<div class="container-page">				
			<div class="col-md-6">
				<h3 class="dark-grey">Registration Successful</h3>
				<div class="form-group col-lg-12">
					<a href="../login">Return to login page</a>
				</div>
			</div>
		
			
		</div>
	</section>
</div>
</form:form>

<script type='text/javascript' src='../webjars/jquery/2.1.3/dist/jquery.min.js'> </script>
<script type='text/javascript' src='../webjars/bootstrap/3.3.4/dist/js/bootstrap.min.js'> </script>
</body>
</html>