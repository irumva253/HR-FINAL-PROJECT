
public class AddDepartment {
private String dpt_name,hod,description;

public AddDepartment() {
	super();	
}

public AddDepartment(String dpt_name, String hod, String description) {
	super();
	this.dpt_name = dpt_name;
	this.hod = hod;
	this.description = description;
}

public String getDpt_name() {
	return dpt_name;
}

public void setDpt_name(String dpt_name) {
	this.dpt_name = dpt_name;
}

public String getHod() {
	return hod;
}

public void setHod(String hod) {
	this.hod = hod;
}

public String getDescription() {
	return description;
}

public void setDescription(String description) {
	this.description = description;
}

}
