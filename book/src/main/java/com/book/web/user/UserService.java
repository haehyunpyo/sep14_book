package com.book.web.user;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class UserService {

	@Autowired
	private UserDAO userDAO;

	public UserDTO findId(UserDTO dto) {
		return userDAO.findId(dto);
	}

	public UserDTO findpw(UserDTO dto) {
		return userDAO.findpw(dto);
	}

	public int setPw(UserDTO dto) {
		 return userDAO.setPw(dto);
	}
	
	
	
}
