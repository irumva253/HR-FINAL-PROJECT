
public class AddEmployee {
   private String dpt, fname, lname, gender, national_id, dob, confirmation, address, phone, designation,photo;
   private int basic_salary;
public AddEmployee() {
	super();
	
}
public AddEmployee(String dpt, String fname, String lname, String gender, String national_id, String dob,
		String confirmation, String address, String phone, String designation, int basic_salary, String photo) {
	super();
	this.dpt = dpt;
	this.fname = fname;
	this.lname = lname;
	this.gender = gender;
	this.national_id = national_id;
	this.dob = dob;
	this.confirmation = confirmation;
	this.address = address;
	this.phone = phone;
	this.designation = designation;
	this.basic_salary = basic_salary;
	this.photo= photo;
}
public String getDpt() {
	return dpt;
}
public void setDpt(String dpt) {
	this.dpt = dpt;
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
public String getGender() {
	return gender;
}
public void setGender(String gender) {
	this.gender = gender;
}
public String getNational_id() {
	return national_id;
}
public void setNational_id(String national_id) {
	this.national_id = national_id;
}
public String getDob() {
	return dob;
}
public void setDob(String dob) {
	this.dob = dob;
}
public String getConfirmation() {
	return confirmation;
}
public void setConfirmation(String confirmation) {
	this.confirmation = confirmation;
}
public String getAddress() {
	return address;
}
public void setAddress(String address) {
	this.address = address;
}
public String getPhone() {
	return phone;
}
public void setPhone(String phone) {
	this.phone = phone;
}
public String getDesignation() {
	return designation;
}
public void setDesignation(String designation) {
	this.designation = designation;
}
public int getBasic_salary() {
	return basic_salary;
}
public void setBasic_salary(int basic_salary) {
	this.basic_salary = basic_salary;
}
public String getPhoto() {
	return photo;
}
public void setPhoto(String photo) {
	this.photo = photo;
}

}
