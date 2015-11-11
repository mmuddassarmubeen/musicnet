<html>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<head>
<title>View Companies</title>
</head>
<body>
<%@include file="adminHeader.jsp" %>
<section class="container">
	<div class="container-page">				
		<div class="col-md-6">
			<h3 class="dark-grey">Company Roster</h3>
			<c:forEach var="company" items="${companies}">
			<button type="submit" class="btn btn-primary">Register</button>
			</c:forEach>
		</div>
	</div>
</section>
</body>
</html>