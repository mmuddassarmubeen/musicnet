<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Admin Home</title>
<link rel="stylesheet" href="../resources/css/bootstrap-select.min.css">
<link rel="stylesheet" href="../resources/css/bootstrap-table.min.css">
</head>
<body>

<%@include file="adminHeader.jsp" %>

 <!-- <select id="companylist" class="selectpicker">
  </select> -->
  
  <table data-toggle="table" id="requestTable"
       data-url="pendingRequests">
    <thead>
    <tr>
        <th data-field="username">Username</th>
        <th data-field="company">Company</th>
        <th data-field="role" data-formatter="actionFormatter" data-events="actionEvents">Role</th>
    </tr>
    </thead>
</table>
<script type="text/javascript" src="../resources/js/bootstrap-select.min.js"></script>
<script type="text/javascript" src="../resources/js/bootstrap-table.min.js"></script>
<script type="text/javascript" src="../resources/js/getCompany.js"></script>

<script type="text/javascript">
function actionFormatter(value, row, index) {
    return [
        '<a class="approve" href="javascript:void(0)" title="approve">',
        'Approve',
        '</a>'
    ].join('');
}

window.actionEvents = {
    'click .approve': function (e, value, row, index) {
        //alert('You click approve icon, row: ' + JSON.stringify(row));
        console.log(row);
        $.ajax(
        		{
        			headers: { 
        		        'Accept': 'application/json',
        		        'Content-Type': 'application/json' 
        		    },
        			url: '../admin/approveRequest', 
        			type:'POST', dataType: "json", 
        			async: true, 
        			data:JSON.stringify(row), 
        			mimeType:'application/json',
        			success: function(data) {
        				$('#requestTable').bootstrapTable('refresh');
        }});
    }
};
		
</script>
</body>
</html>