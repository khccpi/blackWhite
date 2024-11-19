$(function() {
	// gnb
	$("#mainMenu>li.mainLi").mouseenter(function () {
		$(this).children("ul.subMenu").stop().slideDown(600);
	});
	$("#mainMenu>li.mainLi").mouseleave(function () {
		$(this).children("ul.subMenu").stop().slideUp(300);
	});
  
  	// 심사위원
	$("#simsa").click(()=> {
		$("#contents2").css("display","none");
		$("#contents3").css("display","none");
		$("#contents4").css("display","none");
		$("#contents1").css("display","flex");
	})
	
	// 백색 요리사
	$("#whiteCk").click(()=> {
		$("#contents1").css("display","none");
		$("#contents3").css("display","none");
		$("#contents4").css("display","none");
		$("#contents2").css("display","flex");
	})
	
	// 흑색 요리사(상위 20위)
	$("#blackTop").click(()=> {
		$("#contents1").css("display","none");
		$("#contents2").css("display","none");
		$("#contents4").css("display","none");
		$("#contents3").css("display","flex");
	})
	
	// 흑색 요리사(그 외)
	$("#blackOth").click(()=> {
		$("#contents1").css("display","none");
		$("#contents2").css("display","none");
		$("#contents3").css("display","none");
		$("#contents4").css("display","flex");
	})
	
});