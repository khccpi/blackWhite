<%@ page import="java.util.Arrays"%>
<%@ page import="blackWhitePkg.dto.MemberBean"%>
<%@	page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<jsp:useBean id="mMgr" class="blackWhitePkg.dao.MemberMgr" />

<%
	String sid = (String)session.getAttribute("sid");
	MemberBean mBean = mMgr.modifyMember(sid);
%>

<!DOCTYPE html>
<html lang="ko">
<head>
	<meta charset="UTF-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<title>회원정보수정</title>
	<link rel="stylesheet" href="/style/style_Common.css">
	<link rel="stylesheet" href="/style/style_Template.css">
</head>

<body>
	<div id="wrap">
		<!-- 헤더템플릿 시작 -->
		<%@ include file="/jsp/inc/Header.jsp" %>
		<!-- 헤더템플릿 끝 -->				
				
			<main id="main" class="dFlex">
				
						<!-- 실제 작업 영역 시작 -->
						<div id="contents" class="joinInsert">
							<form name="regFrm" id="regFrm">
										
				 <table id="regFrmTbl">
			 		<caption>회원 정보 수정</caption>
			 		<tbody>
		 				<tr>
	 						<td class="req">아이디</td>
							<td><%=mBean.getuId()%></td>
							<td>&nbsp;</td>
						</tr>
						<tr>
							<td class="req">패스워드</td>
							<td>
								<input type="password" name="uPw" id="uPw" maxlength="20">
								<input type="checkbox" id="pwView"> 비밀번호 보기
							</td>
							<td>
								<span>영어소문자/숫자, _, @, $, 5~20 </span><!--	공통비번1234	로	필	변경!	-->
							</td>
						</tr>
						<tr>
							<td class="req">패스워드 확인</td>
							<td>
								<input type="password" id="uPw_Re" maxlength="20">
								<span id="pwChk"></span>
							</td>
							<td>&nbsp;</td>
						</tr>
						<tr>
							<td class="req">이름</td>
							<td>
								<input type="text" name="uName" id="uName" maxlength="20" value="<%=mBean.getuName()%>">
							</td>
							<td>&nbsp;</td>
						</tr>
						<tr>
							<td class="req">Email</td>
							<td>
								<%
									String uEmail = mBean.getuEmail();
									int idxAt = uEmail.indexOf("@");
				 					String uEmail1 = uEmail.substring(0, idxAt);
									String uEmail2 = uEmail.substring(idxAt+1);
								%>

								<input type="text" id="uEmail_01" maxlength="20" size="7" value="<%=uEmail1%>">
								<span>@</span>
								<input type="text" id="uEmail_02" maxlength="40" size="10" value="<%=uEmail2%>">
								<select id="emailDomain" class="frmDropMenu">
									<option value="">직접입력</option>
									<option>naver.com</option>
									<option>daum.net</option>
								</select>
								<button type="button" id="emailAuthBtn" class="frmBtn">인증코드받기</button>
								<!-- 이메일 인증 영역 시작 : Authentication Code 인증코드-->
								<div id="emailAuthArea">											
									<span>인증코드 입력</span>
									<input type="text" id="emailAuth" size="25">
									<button type="button" class="frmBtn">인증하기</button>
								</div>
								<!--	div#emailAuthArea	-->
								<input type="hidden" name="uEmail" id="uEmail">
							</td>
							<td>&nbsp;</td>
						</tr>
						<tr>
							<td>성별</td>
							<td>
								<%
									String gender = mBean.getGender();
									String chkMale = "";
									String chkFemale = "";
									if(gender != null) {
										if (gender.equals("m")) {
											chkMale = "checked";
										} else if (gender.equals("f")) {
											chkFemale = "checked";
										}
									}
								%>
								<label>남<input type="radio" name="gender" value="m" <%=chkMale%>></label>
								<label>여<input type="radio" name="gender" value="f" <%=chkFemale%>></label>
							</td>
							<td>&nbsp;</td>
						</tr>
						<tr>
							<td>생년월일</td>
							<td>
								<input type="text" name="uBirth" id="uBirth" maxlength="6" size="8" value="<%=mBean.getuBirth()%>">
								&nbsp;&nbsp;&nbsp;&nbsp;
								<span>ex. 830815</span>
							</td>
							<td>&nbsp;</td>
						</tr>
						<tr>
							<td>우편번호</td>
							<td>				
								<input type="text" name="uZipcode" id="uZipcode" maxlength="7" size="7" value="<%=mBean.getuZipcode() %>" readonly>
								<button type="button" id="findZipBtn" class="frmBtn">우편번호찾기</button>
							</td>
							<td>
								<span>우편번호 찾기 버튼을 클릭하세요.</span>
							</td>
						</tr>
						<tr>
							<td>주소</td>
							<td>				
								<input type="text" name="uAddr" id="uAddr" maxlength="100" size="50" value="<%=mBean.getuAddr() %>">
							</td>
							<td>&nbsp;</td>
						</tr>
							<tr>
								<td>좋아하는 음식</td>
									<%
										String[] uFood = mBean.getuFood();				
									%>
									<script src="/script/jquery-3.7.1.min.js"></script>
									<script>
										$(function(){
											let chkBoxAry = <%=Arrays.toString(uFood) %>;			
											console.log("chkBoxAry : " + chkBoxAry);
											let len = chkBoxAry.length;
											console.log("len : " + len);
											let chkToF;
											for (let i = 0; i<len; i++) {
												if (chkBoxAry[i] == 1) chkToF = true;
												$("input[name=uFood]").eq(i).prop("checked", chkToF);
												chkToF = false;
											}
										});
									</script>
									<td>				
										<label> 한식 <input type="checkbox" name="uFood" value="한식"></label> 			
										<label> 중식 <input type="checkbox" name="uFood" value="중식"></label>
										<label> 일식 <input type="checkbox" name="uFood" value="일식"></label>
										<label> 양식 <input type="checkbox" name="uFood" value="양식"></label>
									</td>
									<td></td>
								</tr>
								<tr>
									<td>직업</td>
									<% String uJob = mBean.getuJob(); %>
									<td>				
										<select name="uJob" id="uJob" class="frmDropMenu">
											<option <% if(uJob.equals("")) out.print("selected"); %>> - 선택 - </option>
											<option <% if(uJob.equals("교수")) out.print("selected"); %>>교수</option>
											<option <% if(uJob.equals("학생")) out.print("selected"); %>>학생</option>
											<option <% if(uJob.equals("회사원")) out.print("selected"); %>>회사원</option>
											<option <% if(uJob.equals("공무원")) out.print("selected"); %>>공무원</option>
											<option <% if(uJob.equals("자영업")) out.print("selected"); %>>자영업</option>
											<option <% if(uJob.equals("전문직")) out.print("selected"); %>>전문직</option>
											<option <% if(uJob.equals("주부")) out.print("selected"); %>>주부</option>
											<option <% if(uJob.equals("무직")) out.print("selected"); %>>무직</option>
										</select>
									</td>
									<td></td>
								</tr>
								<tr>
									<td colspan="3">
										<button type="button" id="joinSbmBtn" class="frmBtn">회원가입</button>
										<button type="reset" class="frmBtn">다시쓰기</button>
										<button id="loginBtn" class="frmBtn">로그인</button>
								</td>
								</tr>
							</tbody>
						</table>
					</form>	<!--	form[name=regFrm]	-->
				</div><!--	실제	작업	영역	끝	-->
			</main>		<!--		main#main		-->
				
				<!--		푸터템플릿	시작	-->
				<%@	include	file="/jsp/inc/Footer.jsp"	%>
				<!--		푸터템플릿	끝	-->		
								
		</div>	<!--	div#wrap	-->
		<script	src="/script/script_Join.js"></script>
</body>
</html>