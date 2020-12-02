<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" session="false"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec"%>
<div class="container">
	<div id="todayShow">
		<div class="artistShowTitle">
			
		</div>
		<div class="artistShowLeftBtn">
			<h1>&lt;</h1>
		</div>
		<div class="artistShow">
			<ul class="artistShowList">
				<li></li>
				<li></li>
				<li></li>
				<li></li>
			</ul>
		</div>
		<div class="artistShowRightBtn">
			<h1>&gt;</h1>
		</div>
	</div>
</div>
<div id="artist">

</div>
<script type="text/javascript">
$(document).ready(function(){
	todayArtistSlide();
});

/* 메인 오늘의 아티스트 슬라인트 이벤트 - 진용현 */

var $slides = $("#todayShow .artistShow .artistShowList li");
var max = $slides.length - 1;
alert(max);
var sno = 0;
var timer = null;

function todayArtistSlide() {
	timer = setTimeout(function() {
		startArtistSlide("right")
	}, 2500);
	$("#mainSlideForm .mainSlideBtn button").eq(sno).addClass("on")
			.siblings().removeClass("on");
}

function startArtistSlide(a) {
	if ($slides.is(":animated") || a == sno)
		return;
	var no, type;
	clearTimeout(timer);
	if (typeof a == "string") {
		type = a;
		//no= type=="left"?sno==0?max:sno-1:sno==max?0:sno+1;
		if (type == "left") {
			if (sno == 0)
				no = max;
			else
				no = sno - 1;
		} else {
			if (sno == max)
				no = 0;
			else
				no = sno + 1;
		}
	} else {
		no = a;
		type = no < sno ? "left" : "right";
	}
	var leftVal = type == "left" ? -100 : 100;

	$slides.eq(no).css("left", leftVal + "%").animate({
		left : 0
	}, 1000);
	$slides.eq(sno).animate({
		"left" : -leftVal + "%"
	}, 1000);

	sno = no;

	todayArtistSlide();
}
</script>

