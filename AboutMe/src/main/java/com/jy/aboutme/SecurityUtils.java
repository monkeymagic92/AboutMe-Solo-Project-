package com.jy.aboutme;


import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.mindrot.jbcrypt.BCrypt;

import com.jy.aboutme.admin.model.AdminPARAM;


public class SecurityUtils {
	
	
	public static int getLoginUserPk(HttpServletRequest request) {
		return getLoginUser(request).getI_user();
	}
	
	// 세션이 박힌 로그인유저 pk값 반환 
	public static int getLoginUserPk(HttpSession hs) {
		return ((AdminPARAM)hs.getAttribute(Const.LOGIN_USER)).getI_user();
	}
	
	// 세션키값 : loginUser 에 담긴 값을 반환하는 메소드
	public static AdminPARAM getLoginUser(HttpServletRequest request) {
		HttpSession hs = request.getSession();
		return (AdminPARAM)hs.getAttribute(Const.LOGIN_USER);
	}
	
	// 
	public static boolean isLogout(HttpServletRequest request) {
		HttpSession hs = request.getSession();
		return getLoginUser(request) == null;
		
	}

	public static String generateSalt() {
		return BCrypt.gensalt();
	}
	
	public static String getEncrypt(String pw, String salt) {
		return BCrypt.hashpw(pw, salt);
	}
	

}
