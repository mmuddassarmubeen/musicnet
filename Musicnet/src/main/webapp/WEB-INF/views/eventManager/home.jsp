<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Events</title>
</head>
<body>
<%@include file="eventManagerHeader.jsp" %>


<div class="content">

<div class="container">

<h3>Current Events</h3>
 <table id="currentEvents" data-toggle="table"
       data-url="currentEvents">
    <thead>
    <tr>
        <th data-field="name">Name</th>
        <th data-field="description">Description</th>
        <th data-field="start">Start</th>
        <th data-field="end">End</th>
    </tr>
    </thead>
</table>


<h3>Future Events</h3>
<table id="futureEvents" data-toggle="table"
       data-url="futureEvents">
    <thead>
    <tr>
        <th data-field="name">Name</th>
        <th data-field="description">Description</th>
        <th data-field="start">Start</th>
        <th data-field="end">End</th>
    </tr>
    </thead>
</table>


<h3>Past Events</h3>
<table id="pastEvents" data-toggle="table"
       data-url="pastEvents">
    <thead>
    <tr>
        <th data-field="name">Name</th>
        <th data-field="description">Description</th>
        <th data-field="start">Start</th>
        <th data-field="end">End</th>
    </tr>
    </thead>
</table>

</div>
</div>
<script type="text/javascript" src="../resources/js/bootstrap-table.min.js" ></script>

</body>
</html>