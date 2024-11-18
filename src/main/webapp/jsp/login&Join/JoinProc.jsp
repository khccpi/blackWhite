<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:useBean id="memberMgr" class="blackWhitePkg.dao.MemberMgr" />
<jsp:useBean id="mBean" class="blackWhitePkg.dto.MemberBean" />
<jsp:setProperty name="mBean" property="*" />

<%
	request.setCharacterEncoding("UTF-8");
	String uId = request.getParameter("uId");
	boolean joinRes = memberMgr.insertMember(mBean);
%>
<script>
	<% if (joinRes) { 
		session.setAttribute("sid", uId);
		session.setMaxInactiveInterval(1800);
	%>
		alert("회원가입하셨습니다.");
		location.href="/jsp/List.jsp";
	<% } else { %>
		alert("회원가입 중 문제가 발생했습니다. 다시 시도해주세요.\n만일 문제가 계속될 경우 고객센터(02-1234-5678)로 연락해주세요.");
		history.back();
	// 또는	예외처리
	<% } %>
</script>