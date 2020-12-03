<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" session="false"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/security/tags"
	prefix="sec"%>
<div class="container">
	<%-- 오늘으 공연 - 진용현 --%>
	<div id="todayShow">
		<div class="artistShowTitle">
			<h2>오늘의 공연</h2>
		</div>
		<div class="artistShowLeftBtn">
			<h1 onclick="startShowSlide('left')">
				<svg viewBox="0 0 16 16" class="bi bi-chevron-compact-left"
					fill="currentColor" xmlns="http://www.w3.org/2000/svg">
  <path fill-rule="evenodd"
						d="M9.224 1.553a.5.5 0 0 1 .223.67L6.56 8l2.888 5.776a.5.5 0 1 1-.894.448l-3-6a.5.5 0 0 1 0-.448l3-6a.5.5 0 0 1 .67-.223z" />
</svg>
			</h1>
		</div>
		<div class="artistShow">
			<ul class="artistShowList">
				<c:forEach items="${requestScope.todayShow}" var="show">
					<li><a href="${pageContext.request.contextPath}/">
						<div class="todayShowInfo">
						<h1>${show.showTitle}</h1>
						<h2>${show.artistVO.memberVO.nickName}</h2>
						</div>
						</a>
					</li>	
				</c:forEach>
				
			</ul>
		</div>
		<div class="artistShowRightBtn">
			<h1 onclick="startShowSlide('right')">
				<svg viewBox="0 0 16 16" class="bi bi-chevron-compact-right" fill="currentColor" xmlns="http://www.w3.org/2000/svg">
  <path fill-rule="evenodd" d="M6.776 1.553a.5.5 0 0 1 .671.223l3 6a.5.5 0 0 1 0 .448l-3 6a.5.5 0 1 1-.894-.448L9.44 8 6.553 2.224a.5.5 0 0 1 .223-.671z"/>
</svg>
			</h1>
		</div>
	</div>
</div>
<%-- 추천 아티스트 - 진용현 --%>
<div class="container">
	<div id="artisStandardt">
		<div class="artistRecommendationTltle">
			<h2>추천 아티스트</h2>
		</div>
		<div class="artistRecommendationLeftBtn">
			<h1 onclick="artistRecommendationSlide('left')"><svg viewBox="0 0 16 16" class="bi bi-chevron-compact-left"
					fill="currentColor" xmlns="http://www.w3.org/2000/svg">
  <path fill-rule="evenodd"
						d="M9.224 1.553a.5.5 0 0 1 .223.67L6.56 8l2.888 5.776a.5.5 0 1 1-.894.448l-3-6a.5.5 0 0 1 0-.448l3-6a.5.5 0 0 1 .67-.223z" />
</svg></h1>
		</div>
		<div class="artistRecommendation">
		
			<div class="artistRecommendationList">
				<ul>
					<li><img src="${pageContext.request.contextPath}/resources/img/profile/1.jpg"></li>
					<li><img src="${pageContext.request.contextPath}/resources/img/profile/2.jpg"></li>
					<li><img src="${pageContext.request.contextPath}/resources/img/profile/3.jpg"></li>
				</ul>
			</div>
			<div class="artistRecommendationList">
				<ul>
					<li><img src="${pageContext.request.contextPath}/resources/img/profile/4.jpg"></li>
					<li><img src="${pageContext.request.contextPath}/resources/img/profile/5.jpg"></li>
					<li><img src="${pageContext.request.contextPath}/resources/img/profile/6.png"></li>
				</ul>
			</div>
			<div class="artistRecommendationList">
				<ul>
					<li><img src="${pageContext.request.contextPath}/resources/img/profile/7.jpg"></li>
					<li><img src="${pageContext.request.contextPath}/resources/img/profile/8.jpg"></li>
					<li><img src="${pageContext.request.contextPath}/resources/img/profile/9.jpg"></li>
				</ul>
			</div>
		</div>
		<%-- artistRecommendation END  --%>
		<div class="artistRecommendationRightBtn">
		<h1 onclick="artistRecommendationSlide('right')"><svg viewBox="0 0 16 16" class="bi bi-chevron-compact-right" fill="currentColor" xmlns="http://www.w3.org/2000/svg">
  <path fill-rule="evenodd" d="M6.776 1.553a.5.5 0 0 1 .671.223l3 6a.5.5 0 0 1 0 .448l-3 6a.5.5 0 1 1-.894-.448L9.44 8 6.553 2.224a.5.5 0 0 1 .223-.671z"/>
</svg></h1>
		</div>
	</div>
	<%-- artisStandardt END --%>
</div>
<%-- container END --%>
<script type="text/javascript">
	$(document).ready(function() {
		todayShowSlide();
	});

	/* 메인 오늘의 아티스트 슬라인트 이벤트 - 진용현 */
	var $slides = $("#todayShow .artistShow .artistShowList li");
	var max = $slides.length - 1;
	var sno = 0;
	var timer = null;

	function todayShowSlide() {
		timer = setTimeout(function() {
			startShowSlide("right")
		}, 2500);
		//$("#mainSlideForm .mainSlideBtn button").eq(sno).addClass("on").siblings().removeClass("on");
	}

	function startShowSlide(a) {
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

		todayShowSlide();
	}
	/* 추천 아티스트 슬라이드*/
	var $artistSlides = $("#artisStandardt .artistRecommendation .artistRecommendationList");
	var artistMax = $artistSlides.length - 1;
	var artistSno = 0;

	/*
	 function recommendationArtistSlide() {
	 timer = setTimeout(function() {
	 startArtistSlide("right")
	 }, 2500);
	 //$("#mainSlideForm .mainSlideBtn button").eq(sno).addClass("on").siblings().removeClass("on");
	 }*/

	function artistRecommendationSlide(a) {
		if ($artistSlides.is(":animated") || a == artistSno)
			return;
		var no, type;
		//clearTimeout(timer);
		if (typeof a == "string") {
			type = a;
			//no= type=="left"?sno==0?max:sno-1:sno==max?0:sno+1;
			if (type == "left") {
				if (artistSno == 0)
					no = artistMax;
				else
					no = artistSno - 1;
			} else {
				if (artistSno == artistMax)
					no = 0;
				else
					no = artistSno + 1;
			}
		} else {
			no = a;
			type = no < artistSno ? "left" : "right";
		}
		var leftVal = type == "left" ? -100 : 100;

		$artistSlides.eq(no).css("left", leftVal + "%").animate({
			left : 0
		}, 1000);
		$artistSlides.eq(artistSno).animate({
			"left" : -leftVal + "%"
		}, 1000);
		artistSno = no;

		//todayArtistSlide();
	}
</script>

