<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.List"%>
<%@ page import="blackWhitePkg.dto.MemberBean" %>
<jsp:useBean id="mMgr" class="blackWhitePkg.dao.MemberMgr" />
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
				   List<MemberBean> list = mMgr.getMemSelect(sid);
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
		<div id="bbtn">
			<button type="button" id="userUpdate">회원정보 수정</button>
			<button type="button" id="logout">로그아웃</button>
		</div>
		<div id="banner">
			<div id="ban1">
	          <a href="http://www.naver.com">
	            <img src="/images/adv/다이어트1.jpg" alt="다이어트1">
	          </a>
	          <a href="http://www.google.com">
	            <img src="/images/adv/다이어트2.jpg" alt="다이어트2">
	          </a>
	          <a href="http://www.youtube.com/">
	            <img src="/images/adv/다이어트3.jpg" alt="다이어트3">
	          </a>
			</div>
			<div id="ban2">
	          <a href="http://www.naver.com">
	            <img src="/images/adv/다이어트4.jpg" alt="다이어트4">
	          </a> 
	          <a href="http://www.google.com">
	            <img src="/images/adv/다이어트5.jpg" alt="다이어트5">
	          </a>
	          <a href="http://www.youtube.com/">
	            <img src="/images/adv/다이어트6.jpg" alt="다이어트6">
	          </a>
			</div>
			<div id="ban3">
	          <a href="http://www.naver.com">
	            <img src="/images/adv/다이어트7.jpg" alt="다이어트7">
	          </a>
	          <a href="http://www.google.com">
	            <img src="/images/adv/다이어트8.jpg" alt="다이어트8">
	          </a>
	          <a href="http://www.youtube.com/">
	            <img src="/images/adv/다이어트9.jpg" alt="다이어트9">
	          </a>
			</div>
		</div>
	</div>

	<script src="/script/jquery-3.7.1.min.js"></script>
	<!-- <script src="/script/login&Join/main_Left.js"></script> -->
	<script>
		// 회원정보 수정
		$("#userUpdate").click(() => {
			<% if(sid == "" || sid == null) {%>
				alert("회원만 수정하실 수 있습니다.");
			<% } else { %>
				alert("수정 페이지로 이동합니다.");
				location.href="/jsp/login&Join/ModifyUser.jsp";
			<% } %>
		})
		
		// 로그아웃
		$("#logout").click(()=> {
			alert("로그아웃 하셨습니다.");
			console.log("gd");
			location.href="/jsp/login&Join/Login.jsp";
		})
		
		// 배너
		setInterval(bnSlide,5000);
		function bnSlide() {
			$("#ban1").animate(
				{"margin-left":"-250px"},
				1000,
				function() {
					$("#ban1>a:first-child").insertAfter("#ban1>a:last-child");
					$("#ban1").css({"margin-left":"0px"});
				}
			)
			
			$("#ban2").animate(
				{"margin-left":"-250px"},
				1000,
				function() {
					$("#ban2>a:first-child").insertAfter("#ban2>a:last-child");
					$("#ban2").css({"margin-left":"0px"});
				}
			)
			
			$("#ban3").animate(
				{"margin-left":"-250px"},
				1000,
				function() {
					$("#ban3>a:first-child").insertAfter("#ban3>a:last-child");
					$("#ban3").css({"margin-left":"0px"});
				}
			)
		}
	</script>
	
</body>
</html>