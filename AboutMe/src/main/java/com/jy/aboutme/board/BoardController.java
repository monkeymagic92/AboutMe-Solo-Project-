package com.jy.aboutme.board;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.jy.aboutme.Pagination;
import com.jy.aboutme.ViewRef;
import com.jy.aboutme.board.model.BoardDMI;
import com.jy.aboutme.board.model.BoardPARAM;

@Controller
@RequestMapping("/board")
public class BoardController {
	
	@Autowired
	private BoardService service;
	
	
	// 게시글 전체 목록
	@RequestMapping(value="/list", method = RequestMethod.GET)
	public String boardList(BoardDMI dmi,
			 @RequestParam(defaultValue="1") int curPage, BoardPARAM param,
			 HttpServletRequest request,
			 Model model, Pagination p) {
		
		
		
		if(param.getSearchResult() == 0) { // 전체 글
			// 전체리스트 개수
	        int listCnt = service.totalBoardCount();
	        Pagination pagination = new Pagination(listCnt, curPage);
	        dmi.setStartIndex(pagination.getStartIndex());
	        dmi.setCntPerPage(pagination.getPageSize());
	        //
	        
	        model.addAttribute("totalCount", service.totalBoardCount());
	        model.addAttribute("listCnt", listCnt);
			model.addAttribute("pagination", pagination);
			model.addAttribute("data", service.boardList(pagination));
			
			model.addAttribute("view", ViewRef.BOARD_LIST);
			return ViewRef.DEFAULT_TEMP;
			
		} else if(param.getSearchResult() == 1) { // 제목 검색
			
			model.addAttribute("totalCount", service.countSearchTitle(param));
			model.addAttribute("data", service.searchTitle(param));
			model.addAttribute("view", ViewRef.BOARD_LIST);
			return ViewRef.DEFAULT_TEMP;
		
		} else { // 작성자 검색
			System.out.println("내용 검색");
			
			int result = service.countSearchNm(param);
			System.out.println("Controller result 값 : " + result);
			
			model.addAttribute("totalCount", service.countSearchNm(param));
			model.addAttribute("data", service.searchNm(param));
			model.addAttribute("view", ViewRef.BOARD_LIST);
			return ViewRef.DEFAULT_TEMP;
		}
		
	}
	
	
	
	// list 비밀게시글 
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
	
	
	// (summerNote에 연관되어있는 부트스트랩이랑 일반 css랑 겹쳐서 css 깨짐)
	// (DEFAULT_NOCHAT 으로 return값 날려서 챗기능 없앰)
	// 게시글 등록 / 수정	
	@RequestMapping(value="/reg", method = RequestMethod.GET)
	public String boardReg(Model model, BoardPARAM param, HttpServletRequest request) {
		
		try {	// 수정
			int i_board = Integer.parseInt(request.getParameter("i_board"));
			param.setI_board(i_board);
			
			
		} catch(Exception e) {  // 등록
			
			model.addAttribute("view", ViewRef.BOARD_REG);
			return ViewRef.DEFAULT_NOCHAT;	// summernote css랑 겹쳐서 챗 뺏음
			
		}
		
		model.addAttribute("data", service.boardDetail(param));
		model.addAttribute("view", ViewRef.BOARD_REG);
		return ViewRef.DEFAULT_NOCHAT;	// summernote css랑 겹쳐서 챗 뺏음
		
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
	public String boardDel(BoardPARAM param, HttpServletRequest request,
			BoardDMI dmi, RedirectAttributes ra) {
		int i_board_del = 0;
		String delPw = null;
		
		try {	// 일반유저가  삭제 눌렀을시
			i_board_del = Integer.parseInt(request.getParameter("i_board_del"));
			delPw = request.getParameter("delPw");
			
		} catch(Exception e) {	// try에서 받아오는값이 없다면 '관리자' 삭제메소드 실행
			System.out.println("에러");
			System.out.println("i_board값 : " + param.getI_board());
			int result = service.delBoard(param);
			return "redirect:/" + ViewRef.BOARD_LIST;
		}
		
		// 일반유저가 삭제처리할시 try -> catch건너띄고 이쪽으로옴
		param.setI_board(i_board_del);
		param.setPw(delPw);
		
		dmi = service.selScr(param);
		
		if(param.getPw().equals(dmi.getPw())) { // 비밀번호가 일치하다면 
			int result = service.delBoard(param);
			return "redirect:/" + ViewRef.BOARD_LIST;
			
		} else { // 비밀번호 틀렸다면
		
			ra.addFlashAttribute("scrFalse", "비밀번호를 다시 입력해 주세요");
			return "redirect:/board/detail?i_board="+param.getI_board();
		}
		
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

