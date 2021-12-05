<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">
    <link rel="icon" href="../../favicon.ico">

    <title>HRM</title>

    <!-- Bootstrap core CSS -->
    <link href="dist/css/bootstrap.min.css" rel="stylesheet">

    <!-- Custom styles for this template -->
    <link href="css/dashboard.css" rel="stylesheet">

    <!-- Just for debugging purposes. Don't actually copy these 2 lines! -->
    <!--[if lt IE 9]><script src="../../assets/js/ie8-responsive-file-warning.js"></script><![endif]-->
    <script src="assets/js/ie-emulation-modes-warning.js"></script>

    <!-- IE10 viewport hack for Surface/desktop Windows 8 bug -->
    <script src="assets/js/ie10-viewport-bug-workaround.js"></script>

    <!-- HTML5 shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!--[if lt IE 9]>
      <script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
      <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
    <![endif]-->
  </head>

  <body>
<%
response.setHeader("cache-control","no-cache,no-store,must-validate");//http 1.1
response.setHeader("progma", "no-cache");// HTTP 1.0
response.setHeader("Expires", "0");//proxies

if(session.getAttribute("uname")==null){
response.sendRedirect("Login.jsp");
}

%>
    <div class="navbar navbar-inverse navbar-fixed-top" role="navigation">
      <div class="container-fluid">
        <div class="navbar-header">
          <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse">
            <span class="sr-only">Toggle navigation</span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
          </button>
          <a class="navbar-brand" href="index.jsp">HR System</a>
        </div>
        <div class="navbar-collapse collapse">
          <ul class="nav navbar-nav navbar-right">
            <li><a href="index.jsp">Dashboard</a></li>
            
            <li><a href="#">${uname}</a></li>
            <li><a href="logout.jsp">Logout</a></li>
          </ul>
          <form class="navbar-form navbar-right">
            <input type="text" class="form-control" placeholder="Search...">
          </form>
        </div>
      </div>
    </div>

    <div class="container-fluid">
      <div class="row">
        <div class="col-sm-3 col-md-2 sidebar">
          <ul class="nav nav-sidebar">
            <li class="active"><a href="index.jsp">Dashboard</a></li>
            <li><a href="add_employee.jsp">Employee</a></li>
            <li><a href="department.jsp">Department</a></li>
            <li><a href="job_profile.jsp">Job Profile</a></li>
          </ul>
          <ul class="nav nav-sidebar">
            <li><a href="attendance.jsp">Attendance</a></li>
            <li><a href="leave.jsp">Leave</a></li>
            <li><a href="payment.jsp">Payment</a></li>
            <li><a href="addUser.jsp">Users</a></li>
          </ul>
        </div>
        <div class="col-sm-9 col-sm-offset-3 col-md-4 col-md-offset-2 main">
          
            <h3>Update Department</h3>

       <!--  Form -->
<form role="form" action="UpdateDept.jsp" method="post">
<%
String id = request.getParameter("id");
String driver = "com.mysql.cj.jdbc.Driver";
String connectionUrl = "jdbc:mysql://localhost:3306/";
String database = "hrm";
String userid = "root";
String password = "";
try {
Class.forName(driver);
} catch (ClassNotFoundException e) {
e.printStackTrace();
}
Connection connection = null;
Statement statement = null;
ResultSet resultSet = null;
%>

<%
try{
connection = DriverManager.getConnection(connectionUrl+database, userid, password);
statement=connection.createStatement();
String sql ="select * from department where dpt_id="+id;
resultSet = statement.executeQuery(sql);
while(resultSet.next()){
%>
 
<input type="hidden" name="id" class="form-control" value="<%=resultSet.getString("dpt_id") %>">
  <div class="form-group">
    <label for="exampleInputfname">Department Name</label>
    <input type="text" class="form-control" id="dpt_name" name="hod" value="<%=resultSet.getString("dpt_name") %>" disabled>
  </div>
  <div class="form-group">
    <label for="exampleInputfname">Head Of Department</label>
    <input type="text" class="form-control" id="hod" name="hod" value="<%=resultSet.getString("hod") %>">
  </div>
    <div class="form-group">
    <label for="exampleInputlname">Description</label>
    <input type="text" class="form-control" id="description" name="description" value="<%=resultSet.getString("description") %>">
  </div>
<button type="submit" class="btn btn-primary" value="submit">Save changes</button>
       <!-- End form --> 
     
  </div> 
</div>
	<% 											}
connection.close();
} catch (Exception e) {
e.printStackTrace();
}
%>		
	
</form>
</div>

    

    <!-- Bootstrap core JavaScript
    ================================================== -->
    <!-- Placed at the end of the document so the pages load faster -->
    <script src="js/jquery.min.js"></script>
    <script src="dist/js/bootstrap.min.js"></script>
    <script src="assets/js/docs.min.js"></script>
  </body>
</html>
    