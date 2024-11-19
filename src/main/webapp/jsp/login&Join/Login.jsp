<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인 페이지</title>
<link rel="stylesheet" href="/style/loginStyle.css?v">
</head>
<% session.invalidate(); %>
<body>
	<div id="wrap">
		<h1>로그인 페이지</h1>
		<hr>

		<div id="login" class="loginWrap">
			<form action="LoginProc.jsp" id="pass">
				<input type="text" name="uId" id="uId" placeholder="아이디를 입력하세요" autofocus />
				<input type="password" name="uPw" placeholder="비밀번호를 입력하세요" id="uPw" />
				<label>
					<input type="checkbox" id="pwSee" /> <span>비밀번호 보이기</span>
				</label>

				<div id="loJo">
					<button type="button" id="gogo">로그인</button>
					<button type="button" id="join">회원가입</button>
					<button type="button" id="tempJoin">게스트</button>
				</div>
			</form>
		</div>
	</div>
	<script src="/script/jquery-3.7.1.min.js"></script>
	<script src="/script/login&Join/loginScript.js"></script>
</body>
</html>