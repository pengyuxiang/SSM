package com.service;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.mapper.ExamMapper;
import com.model.Exam;
@Service
@Transactional
public class ExamServiceImp implements ExamService{
@Resource
	private ExamMapper em;
	public List<Exam> Examlist() {
		
		List<Exam> list=em.selectByExample(null);
		
		return list;
	}

}
