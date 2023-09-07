package com.book.web.user;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface UserDAO {

	UserDTO findId(UserDTO dto);

}
