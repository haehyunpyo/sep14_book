package com.book.web.join;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class JoinService {
	
	@Autowired
	private JoinDAO joinDAO;

	public int join(JoinDTO joinDTO) {
		return joinDAO.join(joinDTO);
	}

	public int checkID(String mid) {
		return joinDAO.checkID(mid);
	}

	public void setKakaoUser(JoinDTO joinDTO) {
		joinDAO.setKakaoUser(joinDTO);
	}

	public void setNaverUser(JoinDTO joinDTO) {
		joinDAO.setNaverUser(joinDTO);
		
	}
}
