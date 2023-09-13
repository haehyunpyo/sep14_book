package com.book.web.login;

import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface LoginDAO {

	Map<String, Object> login(Map<String, Object> map);

	int autoCheck(String sid);

	int hasKakaoUser(Map<String, Object> kUser);

	Map<String, Object> autoLogin(String suserID);

	int hasNaverUser(Map<String, Object> nUser);


}
