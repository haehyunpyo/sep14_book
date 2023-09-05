<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://developers.kakao.com/sdk/js/kakao.js"></script>
<script src="./js//jquery-3.7.0.min.js"></script>
<script type="text/javascript">

function kakaoLogout(){
	location.href="https://kauth.kakao.com/oauth/logout?client_id=3ecca13d973c6d11e752a114a1e14922&logout_redirect_uri=http://localhost/logout/kakao";
}


	$(function(){
	
		// 로그아웃_자동로그인 해제
		let sid = getCookie("SuserID");
		let setS = getCookie("setS");
		
		$("#logoutbtn").click(function(){
			delCookie("SuserID");
			delCookie("setS");
			Logout();
		});
		
		// 쿠키 삭제
		function delCookie(cookieName){
			let expireDate = new Date();
			expireDate.setDate(expireDate.getDate() - 1);
			document.cookie = cookieName +"="+ "; expires="+ expireDate.toUTCString()
		}
		
		
		// 쿠키가져오기
		function getCookie(cookieName){
			let cname, cvalue;
			let val = document.cookie.split(";");
			for(let i = 0; i < val.length; i++){
				cname = val[i].substr(0, val[i].indexOf("="));
				cvalue = val[i].substr(val[i].indexOf("=")+1);
				cname = cname.trim();
				
				if(cname == cookieName){
					return cvalue;
				}
			}
		}
		
		function Logout(){
			window.location.href = "/logout";
		}
		
		
		
	});


</script>
</head>
<body>
	<h1>첫 화면</h1>
	
	<a href="./login">로그인으로 이동</a>
	<br>
	
		<div>
			<button type="submit" onclick="kakaoLogout()">
				카카오계정 로그아웃
			</button>
			<button type="button" id="logoutbtn">
				로그아웃
			</button>
		</div>
		
	 <div>
         <c:choose>
            <c:when test="${sessionScope.mname ne null}"> " ${sessionScope.mname} " 로그인완</c:when>
            <c:otherwise>로그아웃상태 </c:otherwise>
         </c:choose>
      </div>
		
	
</body>
</html>