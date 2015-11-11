<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Events</title>
</head>
<body>
<%@include file="musicianheader.jsp" %>

<h3>New Events</h3>
<table id="openEvents" data-toggle="table"
       data-url="openEvents">
    <thead>
    <tr>
        <th data-field="name">Name</th>
        <th data-field="description">Description</th>
        <th data-field="start">Start</th>
        <th data-field="end">End</th>
        <th data-field="action" data-formatter="actionFormatter" data-events="actionEvents">Details</th>
    </tr>
    </thead>
</table>

<br/>
<br/>

<h3>Subscribed Events</h3>
<table id="myEvents" data-toggle="table" class="table table-bordered"
       data-url="myEvents">
    <thead>
    <tr>
        <th data-field="name">Name</th>
        <th data-field="description">Description</th>
        <th data-field="start">Start</th>
        <th data-field="end">End</th>
    </tr>
    </thead>
</table>

<script type="text/javascript" src="../resources/js/bootstrap-table.min.js" ></script>
<script type="text/javascript">
function actionFormatter(value, row, index) {
    return [
        '<a class="subscribe" href="javascript:void(0)" title="Like">',
        'Add to Schedule',
        '</a>'
    ].join('');
}

window.actionEvents = {
    'click .subscribe': function (e, value, row, index) {
        //alert('You click approve icon, row: ' + JSON.stringify(row));
        console.log(row);
        $.ajax(
        		{
        			headers: { 
        		        'Accept': 'application/json',
        		        'Content-Type': 'application/json' 
        		    },
        			url: '../musician/subscribeEvent', 
        			type:'POST', dataType: "json", 
        			async: true, 
        			data:JSON.stringify(row), 
        			mimeType:'application/json',
        			success: function(data) {
        				$('#openEvents').bootstrapTable('refresh');
        				$('#myEvents').bootstrapTable('refresh');
    		
        }});
    }
};
		
</script>
</body>
</html>