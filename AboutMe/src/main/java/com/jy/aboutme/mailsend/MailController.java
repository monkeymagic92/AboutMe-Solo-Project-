package com.jy.aboutme.mailsend;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.jy.aboutme.mail.MailSendService;
import com.jy.aboutme.mail.model.MailPARAM;

@Controller
@RequestMapping("/mail")
public class MailController {

	@Autowired
	private MailSendService mss;
	
	@RequestMapping(value="/mailSend", method=RequestMethod.POST)
	public @ResponseBody String insChat(@RequestBody MailPARAM param) {
		
		int result = 0;
		try {
			mss.sendAutoMailFindPw(param);
			result = 1;
			return String.valueOf(result);
			
		} catch(Exception e) {
			result = 0;
			return String.valueOf(result);
		}
	}
}
