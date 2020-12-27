package com.jy.aboutme.cmt;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.jy.aboutme.cmt.model.CmtDMI;
import com.jy.aboutme.cmt.model.CmtPARAM;

@Controller
@RequestMapping("/cmt")
public class CmtController {

	@Autowired
	private CmtService service;
	
	// 댓글 등록 / 수정
	@RequestMapping(value="/cmtReg", method=RequestMethod.POST)
	public @ResponseBody String cmtReg(@RequestBody CmtPARAM param) {
		 
		int result = service.insCmt(param);
		return String.valueOf(result); 
	}
	
	// 댓글 뿌리기
	@RequestMapping(value="/selCmt", method=RequestMethod.GET)
	private @ResponseBody List<CmtDMI> selCmt(Model model, CmtPARAM param, HttpServletRequest request, HttpSession hs){
		return service.selCmt(param);
	}
	
	// 댓글 갯수
	@RequestMapping(value="/selCmtCount", method=RequestMethod.GET)
	public @ResponseBody int selCmtCount(CmtPARAM param) {
		System.out.println("보드 페이지 값 : " + param.getI_board());
		
		return service.selCmtCount(param); 
	}
	
	// 댓글삭제 (아작스 X)
	@RequestMapping(value="/cmtDel", method = RequestMethod.POST)
	public String cmtDel(CmtPARAM param, CmtDMI dmi,
			RedirectAttributes ra) { 
		
		dmi = service.selCmtPw(param);
		if(dmi.getCmtPw().equals(param.getCmtPw())) {
			int result = service.delCmt(param);
			
		} else {
			ra.addFlashAttribute("cmtFalse", "비밀번호를 다시 확인해 주세요");
		}
		return "redirect:/board/detail?i_board="+param.getI_board();
	}
	
}
