<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="./js//jquery-3.7.0.min.js"></script>
<script type="text/javascript">

$(function() {
	$("#testbtn").click(function(){
		if($("#saveAll").is(":checked")){	
			alert("!");
		}
	}
}
	

</script>
</head>
<body>
	<form action="/HHTest" method="get" id="frm">
		<input type="checkbox" id="check"> <label for="check">테스트체크박스</label>
		<button type="submit" id="testbtn">테스트버튼</button>
	</form>
</body>
</html>