package com.jy.aboutme.devel;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.jy.aboutme.devel.model.DevelPARAM;

@Service
public class DevelService {

	@Autowired
	private DevelMapper mapper;
	
	public int insDevel(DevelPARAM param) {
		return mapper.insDevel(param);
	}
	
}
