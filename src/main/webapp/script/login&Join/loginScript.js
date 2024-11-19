$(function() {
	// 비밀번호 보이기
	$("#pwSee").click(()=> {
		if($("#pwSee").prop("checked")) {
			$("#uPw").attr("type","text");
		} else {
			$("#uPw").attr("type","password");
		}
	})
	
	// 로그인
	$("#gogo").click(() => {
		var id = document.getElementById("uId").value;
		var pw = document.getElementById("uPw").value;
		if( id == "" || id == null) {
			alert("아이디를 적으시오.");
			$("#uId").focus();
		} else if(pw == "" || pw == null) {
			alert("비밀번호를 적으시오.");
			$("#uPw").focus();
		} else {
			$("#gogo").attr("form","pass");
			$("#pass").submit();	
		}
	})
	
	// 회원가입
	$("#join").click(() => {
		location.href="/jsp/login&Join/JoinAgree.jsp";
	})
	
	// 게스트로 입장
	$("#tempJoin").click(() => {
		alert("게스트로 입장하셨습니다.");
		location.href="/jsp/List.jsp";
	})
		
});