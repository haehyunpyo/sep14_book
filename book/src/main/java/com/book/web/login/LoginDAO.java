package com.book.web.login;

import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface LoginDAO {

	Map<String, Object> login(Map<String, Object> map);

	int autoCheck(Map<String, Object> map);

	int hasKakaoUser(Map<String, Object> kUser);

	int hasNaverUser(Map<String, Object> nUser);

	Map<String, Object> autologin(String suserID);

	int hasAuto(Map<String, Object> map);

}
