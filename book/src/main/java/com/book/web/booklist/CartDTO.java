package com.book.web.booklist;

import lombok.Data;

@Data
public class CartDTO {

private String user_id, bkimg, bkscontent;
private int cartno, bkno, amount, price, total;
	
	
}
