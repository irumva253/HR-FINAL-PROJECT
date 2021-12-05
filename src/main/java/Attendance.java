
public class Attendance {
 private int emp_id;
 private String date,status;

public Attendance() {
	super();

}

public Attendance(String date, String status, int emp_id) {
	super();
	this.date = date;
	this.status = status;
	this.emp_id = emp_id;
}


public String getDate() {
	return date;
}

public void setDate(String date) {
	this.date = date;
}

public String getStatus() {
	return status;
}

public void setStatus(String status) {
	this.status = status;
}

public int getEmp_id() {
	return emp_id;
}

public void setEmp_id(int emp_id) {
	this.emp_id = emp_id;
}

}