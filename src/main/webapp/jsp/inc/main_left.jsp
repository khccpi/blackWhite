<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>main_left</title>
</head>
<%
	String sid = (String)session.getAttribute("sid");
	
	String gue = "guest";
	String gueSion = "";
	
	if( sid == "" || sid == null) {
		session.setAttribute("guest", gue);
		session.setMaxInactiveInterval(300);
		gueSion = (String)session.getAttribute("guest");
	}
%>
<body>
	<div id="left">
		<% if(sid == "" || sid == null) { %>
		<h4><%= gueSion + "(" + session.getId().substring(0,5) + ")" %>
			님 안녕하세요.
		</h4>
		<ul>
			<li><b>좋아하는 음식 : </b> <span>정보 없음</span></li>
			<li><b>거주지 : </b> <span>정보 없음</span></li>
			<li><b>최근 간 곳 : </b> <span>정보 없음</span></li>
		</ul>
		<% } else { %>
		<h4><%= sid %>
			회원님 안녕하세요.
		</h4>
		<ul>
			<li><b>좋아하는 음식 : </b> <span>양식</span></li>
			<li><b>거주지 : </b> <span>서울</span></li>
			<li><b>최근 간 곳 : </b> <span>모수</span></li>
		</ul>
		<% } %>

		<button type="button" id="logout">로그아웃</button>
	</div>

	<script src="/script/jquery-3.7.1.min.js"></script>
	<script>
			$(function() {
				// 로그아웃
				$("#logout").click(()=> {
					alert("로그아웃 하셨습니다.");
					<% session.invalidate();%>
					location.href="/jsp/login&Join/login.jsp";
				})	
			})
		</script>
</body>
</html>