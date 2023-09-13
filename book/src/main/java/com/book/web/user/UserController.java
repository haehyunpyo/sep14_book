package com.book.web.user;

import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;

@Controller
public class UserController {
	
	@Autowired
	private UserService userService;
	
	@GetMapping("/findId")
	public String finduser() {
		
		return "finduser";
	}
	
	@ResponseBody
	@PostMapping("/findId")
	public String finduser(UserDTO dto) throws JsonProcessingException {
		//System.out.println(dto);
		UserDTO result = userService.findId(dto);
		
		ObjectMapper jmap = new ObjectMapper();
		String json = jmap.writeValueAsString(result);
		//System.out.println(json);	//{"mno":0,"count":1,"mname":null,"mid":"3002751483","maddr":null,"mbrith":null,"memail":null,"mphone":null}

		return json;
	}
	
	// 비밀번호 수정페이지(임시)
	@GetMapping("/myinfo")
	public String myinfo() {
		return "myinfo";
	}
	
	
	@ResponseBody
	@PostMapping("/findPW")
	public String findpw(UserDTO dto) {
		JSONObject json = new JSONObject();

		//System.out.println(dto);
		UserDTO result = userService.findpw(dto);
		System.out.println(result.getCount());
		json.put("result", result);
		
		if(result.getCount() == 1) {
			int changepw = userService.setPw(dto);
			System.out.println(changepw);
			json.put("changepw", changepw);
			return json.toString();
		}
		return json.toString();
	}
	
	
	
	
	
}
