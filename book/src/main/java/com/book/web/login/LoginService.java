package com.book.web.login;

import java.io.BufferedReader;
import java.io.BufferedWriter;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.OutputStreamWriter;
import java.net.HttpURLConnection;
import java.net.URL;
import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.google.gson.Gson;
import com.google.gson.JsonElement;
import com.google.gson.JsonObject;
import com.google.gson.JsonParser;

@Service
public class LoginService {

	@Autowired
	private LoginDAO loginDAO;
	
	
	// 카카오에 코드전송 & 인증토큰받기
      public String getKakaoToken(String code){
    	  
    	  String access_Token="";
    	  String refresh_Token ="";
    	  String reqURL = "https://kauth.kakao.com/oauth/token";

      try{
          URL url = new URL(reqURL);
          HttpURLConnection conn = (HttpURLConnection) url.openConnection();

          //POST 요청을 위해 기본값이 false인 setDoOutput을 true로
          conn.setRequestMethod("POST");
          conn.setDoOutput(true);

          //POST 요청에 필요로 요구하는 파라미터 스트림을 통해 전송
          BufferedWriter bw = new BufferedWriter(new OutputStreamWriter(conn.getOutputStream()));
          StringBuilder sb = new StringBuilder();
          sb.append("grant_type=authorization_code");
          sb.append("&client_id=3ecca13d973c6d11e752a114a1e14922"); // TODO REST_API_KEY 입력
          sb.append("&redirect_uri=http://localhost/login/kakao"); // TODO 인가코드 받은 redirect_uri 입력
          sb.append("&code=" + code);
          bw.write(sb.toString());
          bw.flush();

          //결과 코드가 200이라면 성공
          int responseCode = conn.getResponseCode();
          //System.out.println("responseCode : " + responseCode);
          
          //요청을 통해 얻은 JSON타입의 Response 메세지 읽어오기
          BufferedReader br = new BufferedReader(new InputStreamReader(conn.getInputStream()));
          String line = "";
          String result = "";

          while ((line = br.readLine()) != null) {
              result += line;
          }
          System.out.println("response body : " + result);

          //Gson 라이브러리에 포함된 클래스로 JSON파싱 객체 생성
          JsonParser parser = new JsonParser();
          JsonElement element = parser.parse(result);

          access_Token = element.getAsJsonObject().get("access_token").getAsString();
          refresh_Token = element.getAsJsonObject().get("refresh_token").getAsString();

          //System.out.println("access_token : " + access_Token);
          //System.out.println("refresh_token : " + refresh_Token);

          br.close();
          bw.close();
      }catch (IOException e) {
          e.printStackTrace();
      }

      return access_Token;
      }
      
      
   // 카카오에 토큰전송 & 사용자정보받기
      public  Map<String, Object> getKakaoUser(String access_Token){

          Map<String, Object> kmap = new HashMap<>();

          String reqURL = "https://kapi.kakao.com/v2/user/me";
          String email = "";
          String nickname = "";

          //access_token을 이용하여 사용자 정보 조회
          try {
              URL url = new URL(reqURL);
              HttpURLConnection conn = (HttpURLConnection) url.openConnection();

              conn.setRequestMethod("POST");
              conn.setDoOutput(true);
              conn.setRequestProperty("Authorization", "Bearer " + access_Token); //전송할 header 작성, access_token전송

              //결과 코드가 200이라면 성공
              int responseCode = conn.getResponseCode();
              System.out.println("responseCode : " + responseCode);

              //요청을 통해 얻은 JSON타입의 Response 메세지 읽어오기
              BufferedReader br = new BufferedReader(new InputStreamReader(conn.getInputStream()));
              String line = "";
              String result = "";

              while ((line = br.readLine()) != null) {
                  result += line;
              }
              //System.out.println("response body : " + result);

              //Gson 라이브러리로 JSON파싱
              JsonParser parser = new JsonParser();
              JsonElement element = parser.parse(result);
              
              // 받아올값 : profile_nickname(닉네임), kakao_account(이메일)
              Long id = element.getAsJsonObject().get("id").getAsLong();
              boolean hasEmail = element.getAsJsonObject().get("kakao_account").getAsJsonObject().get("has_email").getAsBoolean();
              //boolean hasName = element.getAsJsonObject().get("profile_nickname").getAsJsonObject().get("has_Name").getAsBoolean();
              
              if (hasEmail) {
                  email = element.getAsJsonObject().get("kakao_account").getAsJsonObject().get("email").getAsString();
              }
              
//              if (hasName) {
//                  nickname = element.getAsJsonObject().get("profile_nickname").getAsJsonObject().get("nickname").getAsString();
//              }

              System.out.println("id : " + id);
              System.out.println("email : " + email);
              //System.out.println("nickname : " + nickname);
              
              kmap.put("kid", id);
              kmap.put("kemail", email);
              
              //System.out.println(kmap); // {kid=3002751483, kemail=gogus228@hanmail.net}

              br.close();

          } catch (IOException e) {
              e.printStackTrace();
          }
          
          return kmap;
      }
      
      
  	// 네이버
	public String getNaverToken(String Ncode) {

		String Naccess_Token = "";
		String Nrefresh_Token = "";
		String NreqURL = "https://nid.naver.com/oauth2.0/token";

		 try{
	          URL url = new URL(NreqURL);
	          HttpURLConnection conn = (HttpURLConnection) url.openConnection();

	          //POST 요청을 위해 기본값이 false인 setDoOutput을 true로
	          conn.setRequestMethod("POST");
	          conn.setDoOutput(true);

	          //POST 요청에 필요로 요구하는 파라미터 스트림을 통해 전송
	          BufferedWriter bw = new BufferedWriter(new OutputStreamWriter(conn.getOutputStream()));
	          StringBuilder sb = new StringBuilder();
	          sb.append("grant_type=authorization_code");
	          sb.append("&client_id=hnntl6BcuuFp5qf4vMAt"); // TODO Client ID 입력
	          sb.append("&client_secret=S2tSUIOot4"); // TODO Client Secret 입력
	          sb.append("&code=" + Ncode);
	          sb.append("&redirect_uri=http://localhost/login/naver"); // TODO 인가코드 받은 redirect_uri 입력
	          bw.write(sb.toString());
	          bw.flush();

	          //결과 코드가 200이라면 성공
	          int NresponseCode = conn.getResponseCode();
	          System.out.println("NresponseCode : " + NresponseCode);
	          
	          //요청을 통해 얻은 JSON타입의 Response 메세지 읽어오기
	          BufferedReader Nbr = new BufferedReader(new InputStreamReader(conn.getInputStream()));
	          String Nline = "";
	          String Nresult = "";

	          while ((Nline = Nbr.readLine()) != null) {
	        	  Nresult += Nline;
	          }
	          
	          //System.out.println("Nresponse body : " + Nresult);

	          //Gson 라이브러리에 포함된 클래스로 JSON파싱 객체 생성
	          JsonParser parser = new JsonParser();
	          JsonElement element = parser.parse(Nresult);

	          Naccess_Token  = element.getAsJsonObject().get("access_token").getAsString();
	          Nrefresh_Token = element.getAsJsonObject().get("refresh_token").getAsString();

	          System.out.println("Naccess_token : " + Naccess_Token);	// AAAAOas6tf3pSri5ll2PWpedUIEi-V0wBZ3_RXDaV07N2DvstopFdFlAMOTKCYP2WJZKBMq_nBqDEYyplhuCfQl_a5o
	          System.out.println("Nrefresh_token : " + Nrefresh_Token);	// dpqPmnlTMO684PXmisGfviiVb67IdKboz4qPvKkFLVOWlOuLFisk05EnNTKCmdkh4HVYjzrYeO5I8Q0Mufq1P6JjPCWGaDmii4JzC2o5J9RXnZHrXqc3xENgTTiihbbFzQipf3

	          Nbr.close();
	          bw.close();
	          
	      }catch (Exception e) {
	          e.printStackTrace();
	      }

	      return Naccess_Token;
	}

      
	 // 네이버에 토큰전송 & 사용자정보받기
	   public  Map<String, Object> getNaverUser(String Naccess_token){

		   Map<String, Object> Nmap = new HashMap<>();
		   
	        String reqURL = "https://openapi.naver.com/v1/nid/me";
	        String id="";
	        String email = "";
	        String nickname = "";
	        String mobile = "";

	        //access_token을 이용하여 사용자 정보 조회
	        try {
	            URL url = new URL(reqURL);
	            HttpURLConnection conn = (HttpURLConnection) url.openConnection();

	            conn.setRequestMethod("POST");
	            conn.setDoOutput(true);
	            conn.setRequestProperty("Authorization", "Bearer " + Naccess_token); //전송할 header 작성, access_token전송

	            //결과 코드가 200이라면 성공
	            int responseCode = conn.getResponseCode();
	            System.out.println("responseCode : " + responseCode);

	            //요청을 통해 얻은 JSON타입의 Response 메세지 읽어오기
	            BufferedReader br = new BufferedReader(new InputStreamReader(conn.getInputStream()));
	            String line = "";
	            String result = "";

	            while ((line = br.readLine()) != null) {
	                result += line;
	            }
	            System.out.println("response body : " + result);
	            //response body : {"resultcode":"00","message":"success",
	            // "response":{"id":"MYTpCxw_Dk2TQEhnP_bIHQfync4EgPoU_ThlOL-INR8","nickname":"phyho","email":"phyho0228@naver.com","mobile":"010-6534-2377","mobile_e164":"+821065342377","name":"\ud45c\ud574\ud604"}}


	            Gson gson = new Gson();
	            JsonObject jsonObject = gson.fromJson(result, JsonObject.class);
	            JsonElement responseElement = jsonObject.get("response");
	            
	            java.lang.reflect.Type type = new com.google.gson.reflect.TypeToken<Map<String, Object>>(){}.getType();
	            Nmap = gson.fromJson(responseElement, type);
	            
	            // 받아올값 : id, nickname, email, mobile, name
	            id = (String) Nmap.get("id");
	            email = (String) Nmap.get("email");
	            nickname = (String) Nmap.get("nickname");
	            mobile = (String) Nmap.get("mobile");
	            //boolean hasEmail = element.getAsJsonObject().get("email").getAsJsonObject().get("has_email").getAsBoolean();
	            //boolean hasName = element.getAsJsonObject().get("nickname").getAsJsonObject().get("has_Name").getAsBoolean();
	            
	            
	            System.out.println("id : " + id);
	            System.out.println("email : " + email);
	            System.out.println("nickname : " + nickname);
	            System.out.println("mobile : " + mobile);
	            
	 //         Nmap.put("Nid", id);
	 //         Nmap.put("Nemail", email);
	            
	            br.close();

	        } catch (Exception e) {
	            e.printStackTrace();
	        }
	        return Nmap;
	    }

    

	public Map<String, Object> login(Map<String, Object> map) {
		return loginDAO.login(map);
	}

	public int autoCheck(String sid) {
		return loginDAO.autoCheck(sid);
	}

	public int hasKakaoUser(Map<String, Object> kUser) {
		return loginDAO.hasKakaoUser(kUser);
	}

	public void setKakaoUser(Map<String, Object> kUser) {
		loginDAO.setKakaoUser(kUser);
	}

	public Map<String, Object> autoLogin(String suserID) {
		return loginDAO.autoLogin(suserID);
	}


	
	
}
