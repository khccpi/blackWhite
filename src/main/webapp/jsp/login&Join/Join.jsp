<%@ page language="java" contentType="text/html; charset=UTF-8"
				pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입</title>
<link rel="stylesheet" href="/style/style_Common.css" />
<link rel="stylesheet" href="/style/style_Template.css">
</head>
<body>
	<div id="wrap">
		<!-- 헤더템플릿 시작 -->
		<%@	include file="/jsp/inc/Header.jsp"%>
		<!-- 헤더템플릿 끝 -->
		<main id="main" class="dFlex">
		<!-- 실제 작업 영역 시작 -->
			<div id="contents" class="joinInsert">
				<form name="regFrm" id="regFrm">
					<table id="regFrmTbl">
						<caption>회원 가입</caption>
							<tbody>
								<tr>
									<td class="req">아이디</td>
									<td>
										<input type="text" name="uId" id="uId" maxlength="20" autofocus>
										<button type="button" id="idChkBtn" class="frmBtn">ID중복확인</button></td>
									<td><span>영어대소문자, 숫자조합(3~20)</span></td>
								</tr>
								<tr>
									<td class="req">패스워드</td>
									<td>
										<input type="password" name="uPw" id="uPw" maxlength="20">
										<input type="checkbox" id="pwView">
										비밀번호 보기
									</td>
									<td><span>영어소문자/숫자, _, @, $,5~20 </span> <!--	공통비번1234	로	필	변경!	--></td>
								</tr>
								<tr>
									<td class="req">패스워드 확인</td>
									<td><input type="password" id="uPw_Re" maxlength="20">
									<span id="pwChk"></span></td>
									<td>&nbsp;</td>
								</tr>
								<tr>
									<td class="req">이름</td>
									<td><input type="text" name="uName" id="uName" maxlength="20"></td>
									<td>&nbsp;</td>
								</tr>
								<tr>
									<td class="req">Email</td>
									<td>
										<input type="text" id="uEmail_01" maxlength="20" size="7">
										<span>@</span>
										<input type="text" id="uEmail_02" maxlength="40" size="10">
										<select id="emailDomain" class="frmDropMenu">
											<option value="">직접입력</option>
											<option>naver.com</option>
											<option>daum.net</option>
										</select>
										<button type="button" id="emailAuthBtn" class="frmBtn">인증코드받기</button>

						<!--		이메일	인증	영역	시작	:	Authentication	Code	인증코드-->
										<div id="emailAuthArea">
											<span>인증코드 입력</span>
											<input type="text" id="emailAuth" size="25">
											<button type="button" class="frmBtn">인증하기</button>
										</div>
										<input type="hidden" name="uEmail" id="uEmail">
									</td>
									<td>&nbsp;</td>
								</tr>
								<tr>
									<td>성별</td>
									<td>
										<label> 남 <input type="radio" name="gender" value="m"></label>
										<label> 여 <input type="radio" name="gender" value="f"></label>
									</td>
									<td>&nbsp;</td>
								</tr>
								<tr>
									<td>생년월일</td>
									<td>
										<input type="text" name="uBirth" id="uBirth" maxlength="6" size="8">
										&nbsp;&nbsp;&nbsp;&nbsp;
										<span>ex. 830815</span>
									</td>
									<td>&nbsp;</td>
								</tr>
								<tr>
									<td>우편번호</td>
									<td>
										<input type="text" name="uZipcode" id="uZipcode" maxlength="7" size="7" readonly>
										<button type="button" id="findZipBtn" class="frmBtn">우편번호찾기</button>
									</td>
									<td><span>우편번호 찾기 버튼을 클릭하세요.</span></td>
								</tr>
								<tr>
									<td>주소</td>
									<td><input type="text" name="uAddr" id="uAddr" maxlength="100" size="50"></td>
									<td>&nbsp;</td>
								</tr>
								<tr>
									<td>좋아하는 음식</td>
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
									<td>
										<select name="uJob" id="uJob" class="frmDropMenu">
											<option value="">- 선택 -</option>
											<option>교수</option>
											<option>학생</option>
											<option>회사원</option>
											<option>공무원</option>
											<option>자영업</option>
											<option>전문직</option>
											<option>주부</option>
											<option>무직</option>
										</select>
									</td>
									<td></td>
								</tr>
								<tr>
									<td colspan="3">
										<button type="button" id="joinSbmBtn" class="frmBtn">회원가입</button>
										<button type="reset" class="frmBtn">다시쓰기</button>
										<button type="button" id="loginBtn" class="frmBtn">로그인</button>
									</td>
								</tr>
							</tbody>
						</table>
					</form>
				</div>
				<!--	실제	작업	영역	끝	-->
			</main>
							<!--		main#main		-->

							<!--		푸터템플릿	시작	-->
							<%@	include file="/jsp/inc/Footer.jsp"%>
							<!--		푸터템플릿	끝	-->

				</div>
				<!--	div#wrap	-->

		<script src="/script/jquery-3.7.1.min.js"></script>
		<script src="/script/login&Join/joinAgree.js"></script>
</body>
</html>