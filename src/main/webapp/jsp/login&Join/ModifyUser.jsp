<%@ page import="java.util.Arrays"%>
<%@ page import="blackWhitePkg.dto.MemberBean"%>
<%@	page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<jsp:useBean id="mMgr" class="blackWhitePkg.dao.MemberMgr" />

<%
	String sid = (String)session.getAttribute("sid");
	out.print("sid : " + session.getAttribute("sid")); %>
	