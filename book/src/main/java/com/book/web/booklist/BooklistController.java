package com.book.web.booklist;

import java.util.List;
import java.util.Map;

import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
public class BooklistController {
	
	@Autowired
	private BooklistService booklistService; 

	@GetMapping("/booklist")
	public String list(Model model, 
		@RequestParam(name = "bkcate", required = false, defaultValue = "0") int bkcate,
		@RequestParam Map<String, Object> map) {
		
		if(!(map.containsKey("bkcate")) || map.get("bkcate").equals(null) || map.get("bkcate").equals("")){
			map.put("bkcate", 0);
			
		}
		System.out.println("카테고리 :" + bkcate );
		System.out.println("검색 :" + map );
		//책 목록 불러오기
		List<Map<String, Object>> booklist = booklistService.booklist(map);
		//List<BooklistDTO> booklist = booklistService.booklist(bkcate);
		model.addAttribute("booklist", booklist);
		
		
		return "booklist";
	}
	
	
	@GetMapping("/bookdetail")
	public String detail(@RequestParam("bkno") int bkno,Model model) {
		
		//책 상세페이지
		Map<String, Object> bookdetail = booklistService.bookdetail(bkno);
		model.addAttribute("bookdetail", bookdetail);
		
		//베스트셀러
		List<BooklistDTO> booktop = booklistService.booktop();
		model.addAttribute("booktop", booktop);
		
		return "bookdetail";
	}
	
	
	// SM
	@PostMapping("/test")
	public String detail2(CartDTO dto) {
		List<Map<String, Object>> cartList = booklistService.cart();

		boolean matchingItemFound = false;

		for (int i = 0; i < cartList.size(); i++) {
			if (cartList.get(i).get("bkno").equals(dto.getBkno())) {
				booklistService.cart2(dto);
				matchingItemFound = true;
				break;
			}
		}

		if (!matchingItemFound) {
			// If no matching item is found, proceed to detail2
			booklistService.detail2(dto);
		}

		return "redirect:/test";
	}

	@GetMapping("/test")
	public String cart(Model model) {

		List<Map<String, Object>> cart = booklistService.cart();
		model.addAttribute("cart", cart);

		return "/test";
	}

	@ResponseBody
	@GetMapping("/delete")
	public String delete(@RequestParam Map<String, Object> map) {

		int result = booklistService.delete(map);

		JSONObject json = new JSONObject();
		json.put("result", result);

		return json.toString();

	}

	@GetMapping("/purchase")
	public String purchase(Model model) {

		return "purchase";
	}
	
	
	
	
	
}
	
	
	
