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
        <div class="col-sm-9 col-sm-offset-3 col-md-10 col-md-offset-2 main">
          <!-- Button trigger modal -->
          <h3> <button class="btn btn-primary btn-lg" data-toggle="modal" data-target="#myModal">
         Add Payment
       </button></h3>

<!-- Modal -->
<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span><span class="sr-only">Close</span></button>
        <h4 class="modal-title" id="myModalLabel">Add Payment</h4>
      </div>
      <div class="modal-body">
       <!--  Form -->
 <form role="form" action="add_attendance" method="post">
  <div class="form-group">
    <label for="exampleInputfname">Employee Name</label>
   <%
                  try {
                	Class.forName("com.mysql.cj.jdbc.Driver");
                	Connection conn=DriverManager.getConnection("jdbc:mysql://localhost:3306/hrm","root","");
                	String Query="SELECT * FROM employee";
                	Statement stm=conn.createStatement();
                	ResultSet rs=stm.executeQuery(Query);
                	%>
                 <select class="form-control">
                <% 	while(rs.next())
                	{
                	%>
                       
                       <option>
                        <%= rs.getString("emp_id")+" .... "+rs.getString("fname")+" "+rs.getString("lname") %>
                        </option>
                       
                	 <%
                	}
                %>
                 </select>
             <%     }
                catch(Exception ex){
                	out.println("Exception:" +ex.getMessage());
                	ex.printStackTrace(); 
                }      
                %>
                
  </div>
    <div class="form-group">
    <label for="exampleInputdate">Salary Date</label>
    <input type="date" class="form-control" id="lname" name="date" placeholder="Last Name">
  </div>
  
   <div class="form-group">
   <label for="exampleCDesignation">Basic Salary</label>
    <input type="number" class="form-control" id="" name="basic_salary" placeholder="Basic Salary">
  </div>
  
  
  
  <div class="form-group">
    <label for="exampleFormControlSelect1">Status</label>
    <select class="form-control" id="status" name="status">
      <option value="selected">--- Select Status ---</option>
      <option value="PAID">PAID</option>
      <option value="UNPAID">UNPAID</option>
    </select>
  </div>
   
 

       <!-- End form --> 
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-default" data-dismiss="modal" value="reset">Close</button>
        <button type="submit" class="btn btn-primary" value="submit">Save changes</button>
      </div>
    </div>  
  </div>
  </form>
</div>
          <h2 class="sub-header">Employee List</h2>
          <div class="table-responsive">
            <table class="table table-striped">
              <thead>
                <tr>
                  <th>#</th>
                  <th>First Name</th>
                  <th>Last Name</th>
                  <th>Contact info</th>
                  <th>Date</th>
                  <th>Status</th>
                </tr>
              </thead>
              <tbody>
                <tr>
                <%
                  try {
                	Class.forName("com.mysql.cj.jdbc.Driver");
                	Connection conn=DriverManager.getConnection("jdbc:mysql://localhost:3306/hrm","root","");
                	String Query="SELECT * FROM employee";
                	Statement stm=conn.createStatement();
                	ResultSet rs=stm.executeQuery(Query);
                	while(rs.next())
                	{
                	%>
                         <td><%=rs.getInt("emp_id") %></td>
                		 <td><%=rs.getString("fname") %></td>
                         <td><%=rs.getString("lname") %></td>
                         <td><%=rs.getString("phone") %></td>
                         <td>
                         </tr>               		
                        <%
                	}
                  }
                catch(Exception ex){
                	out.println("Exception:" +ex.getMessage());
                	ex.printStackTrace(); 
                }      
                %>
                
              </tbody>
            </table>
          </div>
        </div>
      </div>
    </div>

    <!-- Bootstrap core JavaScript
    ================================================== -->
    <!-- Placed at the end of the document so the pages load faster -->
    <script src="js/jquery.min.js"></script>
    <script src="dist/js/bootstrap.min.js"></script>
    <script src="assets/js/docs.min.js"></script>
  </body>
</html>
    