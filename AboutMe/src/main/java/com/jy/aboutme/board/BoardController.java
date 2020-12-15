package com.jy.aboutme.board;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.jy.aboutme.ViewRef;
import com.jy.aboutme.board.model.BoardPARAM;


@Controller
@RequestMapping("/board")
public class BoardController {
	
	@Autowired
	private BoardService service;
	
	
	// 개발자 문의 list
	@RequestMapping(value="/list", method = RequestMethod.GET)
	public String list(Model model) {
		
		model.addAttribute("view", ViewRef.BOARD_LIST);
		return ViewRef.DEFAULT_TEMP;
	}
	
	
	// list 검색 관련 
	@RequestMapping(value="/list", method = RequestMethod.POST)
	public String list(Model model, BoardPARAM param) {
		
		
		return "redirect:/" + ViewRef.BOARD_LIST;
	}
}
