<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<!DOCTYPE>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Add Skill</title>
</head>
<body>
<%@include file="musicianheader.jsp" %>

<form:form method="POST" commandName="skill">
<div class="container-fluid">
    <section class="container">
		<div class="container-page">				
			<div class="col-md-6">
				<h3 class="dark-grey">Skill</h3>
				
				<div class="form-group col-lg-12">
					<label>Name</label>
					<form:input class="form-control" id="instrument" path="instrument"></form:input>
					<form:errors path="instrument" cssStyle="#ff0000"></form:errors>
				</div>
				
				<div class="form-group col-lg-12">
					<label>Description</label>
					<form:input class="form-control" id="description" path="description"></form:input>
					<form:errors path="description" cssStyle="#ff0000"></form:errors>
				</div>
				
				<div class="form-group col-lg-12">
					<label>Competency</label>
					<form:input class="form-control" id="competency" path="competency"></form:input>
					<form:errors path="competency" cssStyle="#ff0000"></form:errors>
				</div>
							
				<div class="form-group col-lg-12">
					<button type="submit" id="addSkill" class="btn btn-primary">Add</button>
				</div>
			</div>
			
		</div>
	</section>
</div>
</form:form>
</body>
</html>