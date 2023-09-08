package com.book.web.index;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class IndexController {

	/*
	 * @GetMapping({"/", "/index"}) public String index() { return "index"; }
	 */
	
	
	
	@GetMapping("/HHTest")
	public String test() {
		return "HHTest";
	}
	@GetMapping("/HHTest2")
	public String test2() {
		return "HHTest2";
	}
	
}
