<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>흑백 요리사 정보</title>
<link rel="stylesheet" href="/style/mainStyle.css" />
</head>
<body>
	<div id="wrap">
		<jsp:include page="/jsp/inc/header.jsp" />
		<!-- header 영역 -->
		<jsp:include page="/jsp/inc/gnb.jsp" />
		<!-- gnb 영역 -->

		<!-- main 영역 -->
		<div id="main">
			<jsp:include page="/jsp/inc/main_left.jsp" />
			<!-- left 영역 -->
			<jsp:include page="/jsp/inc/main_right.jsp" />
			<!-- right 영역 -->
		</div>

		<jsp:include page="/jsp/inc/footer.jsp" />
		<!-- footer 영역 -->
	</div>

	<script src="/script/jquery-3.7.1.min.js"></script>
	<script src="/script/listScript.js"></script>
</body>
</html>