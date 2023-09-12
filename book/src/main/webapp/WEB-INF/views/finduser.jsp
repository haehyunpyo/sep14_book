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
			
			let check = true;
			let mname = $("#fname").val();
			let memail = $("#femail").val();

			if(mname == null || mname == ""){
				Swal.fire("이름을 입력하세요");
				$("#fname").focus();
			} 
			else {
				memail = checkmail(check);
				let memailToS = memail.toString();
				alert(memailToS);
			
				
				
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
			            
					} else {
						Swal.fire("입력한 정보를 다시 확인해주세요")
					}
					
				},
				error : function(error) {
					alert("에러발생");
				}
				
			});
		
			}
		});
		

		
		$("#fpwbtn").click(function(){
			checkmail();
		});
		
	});

	// 이메일 입력값 검사
	function checkmail(check){
		
		// 메일주소검사
     	let option = $("#selectBox option:selected").val();      // 선택한 메일주소값 뽑아내기
     	let memail="";
     	
     	if(option != "-선택-"){
     		
	     // gogus228
			let Fmail = $("#femail").val();
			//alert(Fmail);   
			
			if(Fmail != null && Fmail != ""){
				// hanmail   net
				let items = option.slice(1).split(".");	
				let first = items[0];	// hanmail
				let second = items[1];	// net
				
				// 메일주소 앞부분 입력값검사
				let replaceKorean = /[ㄱ-ㅎㅏ-ㅣ]/gi;
				let replaceChar = /[~!@\#$%^&*\()\-=+_'\;<>\/.\`:\"\\,\[\]?|{}]/gi;
			
				if(Fmail.match(replaceKorean) || Fmail.match(replaceChar)){
					Fmail = Fmail.replace(replaceKorean, "").replace(replaceChar, "");
					Swal.fire("올바른 메일주소를 입력해주세요(정규식검사)")
					$("#femail").val("");
					$("#Opt").prop("selected", true);
					return false; 
				}
				
				let Final = Fmail + "@" + first + "." + second;
				//alert(Final);	// gogus228@gmail.com
				memail = $("#memailF").val(Final);
				alert("femail: " + memail.val());
				
			} else {
				Swal.fire("올바른 메일주소를 입력해주세요(앞메일주소)");
				return false; 
			} 
		
     	} else {
			Swal.fire("올바른 메일주소를 입력해주세요(뒷메일주소)");
			return false; 
     }	
		return memail;
	}
	

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
					<input class="form-control input-lg" type="text" name="mname" id="fname" max="20" min="1" required placeholder="이름" /> 
					<div class="emailBox">
						<input class="form-control input-lg" type="email" id="femail"  max="20" min="1" required placeholder="이메일" /> 
						<select class="form-control input-lg selectMail" id="selectBox" name="selectBox">
							<option id="Opt">-선택-</option>
							<option id="naver" value="@naver.com">@naver.com</option>
							<option id="gmail" value="@gmail.com">@gmail.com</option>
							<option id="hanmail" value="@hanmail.net">@hanmail.net</option>
						</select>
						<input type="hidden" name="memailF" id="memailF"/>
					</div>
					<div class="col-sm-10" id="fidbtnBox">
						<button type="button" id="fidbtn">아이디찾기</button>
					</div>
				</div>
			</div>
			<div class="tab-pane" id="findPW">
				<div class="col-sm-6 mb-sm-20" id="fpwBox">
					<input class="form-control input-lg" type="text" name="mid" id="fid" max="40" min="1" required placeholder="아이디"/>
					<div class="emailBox">
						<input class="form-control input-lg" type="email" id="femail2"  max="20" min="1" required placeholder="이메일" /> 
						<select class="form-control input-lg selectMail" id="selectBox2" name="selectBox">
							<option id="Opt">-선택-</option>
							<option id="naver2" value="@naver.com">@naver.com</option>
							<option id="gmail2" value="@gmail.com">@gmail.com</option>
							<option id="hanmail2" value="@hanmail.net">@hanmail.net</option>
						</select>
						<input type="hidden" name="memail" id="memailF2"/>
					</div>
					<div class="col-sm-10" id="fpwbtnBox">
						<button type="button" id="fpwbtn">비밀번호찾기</button>
					</div>
				</div>
			</div>
		</div>
	</div>

</body>
</html>