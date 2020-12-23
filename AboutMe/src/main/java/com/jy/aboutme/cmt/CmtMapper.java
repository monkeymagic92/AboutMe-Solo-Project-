package com.jy.aboutme.cmt;

import org.apache.ibatis.annotations.Mapper;

import com.jy.aboutme.cmt.model.CmtPARAM;

@Mapper
public interface CmtMapper {

	int insCmt(CmtPARAM param);
}
