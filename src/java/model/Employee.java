package model;

public class Employee {
    private int id;
    private String name;
    private String jobRole;
    private String department;
    private String address;
    private String contactNumber;
    private String nic;
    private String homeContactNumber;
    private String img; 

    public Employee() {
    }

    public Employee(int id, String name, String jobRole, String department, String address, String contactNumber, String nic, String homeContactNumber, String img) {
        this.id = id;
        this.name = name;
        this.jobRole = jobRole;
        this.department = department;
        this.address = address;
        this.contactNumber = contactNumber;
        this.nic = nic;
        this.homeContactNumber = homeContactNumber;
        this.img = img;
    }

  
    public int getId() { return id; }
    public void setId(int id) { this.id = id; }
    
    public String getName() { return name; }
    public void setName(String name) { this.name = name; }
    
    public String getJobRole() { return jobRole; }
    public void setJobRole(String jobRole) { this.jobRole = jobRole; }
    
    public String getDepartment() { return department; }
    public void setDepartment(String department) { this.department = department; }
    
    public String getAddress() { return address; }
    public void setAddress(String address) { this.address = address; }
    
    public String getContactNumber() { return contactNumber; }
    public void setContactNumber(String contactNumber) { this.contactNumber = contactNumber; }
    
    public String getNic() { return nic; }
    public void setNic(String nic) { this.nic = nic; }
    
    public String getHomeContactNumber() { return homeContactNumber; }
    public void setHomeContactNumber(String homeContactNumber) { this.homeContactNumber = homeContactNumber; }

    public String getImg() { return img; }
    public void setImg(String img) { this.img = img; }
}
