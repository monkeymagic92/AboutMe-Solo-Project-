package com.jy.aboutme.admin;

import org.apache.ibatis.annotations.Mapper;

import com.jy.aboutme.admin.model.AdminDMI;
import com.jy.aboutme.admin.model.AdminPARAM;

@Mapper
public interface AdminMapper {
	
	AdminDMI selAdmin(AdminPARAM param);
}
