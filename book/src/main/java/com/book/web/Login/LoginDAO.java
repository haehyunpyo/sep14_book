package com.book.web.Login;

import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface LoginDAO {

	Map<String, Object> login(Map<String, Object> map);

	Map<String, Object> autoLogin(String sid);

	//Map<String, Object> saveUser(Map<String, Object> map);


}
