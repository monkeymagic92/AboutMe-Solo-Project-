package com.jy.aboutme.mail;

import java.io.UnsupportedEncodingException;
import java.util.Random;

import javax.mail.MessagingException;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSenderImpl;
import org.springframework.stereotype.Service;

import com.jy.aboutme.mail.model.MailPARAM;

@Service("mss")
public class MailSendService {
	@Autowired
	private JavaMailSenderImpl mailSender;
	private int size;
	
	
	// 인증번호 난수 생성 
	private String getKey(int size) {
		this.size = size;
		return getAutoCode();
	}
	
	private String getAutoCode() {
		Random random = new Random();
		StringBuffer buffer = new StringBuffer();
		int num = 0;
		
		while(buffer.length() < size) {
			num = random.nextInt(6);
			buffer.append(num);
		}
		return buffer.toString();
	}
	
	// 비밀번호 인증코드 발급
	public void sendAutoMailFindPw(MailPARAM param) {
				
		try {
            MailUtils sendMail = new MailUtils(mailSender);
            sendMail.setSubject("aboutMe Memo");
            sendMail.setText(new StringBuffer().append("<h3 style='width: 170px; color: black;'>"
            + param.getMailText() + "</h3>").toString());
            sendMail.setFrom("ddw0099@naver.com");	// 본인 이메일 작성
            sendMail.setTo(param.getEmail());
            sendMail.send();
	            
	    } catch (MessagingException e) {
	        e.printStackTrace();
	            
	    } catch (UnsupportedEncodingException e) {
	        e.printStackTrace();
	    }
    }
	
	
	
}
