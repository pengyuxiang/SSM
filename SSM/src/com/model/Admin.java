package com.model;

public class Admin {
    /**
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column admin.id
     *
     * @mbggenerated Fri Sep 29 12:43:20 CST 2017
     */
	
    private Integer id;

    /**
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column admin.name
     *
     * @mbggenerated Fri Sep 29 12:43:20 CST 2017
     */
    private String a_name;

    /**
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column admin.password
     *
     * @mbggenerated Fri Sep 29 12:43:20 CST 2017
     */
    private String password;
    private int uid;
    private User user; 
   
    public Integer getId() {
        return id;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column admin.id
     *
     * @param id the value for admin.id
     *
     * @mbggenerated Fri Sep 29 12:43:20 CST 2017
     */
    public void setId(Integer id) {
        this.id = id;
    }

    
    public String getA_name() {
		return a_name;
	}

	public void setA_name(String a_name) {
		this.a_name = a_name;
	}

	public String getPassword() {
        return password;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column admin.password
     *
     * @param password the value for admin.password
     *
     * @mbggenerated Fri Sep 29 12:43:20 CST 2017
     */
    public void setPassword(String password) {
        this.password = password == null ? null : password.trim();
    }

	public int getUid() {
		return uid;
	}

	public void setUid(int uid) {
		this.uid = uid;
	}

	public User getUser() {
		return user;
	}

	public void setUser(User user) {
		this.user = user;
	}
    
}