package com.controller;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.ObjectError;
import org.springframework.validation.annotation.Validated;

import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.model.User;
import com.service.UserService;


@Controller 
public class UserController {
	
	@Resource
	private UserService userservice;
	
	public UserService getUserservice() {
		return userservice;
	}
	public void setUserservice(UserService userservice) {
		this.userservice = userservice;
	}
@RequestMapping(value="/list")
	public String list(Model model,User user){
		
		//user=(User) userservice.selectByPrimaryKey(1);
		List l=userservice.selectall();
		model.addAttribute("user", l);
		//session.setAttribute("user", l);
		
		return "list";
		
	}
	
		
		@RequestMapping(value="/adduser")
		public String adduser(User u){
			System.out.println("name"+u.getName());

			userservice.insert(u);
			
			return "/index";
		}
		
		@RequestMapping(value="updateuser")
		@ResponseBody
		public String update(User u){
			System.out.println(u.getId()+u.getName()+u.getPassword()+u.getAdminid()+u.getPhone());
			userservice.update(u);
			
			return null;
		}
		@RequestMapping(value="/deleteuser")
		public @ResponseBody User deleteuser(@RequestParam int id){
			userservice.delete(id);
			
			return null;
		}
		//key value
		
		@RequestMapping(value="/responsejson")
		@ResponseBody					//datagrid自动给后台传rows page，@Param没有绑定参数，获取时为NULL
		public  Map<String,Object> responsejson(@RequestParam String  rows,@RequestParam String  page){
			//定义Map 传给mapper.xml用 parameterType="map" 则可以用#{page}, #{rows}
			Map<String,Object> map=new HashMap<String,Object>();
			map.put("rows", Integer.parseInt(rows));
			map.put("page", (Integer.parseInt(page)-1)*Integer.parseInt(rows));
			System.out.println("pageeee"+page);
			System.out.println("rowssss"+rows);
			Map<String,Object> mm=new HashMap<String,Object>();
			
			List<User> list=userservice.UserWithAdminSelectByExample(map);
			
			//System.out.println(list.get(0).getAdmin());
			mm.put("rows", list);
			//total值+10   大概是因为前台ROWS固定为5 所以不会检索后面的数据
			mm.put("total", list.size()+10);
			System.out.println("list.size()"+list.size());
			
			
			return mm;
		}
	
}
