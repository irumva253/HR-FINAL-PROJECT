
public class Update_employee {
 protected String fname,lname,address,national_id,phone,dpt,basic_salary,designation;

public Update_employee() {
	super();
	// TODO Auto-generated constructor stub
}

public Update_employee(String fname, String lname, String address, String national_id, String phone, String dpt,
		String basic_salary, String designation) {
	super();
	this.fname = fname;
	this.lname = lname;
	this.address = address;
	this.national_id = national_id;
	this.phone = phone;
	this.dpt = dpt;
	this.basic_salary = basic_salary;
	this.designation = designation;
}

public String getFname() {
	return fname;
}

public void setFname(String fname) {
	this.fname = fname;
}

public String getLname() {
	return lname;
}

public void setLname(String lname) {
	this.lname = lname;
}

public String getAddress() {
	return address;
}

public void setAddress(String address) {
	this.address = address;
}

public String getNational_id() {
	return national_id;
}

public void setNational_id(String national_id) {
	this.national_id = national_id;
}

public String getPhone() {
	return phone;
}

public void setPhone(String phone) {
	this.phone = phone;
}

public String getDpt() {
	return dpt;
}

public void setDpt(String dpt) {
	this.dpt = dpt;
}

public String getBasic_salary() {
	return basic_salary;
}

public void setBasic_salary(String basic_salary) {
	this.basic_salary = basic_salary;
}

public String getDesignation() {
	return designation;
}

public void setDesignation(String designation) {
	this.designation = designation;
}
 
}
