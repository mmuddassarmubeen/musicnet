<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
    <%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<!DOCTYPE>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Profile</title>
<link href="//maxcdn.bootstrapcdn.com/font-awesome/4.3.0/css/font-awesome.min.css" rel="stylesheet">
<link rel="stylesheet" href="../webjars/bootstrap/3.3.4/dist/css/bootstrap.min.css">
</head>
<body>
<%@include file="musicianheader.jsp" %>

<div class="container">
<form:form commanduser="person">
    <div class="row profile">
		<div class="col-md-3">
			<div class="profile-sidebar">
				<!-- SIDEBAR USERPIC -->
				<div class="profile-userpic">
				<img src="${person.imagefile}" alt="default" />
				</div>
				<!-- END SIDEBAR USERPIC -->
				<!-- SIDEBAR USER TITLE -->
				<div class="profile-usertitle">
					<div class="profile-usertitle-name">
						${person.lastName}, ${person.firstName}
					</div>
					<div class="profile-usertitle-job">
						Artist
					</div>
				</div>
				<!-- END SIDEBAR USER TITLE -->
				<!-- SIDEBAR BUTTONS -->
				<div class="profile-userbuttons">
				<a href="upload"><button type="button" class="btn btn-success btn-sm">Upload Photo</button></a>
				<a href="addSkill"><button type="button" class="btn btn-primary btn-sm">Add Skill</button></a>
				</div>
				<!-- END SIDEBAR BUTTONS -->
				<!-- SIDEBAR MENU -->
				<div class="profile-usermenu">
					<ul class="nav">
						<li class="active">
							<a href="#">
							 </a>
						</li>
						<li>
							<a href="#">
							 </a>
						</li>
					</ul>
				</div>
				<!-- END MENU -->
			</div>
		</div>
		<div class="col-md-9">
            <div class="profile-content">
			   <h3>Skills</h3>




<table id="skills" data-toggle="table" class="table table-bordered"
       data-url="viewSkills">
    <thead>
    <tr>
        <th data-field="instrument">Instrument</th>
        <th data-field="description">Description</th>
        <th data-field="competency">Expertise</th>
    </tr>
    </thead>
</table>
            </div>
		</div>
	</div>
	</form:form>
</div>
<br>
<br>




<script type='text/javascript' src='../webjars/jquery/2.1.3/dist/jquery.min.js'> </script>
<!-- <script type='text/javascript' src='../webjars/bootstrap/3.3.4/dist/js/bootstrap.min.js'> </script>-->
<script type="text/javascript" src="../resources/js/bootstrap-table.min.js" ></script>

</body>
</html>