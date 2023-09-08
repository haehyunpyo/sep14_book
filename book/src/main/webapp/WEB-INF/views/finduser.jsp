<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="./js//jquery-3.7.0.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@10"></script>
<link href="../css/finduser.css" rel="stylesheet">
<script type="text/javascript">
	
	$(function(){
		
		// 아이디찾기
		$("#fidbtn").click(function(){
			let mname = $("#fname").val();
			let memail = $("#femail").val();

			if(mname == null || mname == ""){
				Swal.fire("이름을 입력하세요");
				$("#fname").focus();
			} 
			else if(memail == null || memail == ""){
				Swal.fire("이메일을 입력하세요");
				$("#femail").focus();
			} else{
				alert(mname);
			}
			
			$.ajax({
				url : "./findId",
				type : "post",
				data : {mname : mname, memail : memail},
				dataType : "json",
				success : function(data) {
					
					if(data.count == 1){
						
			            let yourIdDiv = $("<div>").attr("id", "yourId").text("Your ID: " + data.mid);
			            $(".tab-content").hide(); // 모든 .tab-content 요소 숨기기
			            $("body").append(yourIdDiv); // 페이지에 추가
			            yourIdDiv.show(); // 생성한 요소 표시
					}
					
				},
				error : function(error) {
					alert("에러발생");
				}
				
			});
		});
		
		// 이메일 입력값 검사
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
			
			if
			if(Fmail.match(replaceKorean) || Fmail.match(replaceChar)){
				Fmail = Fmail.replace(Fmail, "").replace(replaceKorean, "");
			}
			Swal.fire("올바른 메일주소를 입력해주세요")
			
		});
		
		
		
	});


</script>
</head>
<body>
	<%@ include file="menu.jsp"%>
	
	<div id="tabBox">
		<ul id="nav" class="nav nav-tabs font-alt" role="tablist">
			<li id="IDli" class="active"><a href="#findID" data-toggle="tab">아이디찾기</a></li>
			<li id="PWli"><a href="#findPW" data-toggle="tab">비밀번호찾기</a></li>
		</ul>
	</div>

	<div class="row mb-20" id="fContainer">
		<div class="tab-content">
			<div class="tab-pane active" id="findID">
				<div class="col-sm-6 mb-sm-20" id="fidBox">
					<input class="form-control input-lg" type="text" name="mname" id="fname" max="40" min="1" required="required" placeholder="이름을 입력해 주세요" /> 
					<input class="form-control input-lg" type="email" name="memail" id="femail" max="40" min="1" required="required" placeholder="이메일을 입력해 주세요" pattern=".+@gmail\.com"/>
					<div class="col-sm-10" id="fidbtnBox">
						<a class="btn btn-lg btn-block btn-round btn-b" id="fidbtn" href="#">아이디찾기</a>
					</div>
				</div>
			</div>
			<div class="tab-pane" id="findPW">
				<div class="col-sm-6 mb-sm-20">
					<input class="form-control input-lg" type="email" name="memail" id="femail" max="40" min="1" required="required" placeholder="아이디를 입력해 주세요" pattern=".+@gmail\.com"/>
					<div class="col-sm-10" id="fpwbtnBox">
						<a class="btn btn-lg btn-block btn-round btn-b" id="fpwbtn" href="#">비밀번호찾기</a>
					</div>
				</div>
			</div>
		</div>
	</div>

</body>
</html>