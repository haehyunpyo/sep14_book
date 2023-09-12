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
		
		let mbrith = $("#mbrith").val();
		
	    console.log(mbrith.length);
	    if (mbrith.length < 10 ) {
            alert("생년월일을 정확히 입력해주세요.");
	    }
		
	});
});

</script>


</head>
<body>


	<div class="brithBox">
		<input class="input" type="date" name="mbrith" id="mbrith" />
		<button type="button" id="testbtn">버튼</button>
	</div>
</body>
</html>