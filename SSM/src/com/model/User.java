package com.model;

import javax.validation.constraints.Size;

import org.hibernate.validator.constraints.NotEmpty;
public class User {
    private Integer id;

    //@NotEmpty(message="{user.name.length.error}")
    private String name;

    //@Size(min=1,max=10,message="{user.password.notnull}")
    private String password;

    private Integer phone;

    private Integer adminid;
    
    private Admin admin; 
    private Clas clas;

   
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public Integer getPhone() {
		return phone;
	}
	public void setPhone(Integer phone) {
		this.phone = phone;
	}
	public Integer getAdminid() {
		return adminid;
	}
	public void setAdminid(Integer adminid) {
		this.adminid = adminid;
	}
	public Admin getAdmin() {
		return admin;
	}
	public void setAdmin(Admin admin) {
		this.admin = admin;
	}
	
	public Clas getClas() {
		return clas;
	}
	public void setClas(Clas clas) {
		this.clas = clas;
	}
	public User(){
    	super();
    }
    public User(int id,String name,String password,int phone,int adminid){
    	super();
    	this.id=id;
    	this.name=name;
    	this.password=password;
    	this.phone=phone;
    	this.adminid=adminid;
    }
    
    
}