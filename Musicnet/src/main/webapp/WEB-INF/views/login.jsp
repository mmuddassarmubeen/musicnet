<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Login Page</title>
<link rel="stylesheet" href="resources/css/login.css">
<link rel='stylesheet' href='webjars/bootstrap/3.3.4/dist/css/bootstrap.min.css'>
<script type='text/javascript' src='webjars/jquery/2.1.3/dist/jquery.min.js'> </script>
<script type='text/javascript' src='webjars/bootstrap/3.3.4/dist/js/bootstrap.min.js'> </script> 
</head>
<body>
<%@include file="header.jsp" %>
 <div class="wrapper">
    <form class="form-signin" action="j_spring_security_check" method='POST'>       
      <h2 class="form-signin-heading">Please login</h2>
      <input type="text" class="form-control" name="username" placeholder="Username" required="" autofocus="" />
      <input type="password" class="form-control" name="password" placeholder="Password" required=""/>      
      <label class="checkbox">
        <input type="checkbox" value="remember-me" id="rememberMe"> Remember me
      </label>
      <button class="btn btn-lg btn-primary btn-block" type="submit">Login</button>   
    </form>
  </div>
</body>
</html>