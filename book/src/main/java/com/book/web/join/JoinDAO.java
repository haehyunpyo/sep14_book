package com.book.web.join;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface JoinDAO {
	

	public int join(JoinDTO joinDTO);

	public int checkID(String mid);

	public void setKakaoUser(JoinDTO joinDTO);

	public void setNaverUser(JoinDTO joinDTO);
	
}
