package com.book.web.join;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
public class JoinController {
	
	@Autowired
	private JoinService joinService;

	@GetMapping("/join")
	public String join() {
	return "join";
		}
	
	@PostMapping("/join")
	public String join(JoinDTO joinDTO) {
		System.out.println("jsp에서 오는 값 : " + joinDTO);
		
		int result = joinService.join(joinDTO);
		//System.out.println(result);
		
		if(result == 1) {
			return "redirect:/login";
		}
		return "redirect:/join";
	}
	
	
	//아이디 중복검사
	@ResponseBody
	@PostMapping("/checkID")
	public String checkID(@RequestParam("mid") String mid) {
		System.out.println("id : " + mid);
		int result = joinService.checkID(mid);
			return result + "";
	}
	
	// 로그인연동 추가정보
	@GetMapping("/subjoin")
	public String subjoin() {
		return "subjoin";
	}
	
	
	@PostMapping("/login/subjoin")
	public String subjoin(JoinDTO joinDTO, HttpSession session) {
		
		
		if(session.getAttribute("withK") != null) {
			joinDTO.setMid(String.valueOf(session.getAttribute("mid")));
			joinDTO.setWithK(String.valueOf(session.getAttribute("withK")));
			
			joinService.setKakaoUser(joinDTO);
			
		} else if(session.getAttribute("withN") != null) {
			
			joinDTO.setMid(String.valueOf(session.getAttribute("mid")));
			joinDTO.setWithK(String.valueOf(session.getAttribute("withN")));
			System.out.println("jsp에서 오는 값 : " + joinDTO);
			
			joinService.setNaverUser(joinDTO);
		}

		return "redirect:/";
	}
	
}