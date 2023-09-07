package com.book.web.user;

import lombok.Data;

@Data
public class UserDTO {
	private int mno, count;
	private String mname, mid, maddr, mbrith, memail, mphone;
}
