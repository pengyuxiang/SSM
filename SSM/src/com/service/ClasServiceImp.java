package com.service;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.mapper.ClasMapper;
import com.model.Clas;
@Service
@Transactional
public class ClasServiceImp implements ClasService{
@Resource
private ClasMapper cm;
	public List<Clas> clasjson() {
		List l=cm.selectByExample(null);
		return l;
	}

}
