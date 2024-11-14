<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.List"%>
<%@ page import="blackWhitePkg.dto.MemberBean" %>
<jsp:useBean id="memberMgr" class="blackWhitePkg.dao.MemberMgr" />
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
		<div id="lefTop">
			<% if(sid == "" || sid == null) { %>
			<h4><%= gueSion + "(" + session.getId().substring(0,5) + ")" %>
				님 안녕하세요.
			</h4>
			<ul>
				<li><b>좋아하는 음식 : </b> <span>정보 없음</span></li>
				<li><b>이름 : </b> <span>정보 없음</span></li>
				<li><b>성별 : </b> <span>정보 없음</span></li>
				<li><b>생일 : </b> <span>정보 없음</span></li>
				<li><b>거주지 : </b> <span>정보 없음</span></li>
				<li><b>직업 : </b> <span></span>정보 없음</li>
				<li><b>좋아하는 음식 : </b> <span>정보 없음</span></li>
			</ul>
			
			<%
			   } else {
				   List<MemberBean> list = memberMgr.getMemSelect(sid);
				   MemberBean memberBean = list.get(0);
				   String[] uFood = memberBean.getuFood();
				   String hop = "";
				   for(int i=0; i<uFood.length; i++) {
				       if(!uFood[i].equals("0")) {
				           hop += uFood[i] + ", ";   
				       }
					}
				   hop = hop.substring(0,hop.length()-2);
			%>
			<h4><%= memberBean.getuId() %>
				회원님 안녕하세요.
			</h4>
			<ul>
				<li><b>이름 : </b> <span><%= memberBean.getuName() %></span></li>
				<li><b>성별 : </b> <span><%= memberBean.getGender() %></span></li>
				<li><b>생일 : </b> <span><%= memberBean.getuBirth() %></span></li>
				<li><b>거주지 : </b> <span><%= memberBean.getuAddr() %></span></li>
				<li><b>직업 : </b> <span></span><%= memberBean.getuJob() %></li>
				<li><b>좋아하는 음식 : </b> <span><%= hop %></span></li>
			</ul>
			<% } %>
		</div>
		<button type="button" id="logout">로그아웃</button>
		<div id="banner">광고</div>
	
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