<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import="java.sql.*,java.util.*"%>
<%
String mm=request.getParameter("mm");
String date=request.getParameter("date");
String status=request.getParameter("status");
try
{
Class.forName("com.mysql.cj.jdbc.Driver");
Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/hrm", "root", "");
Statement st=conn.createStatement();
int i=st.executeUpdate("INSERT INTO attendance emp_id,date,status VALUES(?,?,?)");
String message="ATTENDANCE ADDED";		
PreparedStatement ps;
//PreparedStatement ps=null;
try {
	ps=con.prepareStatement(query);
	ps.setString(1, null);
	// ps.setInt(2,add.getEmp_id());
	ps.setString(2,mm);	
	ps.setString(3,date);
	ps.setString(4,status);
	ps.executeUpdate();
} catch (Exception e) {
			
	//JOptionPane.showMessageDialog(rootPane, e);
	message=e.toString();
	e.printStackTrace();
}
return message;
%>