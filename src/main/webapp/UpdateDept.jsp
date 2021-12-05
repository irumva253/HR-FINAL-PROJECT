<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*" %>
<%! String driverName = "com.mysql.jdbc.Driver";%>
<%!String url = "jdbc:mysql://localhost:3306/hrm";%>
<%!String user = "root";%>
<%!String psw = "";%>
<%
String id = request.getParameter("id");
String dpt_name=request.getParameter("dpt_name");
String hod=request.getParameter("hod");
String description=request.getParameter("description");

if(id != null)
{
Connection con = null;
PreparedStatement ps = null;
int personID = Integer.parseInt(id);
try
{
Class.forName(driverName);
con = DriverManager.getConnection(url,user,psw);
String sql="Update department set dpt_id=?, hod=?,description=? where dpt_id="+id;
ps = con.prepareStatement(sql);
ps.setString(1, id);
//ps.setString(2, dpt_name);
ps.setString(2, hod);
ps.setString(3, description);

int i = ps.executeUpdate();
if(i > 0)
{
out.print("DEPARTMENT UPDATED SUCCESSFULLY");
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