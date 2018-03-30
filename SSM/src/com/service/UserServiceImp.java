package com.service;


import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.mapper.UserMapper;
import com.model.User;
import com.model.UserExample;
@Service
@Transactional
public class UserServiceImp implements UserService{
@Resource
private UserMapper um;

public UserMapper getUm() {
	return um;
}
public void setUm(UserMapper um) {
	this.um = um;
}
	public void insert(User u) {
		um.insert(u);
		
	}
	
	public void update(User u) {
		um.updateByPrimaryKey(u);
	}
	public User selectByPrimaryKey(int id) {
		User list=um.selectByPrimaryKey(id);
		return list;
	}
	public List selectall() {
		/*UserExample userExample=new UserExample();
		UserExample.Criteria criteria=userExample.createCriteria();
		
		criteria.andNameEqualTo("p%");
		List<User> list=um.selectByExample(userExample);*/
		
		List<User> l=um.selectall();
		return l;
	}
	public void delete(int id) {
		um.deleteByPrimaryKey(id);
		
	}
	public List<User> selectByExample() {
		List<User> list=um.selectByExample(null);
		return list;
	}
	public List<User> UserWithAdminSelectByExample(Map<String, Object> map) {
		List<User> list=um.UserWithAdminSelectByExample(map);
		System.out.println("list"+list);
		//System.out.println(list.get(0).getAdmin().getA_name());
		return list;
	}
	public int usernum() {
		
		return um.usernum();
	}
	


}
