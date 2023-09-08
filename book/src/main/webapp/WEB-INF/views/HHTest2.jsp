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
	
	// 선택한 메일주소값 뽑아내기
	let option = "";
	
	$("select[name=selectBox]").change(function(){
		option = $(this).val();	 // @hammail.net
		//console.log(option);
	});
	
	// 가입 클릭시
	$("#joinjoin").click(function(){
		
		// gogus228
		let Fmail = $(this).parent('div').siblings(".emailBox").children("#memail").val();
		//alert(Fmail);   
		
		// hammail   net
		let items = option.slice(1).split(".");	
		let first = items[0];	// hammail
		let second = items[1];	// net
		
		// 메일주소 앞부분 입력값검사
		let replaceKorean = /[ㄱ-ㅎㅏ-ㅣ]/gi;
		let replaceChar = /[~!@\#$%^&*\()\-=+_'\;<>\/.\`:\"\\,\[\]?|{}]/gi;
		
		
/* 		if(Fmail.includes("@")){
			Fmail.  Fmail.indexOf("@")	
		}  */
		
		else if(Fmail.match(replaceKorean) || Fmail.match(replaceChar)){
			Fmail = Fmail.replace(replaceKorean, "").replace(replaceChar, "");
			//alert(Fmail);
			alert("올바른 메일주소를 입력해주세요")
			$("#memail").val("");
			$("#Opt").prop("selected", true);
		}
		
		let Final = Fmail + "@" + first + "." + second;
		console.log(Final);	// gogus228@gmail.com
		let memail = $("#memailF").val(Final);
		console.log("memail: " + memail.val());
		
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

	<div class="emailBox">
		<input class="input" type="text" id="memail" placeholder="이메일을 입력해 주세요" /><br> <br> 
		<select	class="selectMail" id="selectBox" name="selectBox">
			<option id="Opt">-선택-</option>
			<option id="naver" value="@naver.com">@naver.com</option>
			<option id="gmail" value="@gmail.com">@gmail.com</option>
			<option id="hanmail" value="@hanmail.net">@hanmail.net</option>
		</select>
		<input type="hidden" name="memail" id="memailF"/>
	</div>

	<div>
		<button class="Jbutton" type="reset">취소</button>
		<button class="Jbutton" type="submit" id="joinjoin">가입</button>
	</div>


</body>
</html>