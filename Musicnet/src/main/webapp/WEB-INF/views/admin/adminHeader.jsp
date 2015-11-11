<link rel='stylesheet' href='../webjars/bootstrap/3.3.4/dist/css/bootstrap.min.css'>
<script type='text/javascript' src='../webjars/jquery/2.1.3/dist/jquery.min.js'> </script>
<script type='text/javascript' src='../webjars/bootstrap/3.3.4/dist/js/bootstrap.min.js'> </script>
<nav class="navbar navbar-inverse">
  <div class="container-fluid">
    <!-- Brand and toggle get grouped for better mobile display -->
    <div class="navbar-header">
      <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1">
        <span class="sr-only">Toggle navigation</span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
      </button>
      <a class="navbar-brand" href="#">${name}</a>
    </div>

    <!-- Collect the nav links, forms, and other content for toggling -->
    <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
      <ul class="nav navbar-nav">
        <!--  <li class="active"><a href="#">Manage Users<span class="sr-only">(current)</span></a></li>-->
        <li class="dropdown active">
          <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-expanded="false">Manage Users <span class="caret"></span></a>
          <ul class="dropdown-menu" role="menu">
            <li><a href="home">View Pending Requests</a></li>
            <li class="divider"></li>
            <li><a href="../flows/registerflow">Create User</a></li>
          </ul>
        </li>
        <li class="dropdown">
          <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-expanded="false">Manage Companies <span class="caret"></span></a>
          <ul class="dropdown-menu" role="menu">
            <li><a href="viewCompanies">View</a></li>
            <li class="divider"></li>
            <li><a href="createCompany">Add</a></li>
          </ul>
        </li>
      </ul>
      
      <form class="navbar-form navbar-left" role="search">
        <div class="form-group">
          <input type="text" class="form-control" placeholder="Search">
        </div>
        <button type="submit" class="btn btn-default">Submit</button>
      </form>
      <ul class="nav navbar-nav navbar-right">
        <li><a href="<c:url value='/j_spring_security_logout' />"> Logout</a></li>
      </ul>
    </div><!-- /.navbar-collapse -->
  </div><!-- /.container-fluid -->
</nav>