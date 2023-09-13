package com.book.web.user;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface UserDAO {

	UserDTO findId(UserDTO dto);

	UserDTO findpw(UserDTO dto);

	int setPw(UserDTO dto);

}
