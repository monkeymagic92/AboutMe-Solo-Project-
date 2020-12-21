package com.jy.aboutme.board;

import javax.servlet.http.HttpServletRequest;

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
		
		model.addAttribute("data", service.boardList());
		model.addAttribute("view", ViewRef.BOARD_LIST);
		return ViewRef.DEFAULT_TEMP;
	}
	
	// list 검색 관련 
	@RequestMapping(value="/list", method = RequestMethod.POST)
	public String list(Model model, BoardPARAM param) {
		
		
		return "redirect:/" + ViewRef.BOARD_LIST;
	}
	
	
	// 게시글 등록 / 수정
	@RequestMapping(value="/reg", method = RequestMethod.GET)
	public String boardReg(Model model, BoardPARAM param, HttpServletRequest request) {
		
		try {
			int i_board = Integer.parseInt(request.getParameter("i_board"));
			param.setI_board(i_board);
			
		} catch(Exception e) {
			
			model.addAttribute("view", ViewRef.BOARD_REG);
			return ViewRef.DEFAULT_TEMP;
			
		}
		
		model.addAttribute("data", service.boardDetail(param));
		model.addAttribute("view", ViewRef.BOARD_REG);
		return ViewRef.DEFAULT_TEMP;
		
	}
	
	@RequestMapping(value="/reg", method = RequestMethod.POST)
	public String boardReg(BoardPARAM param) {
		System.out.println("scr값 : " + param.getScr());
		int result = service.insReg(param);
		
		return "redirect:/" + ViewRef.BOARD_LIST;
	}
	
	
	// 게시글 상세페이지
	@RequestMapping(value="/detail", method = RequestMethod.GET)
	public String boardDetail(BoardPARAM param, Model model) {
		
		model.addAttribute("data", service.boardDetail(param));
		model.addAttribute("view", ViewRef.BOARD_DETAIL);
		return ViewRef.DEFAULT_TEMP;
	}
	
	@RequestMapping(value="/detail", method = RequestMethod.POST)
	public String boardDetail(BoardPARAM param) {
		
		return "";
	}
	
	
	
	
	
	
	
	// 테스트 안되면 지우기
	@RequestMapping(value="/test", method = RequestMethod.GET)
	public String test(Model model, BoardPARAM param) {
		param.setI_board(1);
		param = service.test(param);
		model.addAttribute("ctnt", param);
		
		
		return "board/test";
	}
	
	
	
	
}
