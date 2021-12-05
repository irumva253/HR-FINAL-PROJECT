<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*" %>
<%! String driverName = "com.mysql.cj.jdbc.Driver";%>
<%!String url = "jdbc:mysql://localhost:3306/hrm";%>
<%!String user = "root";%>
<%!String psw = "";%>
<%
String id = request.getParameter("id");
String fname=request.getParameter("fname");
String lname=request.getParameter("lname");
String address=request.getParameter("address");
String national_id=request.getParameter("national_id");
String phone=request.getParameter("phone");
int basic_salary=Integer.parseInt(request.getParameter("basic_salary"));
String designation=request.getParameter("designation");
if(id != null)
{
Connection con = null;
PreparedStatement ps = null;
int pid = Integer.parseInt(id);
try
{
Class.forName(driverName);
con = DriverManager.getConnection(url,user,psw);
String sql="UPDATE employee SET emp_id=?, fname = ?, lname = ?, address = ?, national_id = ?, phone= ?, basic_salary= ?, designation= ? where emp_id="+id;
ps = con.prepareStatement(sql);
ps.setString(1, id);
ps.setString(2, fname);
ps.setString(3, lname);
ps.setString(4, address);
ps.setString(5, national_id);
ps.setString(6, phone);
ps.setInt(7, basic_salary);
ps.setString(8, designation);
int i = ps.executeUpdate();
if(i > 0)
{
out.print("EMPLOYEE UPDATED SUCCESSFULLY!");
}
else
{
out.print("There is a problem in updating Record.");
}
}
catch(SQLException sql)
{
request.setAttribute("error", sql);
out.println(sql);
}
}
%>