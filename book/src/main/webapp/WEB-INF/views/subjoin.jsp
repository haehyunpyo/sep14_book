<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인 연동시 추가정보 입력창</title>
<script src="./js/jquery-3.7.0.min.js"></script>
<script type="text/javascript">
	
</script>

</head>
<body>
		<form action="./subjoin" method="post">
		<div class="join-div" align="center">
			<div>
			
				<h1>추가정보입력</h1>
			</div>
			
			<div>
				<div>아이디</div>
				<div>
					<input type="text" name="mid" id="mid" value="${sessionScope.mid}" disabled/>
				</div>
			</div>
					<div>
						<div>이름</div>
						<div>
							<input type="text" name="mname" id="mname" placeholder="이름을 입력해 주세요"/>
						</div>
					</div>
					<div>
						<div>주소</div>
						<div>
							<input type="text" name="maddr" placeholder="주소를 입력해 주세요"/>
						</div>
					</div>
		
					<div>
						<div>이메일</div>
						<div>
							<input type="text" name="memail" id="memail" value="${memail }" disabled/>
						</div>
					</div>
					<div>
						<button type="reset">취소</button>
						<button type="submit" id="joinjoin">가입</button>
					</div>

		</div>
	</form>
</body>
</html>