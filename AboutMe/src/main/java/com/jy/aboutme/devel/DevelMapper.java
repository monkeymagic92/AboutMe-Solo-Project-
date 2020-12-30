package com.jy.aboutme.devel;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.jy.aboutme.devel.model.DevelPARAM;

@Mapper
public interface DevelMapper {

	List<DevelPARAM> selDevel();
	
	int insDevel(DevelPARAM param);
}
