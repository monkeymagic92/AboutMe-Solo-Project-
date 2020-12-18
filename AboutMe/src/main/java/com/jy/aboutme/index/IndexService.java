package com.jy.aboutme.index;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.jy.aboutme.index.model.HistoryDMI;
import com.jy.aboutme.index.model.HistoryVO;

@Service
public class IndexService {
	
	@Autowired
	private IndexMapper mapper;
	
	// ip 뿌리기
	public int selIp(HistoryVO vo) {
		int result = 0;
		HistoryDMI dmi = new HistoryDMI();
		
		dmi = mapper.selIp(vo);
		try {
			if(dmi == null) {
				result = 1;
				return result;
				
			} else {
				result = 0;
				return result;
			}
			
		} catch(Exception e) {
			result = 0;
		}
		
		return result;
		
	}
	
	// ip 저장
	public int insIpIndex(HistoryVO vo) {
		
		return mapper.insIpIndex(vo);
		
	}
	
	// intro ip 저장
	public int insIpIntro(HistoryVO vo) {
		
		return mapper.insIpIntro(vo);
		
	}
	
}
