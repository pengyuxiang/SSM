package com.controller;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.jms.Session;
import javax.servlet.http.HttpServletRequest;
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

import com.model.Admin;
import com.model.User;
import com.service.AdminService;
import com.service.UserService;


@Controller 
public class AdminController {
	
	@Resource
	private AdminService adminservice;
	public void setAdminservice(AdminService adminservice) {
		this.adminservice = adminservice;
	}	
	
	@RequestMapping(value="/login",method=RequestMethod.GET)
	public String login(Model model){
		model.addAttribute(new User());
		
		return "/main";
	}
	@RequestMapping(value="/login",method=RequestMethod.POST)
	public String login(@RequestParam String name,
			@RequestParam String password,HttpSession httpsession){
		System.out.println("asas");
		System.out.println(name);
		List<Admin> list=adminservice.selectByExample();
		System.out.println("size"+list.size());
		for(int i=0;i<list.size();i++){
					if(name.equals(list.get(i).getA_name())
						&&password.equals(list.get(i).getPassword())){
						httpsession.setAttribute("name", name);
						httpsession.setAttribute("password", password);
						
						return "/index.1";
					}
			}
		return null;
	}
	
	
	@RequestMapping(value="/addteacher")
	public String addteacher(Admin a){
		System.out.println("pppppp"+a.getA_name());
		adminservice.insert(a);
		return "/index";
	}
	@RequestMapping(value="/updateteacher")
	public String updateteacher(Admin a){
		adminservice.updateByPrimaryKey(a);
		return "/index";
	}
	@RequestMapping(value="/deleteteacher")
	public @ResponseBody Admin deleteAdmin(@RequestParam int id){
		System.out.println("lll");
		adminservice.deleteByPrimaryKey(id);
		return null;
	}

		
	@RequestMapping(value="/teacherjson")
		@ResponseBody					
		public   Map<String,Object> teacherjson(){
			Map<String,Object> mm=new HashMap<String,Object>();
			List<Admin> list=adminservice.Adminwith_UserResultMap(null);
			mm.put("rows", list);
			mm.put("total", list.size());
			
			return mm;
		}
	@RequestMapping(value="/loginout")
	public String loginout(HttpServletRequest request){
		request.getSession().invalidate();
		return "main";
	}
	
}
