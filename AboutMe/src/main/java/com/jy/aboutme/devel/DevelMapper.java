package com.jy.aboutme.devel;

import org.apache.ibatis.annotations.Mapper;

import com.jy.aboutme.devel.model.DevelPARAM;

@Mapper
public interface DevelMapper {

	int insDevel(DevelPARAM param);
}
