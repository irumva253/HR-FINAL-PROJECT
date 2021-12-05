
import java.io.IOException;
import java.io.InputStream;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

/**
 * Servlet implementation class add_employee
 */
@WebServlet("/add_employee")
@MultipartConfig(maxFileSize = 16177215) 
public class add_employee extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private String url="jdbc:mysql://localhost:3306/hrm";
	 private  String user="root";
  private  String pass="";
  private String drivename="com.mysql.cj.jdbc.Driver";
 
    /**
     * @see HttpServlet#HttpServlet()
     */
    public add_employee() {
        super();
        // TODO Auto-generated constructor stub
    }

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String dpt=request.getParameter("dpt");
		String fname=request.getParameter("fname");
		String lname=request.getParameter("lname");
		String gender=request.getParameter("gender");
		String national_id=request.getParameter("national_id");
		String dob=request.getParameter("dob");
		String confirmation=request.getParameter("confirmation");
		String address=request.getParameter("address");
		String phone=request.getParameter("phone");	
		String designation=request.getParameter("designation");
		int basic_salary=Integer.parseInt(request.getParameter("basic_salary"));
		 InputStream inputStream = null; 
         
	        // obtains the upload file part in this multipart request
	        Part filePart = request.getPart("photo");
	        if (filePart != null) {
	            // prints out some information for debugging
	            System.out.println(filePart.getName());
	            System.out.println(filePart.getSize());
	            System.out.println(filePart.getContentType());
	             
	            // obtains input stream of the upload file
	            inputStream = filePart.getInputStream();
	        }
				

	  

	    
	       
	        Connection conn = null; // connection to the database
	        String message = null;  // message will be sent back to client
	         
	        try {
	            // connects to the database
	            DriverManager.registerDriver(new com.mysql.cj.jdbc.Driver());
	            conn = DriverManager.getConnection(url,user,pass);
	 
	            // constructs SQL statement
	            String sql = "INSERT INTO employee (emp_id,dpt,fname,lname,gender,national_id,dob,confirmation,address,phone,designation,basic_salary,photo)values(?,?,?,?,?,?,?,?,?,?,?,?,?)";
	            PreparedStatement statement = conn.prepareStatement(sql);
	            statement.setString(1, null);
	            statement.setString(2, dpt);
	            statement.setString(3, fname);
	            statement.setString(4, lname);
	            statement.setString(5, gender);
	            statement.setString(6, national_id);
	            statement.setString(7, dob);
	            statement.setString(8, confirmation);
	            statement.setString(9, address);
	            statement.setString(10, phone);
	            statement.setString(11, designation);
	            statement.setInt(12,  basic_salary);
	           
	                      
	       	            if (inputStream != null) {
	                // fetches input stream of the upload file for the blob column
	                statement.setBlob(13, inputStream);
	            }
	 
	            // sends the statement to the database server
	            int row = statement.executeUpdate();
	            if (row > 0) {
	                
	            	message = "File uploaded and saved into database";
	            }
	        } catch (SQLException ex) {
	            message = "ERROR: " + ex.getMessage();
	            ex.printStackTrace();
	        } finally {
	            if (conn != null) {
	                // closes the database connection
	                try {
	                    conn.close();
	                } catch (SQLException ex) {
	                    ex.printStackTrace();
	                }
	            }
	            request.setAttribute("Message", message);
	             
	            // forwards to the message page
	            getServletContext().getRequestDispatcher("/Message.jsp").forward(request, response);
	         
				
	        }
	}
}
		
	

