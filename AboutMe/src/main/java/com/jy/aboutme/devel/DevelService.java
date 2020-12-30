package com.jy.aboutme.devel;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.jy.aboutme.devel.model.DevelPARAM;

@Service
public class DevelService {

	@Autowired
	private DevelMapper mapper;
	
	public List<DevelPARAM> selDevel() {
		return mapper.selDevel();
	}
	
	
	public int insDevel(DevelPARAM param) {
		return mapper.insDevel(param);
	}
	
}
