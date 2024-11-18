<%@ page language="java" contentType="text/html; charset=UTF-8"
				pageEncoding="UTF-8"%>
<jsp:useBean id="mMgr" class="blackWhitePkg.dao.MemberMgr" />

<%
request.setCharacterEncoding("UTF-8");
String uId = request.getParameter("uId");
%>

<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>아이디 중복 체크</title>
<link rel="stylesheet" href="/style/style_Common.css">

</head>
	<body>
		<div id="wrap_Popup">
			<div>
				<h1><%=uId%></h1>
				<span>
					<% boolean result = mMgr.checkId(uId);
	 				//	result	=> true라면	입력한	아이디	사용불가(=이미	가입한	ID)
	 				   String btnCap = null;
					   if (result) {
					   	out.print(" 는 존재하는 ID 입니다.");
						btnCap = "ID 재입력";
					   } else {
						out.print(" 는 사용가능합니다.");
						btnCap = "사용하기";
					   }
	 				%>
				</span>
			</div>
			<hr>
			<div id="closeBtnArea">
				<button type="button"><%=btnCap%></button>
			</div>
		</div>
		<!--	div#wrap	-->
		
		<script src="/script/jquery-3.7.1.min.js"></script>
		<script src="/script/login&Join/joinAgree.js"></script>
	</body>
</html>