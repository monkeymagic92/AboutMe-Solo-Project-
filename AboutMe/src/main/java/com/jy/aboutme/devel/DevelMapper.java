package com.jy.aboutme.devel;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.jy.aboutme.devel.model.DevelPARAM;

@Mapper
public interface DevelMapper {

	List<DevelPARAM> selDevel();	// devel main 값 뿌리기
	
	int insDevel(DevelPARAM param);	// 오늘 할일 등록하기
	
	int updMain(DevelPARAM param);	// 체크 박스 체크하기
}
