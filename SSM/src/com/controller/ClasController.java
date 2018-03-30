package com.controller;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.jms.Session;
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
import com.model.Clas;
import com.model.User;
import com.service.AdminService;
import com.service.ClasService;
import com.service.UserService;


@Controller 
public class ClasController {
	
	@Resource
	private ClasService classervice;
	@Resource
	private UserService userservice;
	@RequestMapping(value="/clasjson")
		@ResponseBody					
		public   Map<String,Object> clasjson(HttpSession hs){
		Map<String,Object> mm=new HashMap<String,Object>();
			List<Clas> list=classervice.clasjson();
			
			mm.put("rows",list);
			mm.put("total", list.size());
			//mm.put("sum", userservice.usernum());
			
			hs.setAttribute("sum", userservice.usernum());
		return mm;
		}
	
}
