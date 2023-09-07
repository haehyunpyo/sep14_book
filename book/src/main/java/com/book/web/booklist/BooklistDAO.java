package com.book.web.booklist;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface BooklistDAO {

	List<Map<String, Object>> booklist(Map<String, Object> map);

	Map<String, Object> bookdetail(int bkno);

	List<BooklistDTO> booktop();

	// SM
	void detail2(CartDTO dto);

	List<Map<String, Object>> cart();

	int delete(Map<String, Object> map);

	void cart2(CartDTO dto);
}
