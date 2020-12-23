package com.jy.aboutme.cmt;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.jy.aboutme.cmt.model.CmtPARAM;

@Service
public class CmtService {
	
	@Autowired
	private CmtMapper mapper;
	
	public int insCmt(CmtPARAM param) {
		return mapper.insCmt(param);
	}
}
