package com.jy.aboutme.admin;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.jy.aboutme.admin.model.AdminDMI;
import com.jy.aboutme.admin.model.AdminPARAM;

@Service
public class AdminService {

	@Autowired
	private AdminMapper mapper;
	
	public int selAdmin(AdminPARAM param, HttpSession hs) {
		int result = 0;
		
		AdminDMI dmi = mapper.selAdmin(param);
		String dmi_id = dmi.getUser_id();
		String dmi_pw = dmi.getUser_pw();
		
		
		if(param.getUser_id().equals(dmi_id) && param.getUser_pw().equals(dmi_pw)) {
			param.setI_user(dmi.getI_user());
			param.setUser_id(dmi_id);
			param.setNm(dmi.getNm());
			param.setUser_pw(null);
			
			hs.setAttribute("loginUser", param);
			
			result = 1;
			
		} else {
			
			result = 0;
		}
		
		return result;
		
	}
	
	
}
