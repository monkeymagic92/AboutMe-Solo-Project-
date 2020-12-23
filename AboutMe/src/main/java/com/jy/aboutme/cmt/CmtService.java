package com.jy.aboutme.cmt;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class CmtService {
	
	@Autowired
	private CmtMapper mapper;
}
