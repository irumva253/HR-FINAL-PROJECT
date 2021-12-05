
<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@page import="java.io.File"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.io.ByteArrayOutputStream"%>
<%@page import="java.io.InputStream"%>
<%@page import="java.util.Base64"%>
<%@page import="java.sql.Blob"%>
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
         Add New Employee
       </button></h3>

<!-- Modal -->
<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span><span class="sr-only">Close</span></button>
        <h4 class="modal-title" id="myModalLabel">Add Employee</h4>
      </div>
      <div class="modal-body">
       <!--  Form -->
 <form role="form" action="add_employee" method="post" enctype="multipart/form-data">
  <div class="form-group">
  
    <label for="exampleInputfname">First Name</label>
    <input type="text" class="form-control" id="fname" name="fname" placeholder="First Name">
  </div>
    <div class="form-group">
    <label for="exampleInputlname">Last Name</label>
    <input type="text" class="form-control" id="lname" name="lname" placeholder="Last Name">
  </div>
    <div class="form-group">
    <label for="exampleInputlname">Address</label>
    <input type="text" class="form-control" id="address" name="address" placeholder="Address">
  </div>
     <div class="form-group">
    <label for="exampleBdate">Birth Date</label>
    <input type="date" class="form-control" id="dob" name="dob">
  </div>
    <div class="form-group">
    <label for="exampleNID">National ID</label>
    <input type="number" class="form-control" id="nid" name="national_id" placeholder="NID">
  </div>
    <div class="form-group">
    <label for="exampleContact">Contact Info</label>
    <input type="number" class="form-control" id="phone" name="phone" placeholder=" +250 ">
  </div>
  <div class="form-group">
    <label for="exampleFormControlSelect1">Gender</label>
    <select class="form-control" id="gender" name="gender">
      <option value="selected">Select Gender</option>
      <option value="Male">Male</option>
      <option value="Female">Female</option>
    </select>
  </div>
  <div class="form-group">
    <label for="exampleFormControlSelect1">Department</label>
    <select class="form-control" id="dpt" name="dpt">
      <option value="selected">Select Department</option>
      <option value="IT">IT</option>
      <option value="Sales">Sales</option>
      <option value="Cashier">Cashier</option>
    </select>
  </div>
    <div class="form-group">
    <label for="exampleFormControlSelect1">Confirmation</label>
    <select class="form-control" id="conf" name="confirmation">
      <option value="selected">Select Confirmation</option>
      <option value="Casual">Casual </option>
      <option value="Permanent">Permanent</option>
    </select>
  </div>
    <div class="form-group">
    <label for="examplesalary">Basic Salary</label>
    <input type="number" class="form-control" id="salary" name="basic_salary" placeholder=" Basic Salary ">
  </div>
    <div class="form-group">
    <label for="exampleCDesignation">Designation</label>
    <input type="text" class="form-control" id="des" name="designation" placeholder=" Designation ">
  </div>
<div class="form-group">
    <label for="exampleFile">Photo</label>
    <input type="file" class="form-control" id="photo" name="photo" placeholder=" Designation ">
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
                  <th>Confirmation</th>
                  <th>Address</th>
                  <th>Department</th>
                  <th>Photo</th>  
                  <th>Action</th>
                </tr>
              </thead>
              <tbody>
                <tr>
                <%
                  try {
                    String id=request.getParameter("id");
                	Class.forName("com.mysql.cj.jdbc.Driver");
                	Connection conn=DriverManager.getConnection("jdbc:mysql://localhost:3306/hrm","root","");
                	String Query="SELECT * FROM employee";
                	Statement stm=conn.createStatement();
                	ResultSet rs=stm.executeQuery(Query);
                	while(rs.next())
                	{
                		Blob blob = rs.getBlob("photo");
                	    
                	    InputStream inputStream = blob.getBinaryStream();
                	    ByteArrayOutputStream outputStream = new ByteArrayOutputStream();
                	    byte[] buffer = new byte[4096];
                	    int bytesRead = -1;
                	     
                	    while ((bytesRead = inputStream.read(buffer)) != -1) {
                	        outputStream.write(buffer, 0, bytesRead);                  
                	    }
                	     
                	    byte[] imageBytes = outputStream.toByteArray();
                	    String base64Image = Base64.getEncoder().encodeToString(imageBytes);
                	     
                	     
                	    inputStream.close();
                	    outputStream.close();
                	%>
                         <td><%=rs.getInt("emp_id") %></td>
                		 <td><%=rs.getString("fname") %></td>
                         <td><%=rs.getString("lname") %></td>
                         <td><%=rs.getString("phone") %></td>
                         <td><%=rs.getString("confirmation") %></td>
                         <td><%=rs.getString("address") %></td>
                         <td><%=rs.getString("dpt") %></td>
                         <td><img src="data:image/jpg;base64,<%=base64Image%>" style="width:50px;height:50px;" alt="..." /></td>
                         <td>                         
                         <a href="Update_Employee.jsp?id=<%=rs.getString("emp_id")%>" class="btn btn-primary">Update</a>
                         <a href="delete_employee.jsp?id=<%=rs.getString("emp_id")%>"  class="btn btn-danger">Delete</a>
                         </td>
                         </tr>               		
                        <%
                        File f = new File("/images/");

                        File[] list = f.listFiles();%>
                        
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
    