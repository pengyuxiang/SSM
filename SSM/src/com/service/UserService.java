package com.service;

import java.util.List;
import java.util.Map;

import com.model.User;

public interface UserService {
	public int usernum();
    public void insert(User u);
    public void update(User u);
    public User selectByPrimaryKey(int id);
    public List<User> UserWithAdminSelectByExample(Map<String, Object> map);
    public List<User> selectByExample();
    public List selectall();
    public void delete(int id);
}
