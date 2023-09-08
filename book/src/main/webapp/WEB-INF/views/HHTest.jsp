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
		let mail = $(this).siblings(".select").children("#naver").val();
		let Fmail = $(this).siblings("#femail").val();
		
		let Dmail = mail.split(".");
		
		let Mmail = Dmail[0];
		let Lmail = Dmail[1];
		//console.log(Mmail); // naver
		//console.log(Lmail); // com
		
		// 메일주소 앞부분 입력값검사
		let replaceKorean = /[ㄱ-ㅎㅏ-ㅣ]/gi;
		let replaceChar = /[~!@\#$%^&*\()\-=+_'\;<>0-9\/.\`:\"\\,\[\]?|{}]/gi;
		
		if(Fmail.match(replaceKorean) || Fmail.match(replaceChar)){
			Fmail = Fmail.replace(Fmail, "").replace(replaceKorean, "");
			alert("올바른 메일주소를 입력해주세요")
			$("#femail").val("");
			$("#Opt").prop("selected", true);
		}
		
	});
});

/* 
    // 특수문자 정규식 변수(공백 미포함)
    var replaceChar = /[~!@\#$%^&*\()\-=+_'\;<>0-9\/.\`:\"\\,\[\]?|{}]/gi;
 
    // 완성형 아닌 한글 정규식
    var replaceNotFullKorean = /[ㄱ-ㅎㅏ-ㅣ]/gi;
 
 */

</script>
<style type="text/css">



</style>
<!-- onclick="setEmailDomain(this.value);return false; -->

</head>
<body>


	<form action="/HHTest" method="get" id="frm">
		
		<input type="text" id="femail"/> 
		
		<select class="select">
			<option id="Opt">-선택-</option>
			<option id="naver" value="naver.com">@naver.com</option>
			<option id="gmail" value="gmail.com">@gmail.com</option>
			<option id="hanmail" value="hanmail.net">@hanmail.net</option>
		</select>
		<button type="button" id="testbtn">테스트버튼</button>
		
	</form>
</body>
</html>