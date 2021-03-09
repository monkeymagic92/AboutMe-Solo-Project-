package com.jy.aboutme.kakaoLogin;

import java.io.BufferedReader;
import java.io.BufferedWriter;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.OutputStreamWriter;
import java.net.HttpURLConnection;
import java.net.URL;
import java.util.HashMap;

import org.springframework.stereotype.Service;

import com.google.gson.JsonElement;
import com.google.gson.JsonObject;
import com.google.gson.JsonParser;
import com.jy.aboutme.kakaoLogin.model.GuestVO;

@Service
public class KakaoAPI {
	
	// 유저 정보 받아오기
	public GuestVO getUserInfo (String access_Token) {
	    
		// token으로 받아온 유저 정보를 Guest객체에 담기위한 객체생성
		GuestVO vo = new GuestVO();
	    
	    String reqURL = "https://kapi.kakao.com/v2/user/me";
	    try {
	        URL url = new URL(reqURL);
	        HttpURLConnection conn = (HttpURLConnection) url.openConnection();
	        conn.setRequestMethod("POST");
	        
	        //    요청에 필요한 Header에 포함될 내용
	        conn.setRequestProperty("Authorization", "Bearer " + access_Token);
	        
	        int responseCode = conn.getResponseCode();
	        System.out.println("responseCode : " + responseCode);
	        
	        BufferedReader br = new BufferedReader(new InputStreamReader(conn.getInputStream()));
	        
	        String line = "";
	        String result = "";
	        
	        while ((line = br.readLine()) != null) {
	            result += line;
	        }
	        System.out.println("response body : " + result);
	        
	        JsonParser parser = new JsonParser();
	        JsonElement element = parser.parse(result);
	        
	        JsonObject properties = element.getAsJsonObject().get("properties").getAsJsonObject();	// properties : 닉네임, 썸네일, 이미지 받아오기용
	        JsonObject kakao_account = element.getAsJsonObject().get("kakao_account").getAsJsonObject();	// kakao_account :  
	        
	        
	        /*
	         * 		프로필 이미지 부분 에러뜸 id값도 같이 가져와보고
	         * 							디벨로퍼 들어가서 id 체크있는지 확인하기
	         * 		ddmarket 가서 코드 뺏기기
	         */
	        String nickname = "", profile_image ="", email = "", gender = "";
	        nickname = properties.getAsJsonObject().get("nickname").getAsString();
	        try {
	        	profile_image = properties.getAsJsonObject().get("profile_image").getAsString();
		        email = kakao_account.getAsJsonObject().get("email").getAsString();
		        gender = kakao_account.getAsJsonObject().get("gender").getAsString();
	        } catch (Exception e) {
	        	profile_image = "";
	        	email = "";
	        	gender = "";
	        }
	        
	        vo.setNickname(nickname);
	        vo.setProfile_image(profile_image);
	        vo.setEmail(email);
	        vo.setGender(gender);
	        
	    } catch (IOException e) {
	        e.printStackTrace();
	    }
	    
	    return vo;
	}
	
	
	// 카카오 로그아웃
	public void kakaoLogout(GuestVO vo) {
	    String reqURL = "https://kapi.kakao.com/v1/user/logout";
	    try {
	        URL url = new URL(reqURL);
	        HttpURLConnection conn = (HttpURLConnection) url.openConnection();
	        conn.setRequestMethod("POST");
	        conn.setRequestProperty("Authorization", "Bearer " + vo.getToken());
	        
	        int responseCode = conn.getResponseCode();
	        System.out.println("responseCode : " + responseCode);
	        
	        BufferedReader br = new BufferedReader(new InputStreamReader(conn.getInputStream()));
	        
	        String result = "";
	        String line = "";
	        
	        while ((line = br.readLine()) != null) {
	            result += line;
	        }
	        System.out.println(result);
	    } catch (IOException e) {
	      
	        e.printStackTrace();
	    }
	}

	
	
	
	
	
	
	
	// 토큰 받기
	public String getAccessToken (String authorize_code) {
		System.out.println("토근받기 1");
        String access_Token = "";
        String refresh_Token = "";
        String reqURL = "https://kauth.kakao.com/oauth/token";
        
        try {
        	System.out.println("토근받기 실행 try");
            URL url = new URL(reqURL);
            HttpURLConnection conn = (HttpURLConnection) url.openConnection();
            
            //    POST 요청을 위해 기본값이 false인 setDoOutput을 true로
            conn.setRequestMethod("POST");
            conn.setDoOutput(true);
            
            //    POST 요청에 필요로 요구하는 파라미터 스트림을 통해 전송
            BufferedWriter bw = new BufferedWriter(new OutputStreamWriter(conn.getOutputStream()));
            StringBuilder sb = new StringBuilder();
            sb.append("grant_type=authorization_code");
            sb.append("&client_id=7df9e62642f4d75b1c20fb1b0be4450d");	// 본인 REST API 키
            //sb.append("&redirect_uri=http://localhost:8080/play/login");		// 본인 redirect url  (카카오 디벨로퍼에 설정한 redirect url 입력)
            sb.append("&redirect_uri=http://http://118.67.132.252/play/login");		// 본인 redirect url  (카카오 디벨로퍼에 설정한 redirect url 입력)
            sb.append("&code=" + authorize_code);
            bw.write(sb.toString());
            bw.flush();
            
            //    결과 코드가 200이라면 성공
            int responseCode = conn.getResponseCode();
            System.out.println("responseCode : " + responseCode);
 
            //    요청을 통해 얻은 JSON타입의 Response 메세지 읽어오기
            BufferedReader br = new BufferedReader(new InputStreamReader(conn.getInputStream()));
            String line = "";
            String result = "";
            
            while ((line = br.readLine()) != null) {
                result += line;
            }
            System.out.println("response body : " + result);
            
            //    Gson 라이브러리에 포함된 클래스로 JSON파싱 객체 생성
            JsonParser parser = new JsonParser();
            JsonElement element = parser.parse(result);
            
            access_Token = element.getAsJsonObject().get("access_token").getAsString();
            refresh_Token = element.getAsJsonObject().get("refresh_token").getAsString();
            
            System.out.println("access_token : " + access_Token);
            System.out.println("refresh_token : " + refresh_Token);
            
            br.close();
            bw.close();
        } catch (IOException e) {
        	System.out.println("토근받기 실행 catch");
            // TODO Auto-generated catch block
            e.printStackTrace();
        } 
        
        return access_Token;
    }
	
	
}
