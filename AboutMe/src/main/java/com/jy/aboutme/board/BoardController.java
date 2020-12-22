package com.jy.aboutme.board;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.jy.aboutme.ViewRef;
import com.jy.aboutme.board.model.BoardDMI;
import com.jy.aboutme.board.model.BoardPARAM;


@Controller
@RequestMapping("/board")
public class BoardController {
	
	@Autowired
	private BoardService service;
	
	
	// 개발자 문의 list
	@RequestMapping(value="/list", method = RequestMethod.GET)
	public String list(Model model, BoardPARAM param) {
		System.out.println("param 값 : " + param.getSearchResult());
		
		if(param.getSearchResult() == 0) { // 전체 글 
			model.addAttribute("data", service.boardList());
			
		} else if(param.getSearchResult() == 1) { // 제목 검색
			System.out.println("제목 검색");
			model.addAttribute("data", service.searchTitle(param));
		
		} else { // 작성자 검색
			System.out.println("내용 검색");
			model.addAttribute("data", service.searchNm(param));
			
		}
		
		model.addAttribute("view", ViewRef.BOARD_LIST);
		return ViewRef.DEFAULT_TEMP;
	}
	
	
	
	// list 검색 관련 
	@RequestMapping(value="/list", method = RequestMethod.POST)
	public String list(Model model, BoardPARAM param, BoardDMI dmi, RedirectAttributes ra) {
		System.out.println("list post ");
		
		dmi = service.selScr(param);
		if(param.getPw().equals(dmi.getPw())) { // 비밀번호가 일치하다면 
			
			return "redirect:/board/detail?i_board="+param.getI_board(); // 쿼리스트링으로 detail.get에 보냄
			
		} else { // 비밀번호 틀렸다면
			
			ra.addFlashAttribute("scrFalse", "비밀번호를 다시 입력해 주세요");
			
		}
		return "redirect:/" + ViewRef.BOARD_LIST;
		
	}
	
	
	// 게시글 등록 / 수정
	@RequestMapping(value="/reg", method = RequestMethod.GET)
	public String boardReg(Model model, BoardPARAM param, HttpServletRequest request) {
		
		try {	// 수정
			int i_board = Integer.parseInt(request.getParameter("i_board"));
			param.setI_board(i_board);
			
			
		} catch(Exception e) {  // 등록
			
			model.addAttribute("view", ViewRef.BOARD_REG);
			return ViewRef.DEFAULT_TEMP;
			
		}
		
		model.addAttribute("data", service.boardDetail(param));
		model.addAttribute("view", ViewRef.BOARD_REG);
		return ViewRef.DEFAULT_TEMP;
		
	}
	
	@RequestMapping(value="/reg", method = RequestMethod.POST)
	public String boardReg(BoardPARAM param, BoardDMI dmi, RedirectAttributes ra,
			HttpServletRequest request) {
		
		System.out.println("ㅡ reg postㅡ ");
		
		try { // 수정
			System.out.println("regPost 글수정");
			int i_board = Integer.parseInt(request.getParameter("i_board"));
			System.out.println("글수정 추후 에러안터졌을떄");
			param.setI_board(i_board);
			service.updReg(param);
			return "redirect:/board/detail?i_board="+param.getI_board();
			
			
		} catch(Exception e) { // 등록
			System.out.println("regPost 글등록");
			int i_board = service.insReg(param);
			System.out.println("i_boarㅇ값 ; " + i_board);
			System.out.println("i_board 값 (등록@@@) : " + param.getI_board());
			return "redirect:/board/detail?i_board="+param.getI_board();
		}
		
	
	}
	
	
	// 게시글 상세페이지
	@RequestMapping(value="/detail", method = RequestMethod.GET)
	public String boardDetail(BoardPARAM param, Model model) {
		
		System.out.println("디테 겟 board : " + param.getI_board());
		model.addAttribute("data", service.boardDetail(param));
		model.addAttribute("view", ViewRef.BOARD_DETAIL);
		return ViewRef.DEFAULT_TEMP;
	}
	
	
	@RequestMapping(value="/detail", method = RequestMethod.POST)
	public String boardDetail(BoardPARAM param, BoardDMI dmi,
			RedirectAttributes ra) {
		
		dmi = service.selScr(param);
		
		if(param.getPw().equals(dmi.getPw())) { // 비밀번호가 일치하다면 
		
			return "redirect:/board/reg?i_board="+param.getI_board(); // 쿼리스트링으로 detail.get에 보냄
			
		} else { // 비밀번호 틀렸다면
		
			ra.addFlashAttribute("scrFalse", "비밀번호를 다시 입력해 주세요");
			return "redirect:/board/detail?i_board="+param.getI_board();
		}
	}
	
	
	// 게시글 삭제
	@RequestMapping(value="/del", method = RequestMethod.GET)
	public String boardDel(BoardPARAM param) {
		System.out.println("삭제 board : " + param.getI_board());
		System.out.println("입력 pw : " + param.getPw());
		
		int result = service.delBoard(param);
		
		return "redirect:/" + ViewRef.BOARD_LIST;
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

