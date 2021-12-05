import java.io.BufferedReader;
import java.io.BufferedWriter;
import java.io.FileOutputStream;
import java.io.FileWriter;
import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

public class DatabaseConnection {
	private String dburl="jdbc:mysql://localhost:3306/hrm";
	private String dbuser="root";
	private String dbpassword="";
	private String dbDriver="com.mysql.cj.jdbc.Driver";
	
	//codes to load driver of mysql connector
	public void loadDriver(String dbDriver) {
		try {
			Class.forName(dbDriver);
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	// creating connection for database
	public Connection getConnection() {
		Connection con=null;
		try {
			con=DriverManager.getConnection(dburl,dbuser,dbpassword);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return con;
		
	}
	public boolean CheckCredentials(String uname,String passwd) {
		loadDriver(dbDriver);
		Connection con=getConnection();

		String query="SELECT * FROM users WHERE uname=? AND passwd=?";

		PreparedStatement ps=null;
		try {
		ps=con.prepareStatement(query);

		ps.setString(1, uname);
		ps.setString(2, passwd);
		
		ResultSet rs=ps.executeQuery();

		if(rs.next()) {
		return  true;
		}
		} catch (SQLException e) {
		// TODO Auto-generated catch block
		e.printStackTrace();
		}

		return false;
	}
	
	 public boolean updateEmp(Update_employee emp) throws SQLException {
		    loadDriver(dbDriver);
			Connection con=getConnection();
	        String sql = "UPDATE employee SET fname = ?, lname = ?, address = ?, national_id = ?, phone= ?, dpt= ?, basic_salary= ?, designation= ?";
	        sql += " WHERE emp_id = ?";
	       // connect();	         
	     //   Connection jdbcConnection = null;

	        PreparedStatement statement = con.prepareStatement(sql);
	        statement.setString(1, emp.getFname());
	        statement.setString(2, emp.getLname());
	        statement.setString(3, emp.getAddress());
	        statement.setString(4, emp.getNational_id());
	        statement.setString(5, emp.getPhone());
	        statement.setString(6,emp.getDpt());     
            statement.setString(7, emp.getBasic_salary());
            statement.setString(8, emp.getDesignation());	  
	        
	       boolean rowUpdated = statement.executeUpdate() > 0;
	        statement.close();
	       // disconnect();
	       return rowUpdated;     
	    }
	 
     
	
	// ADD ATTENDANCE
	 public String AddAttendance(Attendance add) {
			loadDriver(dbDriver);
			Connection con=getConnection();
			String query="INSERT INTO attendance VALUES(?,?,?,?)";
					
			String message="ATTENDANCE ADDED";		
			PreparedStatement ps;
			//PreparedStatement ps=null;
			try {
				ps=con.prepareStatement(query);
				ps.setString(1, null);
				ps.setInt(2,add.getEmp_id());
				ps.setString(3,add.getDate());	
				ps.setString(4,add.getStatus());
				ps.executeUpdate();
			} catch (Exception e) {
						
				//JOptionPane.showMessageDialog(rootPane, e);
				message=e.toString();
				e.printStackTrace();
			}
			return message;
		}
	
	// ADD DEPARTMENT 
	 
	public String AddDept(AddDepartment add_dept) {
		loadDriver(dbDriver);
		Connection con=getConnection();
		String query="INSERT INTO department VALUES(?,?,?,?)";
				
		String message="DEPARTMENT ADDED";
		
		PreparedStatement ps;
		//PreparedStatement ps=null;
		try {
			ps=con.prepareStatement(query);
			ps.setString(1, null);
			ps.setString(2,add_dept.getDpt_name());	
			ps.setString(3, add_dept.getHod());
			ps.setString(4, add_dept.getDescription());
			ps.executeUpdate();
		} catch (Exception e) {
					
			//message="Failed to save!";
			message=e.toString();
			e.printStackTrace();
		}
		return message;
	}
	
	
	public String AddDept(Users us) {
		loadDriver(dbDriver);
		Connection con=getConnection();
		String query="INSERT INTO users VALUES(?,?,?)";
				
		String message="DEPARTMENT ADDED";
		
		PreparedStatement ps;
		//PreparedStatement ps=null;
		try {
			ps=con.prepareStatement(query);
			ps.setString(1, null);
			ps.setString(2, us.getUname());	
			ps.setString(3, us.getPasswd());

			ps.executeUpdate();
		} catch (Exception e) {
					
			//message="Failed to save!";
			message=e.toString();
			e.printStackTrace();
		}
		return message;
	}
}
	