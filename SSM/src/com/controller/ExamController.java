package com.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.model.Exam;
import com.service.ExamService;

@Controller
public class ExamController {
	@Resource
		private ExamService es;
	
	public void setEs(ExamService es) {
		this.es = es;
	}


	@RequestMapping(value="/examlist")
	@ResponseBody
		public List<Exam> list(HttpSession hs){
		
		 List<Exam> l=es.Examlist();
		System.out.println(l);
		 hs.setAttribute("lis", l);
		
			return l;
		}
	
	@RequestMapping(value="/examresult")
	@ResponseBody
		public int result(String[] result,HttpSession hs){
		System.out.println("result"+result.toString());
		List<Exam> ls=es.Examlist();
		ArrayList<String> l=new ArrayList<String>();
		int sum=0;
		for(int i=0;i<result.length;i++){
			l.add(result[i]);
			if(l.get(i).equals(ls.get(i).getAnwser())){
				sum++;
			}
		}
		System.out.println(sum);
		hs.setAttribute("sum", sum);
		
		return sum;
		}
				

}
