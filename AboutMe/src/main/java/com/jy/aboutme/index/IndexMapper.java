package com.jy.aboutme.index;

import org.apache.ibatis.annotations.Mapper;

import com.jy.aboutme.index.model.HistoryDMI;
import com.jy.aboutme.index.model.HistoryVO;

@Mapper
public interface IndexMapper {
	
	HistoryDMI selIp(HistoryVO vo);
	
	int insIpIndex(HistoryVO vo); // ip 저장
	
	int insIpIntro(HistoryVO vo); // intro ip 저장
}
