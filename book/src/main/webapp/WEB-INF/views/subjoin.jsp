<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인 연동시 추가정보 입력창</title>
<link rel="stylesheet" href="./css/subjoin.css">
<script src="./js/jquery-3.7.0.min.js"></script>
<style type="text/css">

.subjoin-div{
	box-sizing : border-box;
	margin: 100px auto;
	padding: 20px;
	font-size:15px;
	background-color:#F2F2F2;
	width: 500px;
}

h1 {
    font-weight: bold; 
    font-size: 40px; 
    color: black;
}

label{
	margin: 15px 15px 15px -10px;
	padding-right: 10px;
    text-align: right;
    vertical-align: middle;
    width: 15%;
	float: left;
}

input{
    background-color:white;
    border-radius: 5px;
    width: 70%;
    height: 50px;
    padding-left: 10px;
 	border:none;
  	outline:none;
}

#mid, #mname, #maddr, #maddr1, #memail{
	margin: 0 10px 20px 5px;
}

#autoInfo{
	margin-left: 100px;
	margin-bottom: 35px;
	text-align: center;
}
#autoInfo span{
	text-align: center;
	color: tomato;
	font-size: small;
}

button{
	background-color: black;
	color: white;
	border: none;
    border-radius: 5px;
    padding: 10px 25px; 
    font-size: 16px;
    cursor: pointer;
}

</style>

<script type="text/javascript">
	$(function(){
		
		$("#joinCancel").click(function(){
			alert("!");
			window.location.href = "/logout";
		});
		
	});
</script>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script type="text/javascript">
window.onload = function(){
    document.getElementById("maddr").addEventListener("click", function(){ //주소입력칸을 클릭하면
        //카카오 지도 발생
        new daum.Postcode({
            oncomplete: function(data) { //선택시 입력값 세팅
                document.getElementById("maddr").value = data.address; // 주소 넣기
              /*   document.querySelector("maddr1").focus(); //상세입력 포커싱 */
            }
        }).open();
    });
}
</script>

</head>
<body>
		<form action="/login/subjoin" method="post">
		<div class="subjoin-div" align="center">
			<div>
			
				<h1>추가정보입력</h1>
			</div>
			
			<div>
				<label for="mid">아이디</label>
				<div>
					<input type="text" name="mid" id="mid" value="${sessionScope.mid}" disabled/>
				</div>
			</div>
					<label for="mname">이름</label>
					<div>
						<div>
							<c:choose>
           						<c:when test="${mname ne null}">
           							<input type="text" name="mname" id="mname" value="${mname }" readonly/>
           						</c:when>
           						<c:otherwise>
									<input type="text" name="mname" id="mname" placeholder="이름을 입력해 주세요"/>
           						</c:otherwise>
       						</c:choose>
						</div>
					</div>
					<div>
						<label for="memeil">이메일</label>
						<div class="">
							<c:choose>
								<c:when test="${memail ne null}">
									<input type="text" name="memail" id="memail" value="${memail }" readonly/>
								</c:when>
								<c:otherwise>
									<c:choose>
										<c:when test="${sessionScope.withN ne 2}"><span>네이버 계정이 올바른지 확인필요</span></c:when>
										<c:when test="${sessionScope.withK ne 1}"><span>카카오 계정이 올바른지 확인필요</span></c:when>
										<c:otherwise>
											<input type="text" name="memail" id="memail" value="${memail }" disabled/>
 											<!-- <span>올바르지 않은 접근경로<span> -->
										</c:otherwise>
									</c:choose>
								</c:otherwise>
							</c:choose>
						</div>
						<div id="autoInfo"><span>연동된 계정의 정보가 자동으로 입력됩니다.</span></div>
					</div>
					<div>
						<div>
							<label for="maddr">주소*</label>
							<input type="text" name="maddr" id="maddr" placeholder="주소를 입력해 주세요"/>
						</div>
						<div>
							<label for="maddr1"></label>
						    <input type="text" name="maddr" id="maddr1" placeholder="상세주소를 입력해 주세요"/>
						</div>
						<input type="hidden" name="mphone" value="${mphone }"/>
					</div>
		
					<div>
						<button type="button" id="joinCancel">취소</button>
						<button type="submit" id="joinjoin">가입</button>
					</div>

		</div>
	</form>
</body>
</html>