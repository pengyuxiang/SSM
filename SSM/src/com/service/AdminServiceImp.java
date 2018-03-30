package com.service;


import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.mapper.AdminMapper;
import com.mapper.UserMapper;
import com.model.Admin;
import com.model.User;
import com.model.UserExample;
@Service
@Transactional
public class AdminServiceImp implements AdminService{
@Resource
private AdminMapper ad;
public AdminMapper getAd() {
	return ad;
}


//查询所有老师
public List<Admin> alladmin() {
	List<Admin> l=ad.selectByExample(null);
	return l;
	
}


public List<Admin> Adminwith_UserResultMap(Map<String, Object> map) {
	List<Admin> ll=ad.Adminwith_UserResultMap(map);
	return ll;
}


public void insert(Admin a) {
	
	ad.insert(a);
	}


public void updateByExample(Admin a) {
	ad.updateByExample(a);
	
}


public void updateByPrimaryKey(Admin a) {
	
	ad.updateByExample(a);
}


public void deleteByPrimaryKey(int id) {
	ad.deleteByPrimaryKey(id);
	
}


public List<Admin> selectByExample() {
	List<Admin> li=ad.selectByExample(null);
	return li;
}



}
