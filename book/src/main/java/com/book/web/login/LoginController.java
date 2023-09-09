package com.book.web.login;

import java.util.Map;

import javax.servlet.http.HttpSession;

import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.CookieValue;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
public class LoginController {

	@Autowired
	private LoginService loginService;

	
	@GetMapping("/login")
	public String login(HttpSession session) {
		// 로그인상태에서 login페이지 이동 막기
		if(session.getAttribute("mid") != null) {
			return "redirect:/";
		}
		return "login";
	}

	
	@GetMapping({"/", "/index"})
	public String getCookie(@CookieValue(name = "setS", required = false) String setS,
							@CookieValue(name = "SuserID", required = false) String SuserID, HttpSession session) {
		
	    if ( setS == null || SuserID == null ) {	// 메인페이지 (setS 쿠키가 없거나 값이 "S"가 아닌 경우)
			return "index";
			
	    } else if(setS.equals("S")) { 				// 자동로그인 진행 (setS 쿠키의 값이 "S"가 아닌 경우)
			//System.out.println(SuserID);
			Map<String, Object> autoresult = loginService.autoLogin(SuserID);	// 쿠키id와 디비id 일치여부확인
			
			if (String.valueOf(autoresult.get("autocount")).equals("1")) {
				
				session.setAttribute("mid", autoresult.get("mid"));
				session.setAttribute("mname", autoresult.get("mname"));
				//System.out.println(session.getAttribute("mname"));
				System.out.println("됨??");
				
				return "index";
			}
		}
		return "index";
	}
		
	
	@PostMapping("/login")
	public String login(@RequestParam Map<String, Object> map, HttpSession session) {

			// 일반로그인 진행
			Map<String, Object> result = loginService.login(map);
			// System.out.println(result);
			if (String.valueOf(result.get("count")).equals("1")) {
					
				session.setAttribute("mid", result.get("mid"));
				session.setAttribute("mname", result.get("mname"));
				//System.out.println(session.getAttribute("mname"));
					
				return "redirect:/index";
			}
		return "login";
	}

	
	  @ResponseBody
	  @PostMapping("/autoLogin") public String autoCheck(@RequestParam("sid") String sid, HttpSession session) {
	  
	  JSONObject json = new JSONObject();
	  
	  int result = loginService.autoCheck(sid);
	  json.put("result", result);
	  System.out.println(result);

	  return json.toString(); 
	  }
	 
	  
	@GetMapping({"/logout", "/logout/kakao"})
	public String logout(HttpSession session) {

		session.invalidate();
		System.out.println("로그아웃!!!");

		return "redirect:/login";
	}

	@GetMapping("/login/kakao")
	public String kakaoLogin(@RequestParam(required = false) String code, HttpSession session, Model model) {

		// URL에 포함된 code를 이용하여 액세스 토큰 발급
		// System.out.println(code);
		String access_Token = loginService.getKakaoToken(code);
		// System.out.println(access_Token);
		Map<String, Object> kUser = loginService.getKakaoUser(access_Token);  // kmap값을 kUser로 받음.
		// System.out.println(kUser); // {kid=3002751483, kemail=gogus228@hanmail.net}

		// kakao 로그인기록 확인
		int result = loginService.hasKakaoUser(kUser);

		if (kUser != null) { // kakao연결성공

			if (result == 1) {
				// db에 kakao계정정보 있다면 로그인진행
				session.setAttribute("mid", kUser.get("kid"));
				kUser.get("kid");
				return "redirect:/";

			} else {
				loginService.setKakaoUser(kUser); // db에 kakao계정정보 없다면 생성(id&email)

				session.setAttribute("mid", kUser.get("kid")); // kid 세션에 저장
				model.addAttribute("memail", kUser.get("kemail"));

				// 위의 mid, memail은 subjoin에 자동기입
				return "/subjoin";
			}

		} else {
			return "redirect:login";
		}
	}
	
	
	// 네이버 로그인
	@GetMapping("/login/naver")
	public String naverLogin(@RequestParam(required = false) String code, HttpSession session, Model model) {
		System.out.println("네이버 가보자고 : " + code);		// code형식 : t9ke0IO0SFl5aNin6F
		String Naccess_Token = loginService.getNaverToken(code);
		
		//System.out.println("Naccess_Token : " + Naccess_Token);
		// Nresponse body : {"access_token":"AAAAOas6tf3pSri5ll2PWpedUIEi-V0wBZ3_RXDaV07N2DvstopFdFlAMOTKCYP2WJZKBMq_nBqDEYyplhuCfQl_a5o","refresh_token":"dpqPmnlTMO684PXmisGfviiVb67IdKboz4qPvKkFLVOWlOuLFisk05EnNTKCmdkh4HVYjzrYeO5I8Q0Mufq1P6JjPCWGaDmii4JzC2o5J9RXnZHrXqc3xENgTTiihbbFzQipf3","token_type":"bearer","expires_in":"3600"}
		Map<String, Object> NUser = loginService.getNaverUser(Naccess_Token);
		System.out.println(NUser);
		
		return "redirect:/index";
	}

	
	

	// 아이디/비번찾기
	@GetMapping("/finduser")
	public String finduser(HttpSession session) {
		// 로그아웃상태에서 finduser페이지 이동 막기
		if(session.getAttribute("mid") != null) {
			return "redirect:/";
		}
		return "finduser";
	}
	
	

}
