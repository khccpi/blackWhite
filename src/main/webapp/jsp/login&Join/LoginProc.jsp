<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<jsp:useBean id="memberMgr" class="blackWhitePkg.dao.MemberMgr" />

<%
	request.setCharacterEncoding("UTF-8");	
	String uId = request.getParameter("uId");
	String uPw = request.getParameter("uPw");
	boolean loginRes = memberMgr.loginMember(uId, uPw);
	
%>

<script>
	<%
		if(loginRes) { 
			session.setAttribute("sid", uId);
			session.setMaxInactiveInterval(1800);
	%>
		alert("로그인 되셨습니다.");
		
		
		location.href="/jsp/List.jsp";
	<% } else { %>
		alert("일치하는 정보가 없습니다.");
		history.back();
	<% } %>
</script>