package com.book.web.booklist;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class BooklistService {

	@Autowired
	private BooklistDAO booklistDAO;

	public List<Map<String, Object>> booklist(Map<String, Object> map) {
		return booklistDAO.booklist(map);
	}

	public Map<String, Object> bookdetail(int bkno) {
		return booklistDAO.bookdetail(bkno);
	}

	public List<BooklistDTO> booktop() {
		return booklistDAO.booktop();
	}
	
	// SM
	public void detail2(CartDTO dto) {

		booklistDAO.detail2(dto);
	}

	public List<Map<String, Object>> cart() {

		return booklistDAO.cart();
	}

	public int delete(Map<String, Object> map) {

		return booklistDAO.delete(map);
	}

	public void cart2(CartDTO dto) {
		booklistDAO.cart2(dto);
	}

	
}
