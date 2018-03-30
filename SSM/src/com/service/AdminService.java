package com.service;

import java.util.List;
import java.util.Map;

import com.model.Admin;
import com.model.User;

public interface AdminService {
	public List<Admin> selectByExample();
	public void deleteByPrimaryKey(int  id);
	public void updateByExample(Admin a);
	public void updateByPrimaryKey(Admin a);
    public List<Admin> alladmin();
    public void insert(Admin a);
	public List<Admin> Adminwith_UserResultMap(Map<String, Object> map);
}
