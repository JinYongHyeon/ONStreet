<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8" session="false"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/security/tags"
   prefix="sec"%>
   
  <div id="mainVideo">
  <sec:authorize access="!hasRole('ROLE_MEMBER')">
     <div class="mainVideoLoginForm">
        <span id="loginFormBtn">로그인</span>
        <span onclick="location.href='${pageContext.request.contextPath}/checkDocument.do'">회원가입</span>
     </div>
     </sec:authorize>
  <sec:authorize access="hasRole('ROLE_MEMBER')">
     <div class="mainContent">

        <h1><b>Welcome</b></h1>
        <h3><b>Onstreet</b></h3>
     </div>
     <div class="mainMoveControl">
        <span>
           <svg xmlns="http://www.w3.org/2000/svg"  fill="currentColor" class="bi bi-arrow-down-circle" viewBox="0 0 16 16">
              <path fill-rule="evenodd" d="M8 15A7 7 0 1 0 8 1a7 7 0 0 0 0 14zm0 1A8 8 0 1 0 8 0a8 8 0 0 0 0 16z"/>
              <path fill-rule="evenodd" d="M8 4a.5.5 0 0 1 .5.5v5.793l2.146-2.147a.5.5 0 0 1 .708.708l-3 3a.5.5 0 0 1-.708 0l-3-3a.5.5 0 1 1 .708-.708L7.5 10.293V4.5A.5.5 0 0 1 8 4z"/>
         </svg>
        </span>
     </div>
  </sec:authorize>
   <video autoplay="autoplay" loop muted>
      <source src="${pageContext.request.contextPath}/resources/img/main.mp4" type="video/mp4">
   </video>
  </div>
<div class="container">
   <%-- 오늘으 공연 - 진용현 --%>
   <div id="todayShow">
      <div class="artistShowTitle">
         <h2>오늘의 공연</h2>
      </div>
      <div class="artistShowLeftBtn">
         <span onclick="startShowSlide('left')">
            <svg xmlns="http://www.w3.org/2000/svg"  fill="currentColor" class="bi bi-caret-left-fill" viewBox="0 0 16 16">
  <path d="M3.86 8.753l5.482 4.796c.646.566 1.658.106 1.658-.753V3.204a1 1 0 0 0-1.659-.753l-5.48 4.796a1 1 0 0 0 0 1.506z"/>
</svg></span>
      </div>
      <div class="artistShow">
         <ul class="artistShowList">
         <c:choose>
            <c:when test="${requestScope.todayShow.size() == 0}">
               <li><div class="todayShowInfo"><h1>오늘의 공연이 없습니다.</h1></div></li>
            </c:when>
            <c:otherwise>
               <c:forEach items="${requestScope.todayShow}" var="show" varStatus="index">
               <li><a href="${pageContext.request.contextPath}/getShowDetail.do?showNo=${show.showNo}">
                  <div class="todayShowInfo">
                  <h1>${show.showTitle}</h1>
                  <h2>${show.artistVO.memberVO.nickName}</h2>
                  </div>
                  </a>
               </li>   
            </c:forEach>
            </c:otherwise>
         </c:choose>
         </ul>
      </div>
      <div class="artistShowRightBtn">
         <span onclick="startShowSlide('right')">
            <svg xmlns="http://www.w3.org/2000/svg" fill="currentColor" class="bi bi-caret-right-fill" viewBox="0 0 16 16">
  <path d="M12.14 8.753l-5.482 4.796c-.646.566-1.658.106-1.658-.753V3.204a1 1 0 0 1 1.659-.753l5.48 4.796a1 1 0 0 1 0 1.506z"/>
</svg></span>
      </div>
   </div>
<%-- 추천 아티스트 - 진용현 --%>
   <div id="artisStandardt">
      <div class="artistRecommendationTltle">
         <h2>추천 아티스트</h2>
      </div>
      <div class="artistRecommendationLeftBtn">
         <span onclick="artistRecommendationSlide('left')"><svg xmlns="http://www.w3.org/2000/svg"  fill="currentColor" class="bi bi-caret-left-fill" viewBox="0 0 16 16">
  <path d="M3.86 8.753l5.482 4.796c.646.566 1.658.106 1.658-.753V3.204a1 1 0 0 0-1.659-.753l-5.48 4.796a1 1 0 0 0 0 1.506z"/>
</svg></span>
      </div>
      <div class="artistRecommendation">
         <c:choose>
            <c:when test="${requestScope.recommendation.size()==0}">
               <h1>추천할 아티스트가 없습니다.</h1>
            </c:when>
            <c:otherwise>
               <c:forEach items="${requestScope.recommendation}" var="rt" varStatus="point">
                  <c:if test="${point.first || point.index ==  3 || point.index == 6}"><div class="artistRecommendationList"><ul></c:if>
                  <c:choose>
                     <c:when test="${rt.profile==null}">
                  <li><a href="${pageContext.request.contextPath}/getArtistDetail.do?id=${rt.id}"><img src="${pageContext.request.contextPath}/resources/img/profile/default.png"><span>${rt.nickName}</span>
                        </a></li>
                     </c:when>
                     <c:otherwise>
                     <li><a href="${pageContext.request.contextPath}/getArtistDetail.do?id=${rt.id}"><img src="${pageContext.request.contextPath}/resources/img/profile/${rt.profile}">
                        <span>${rt.nickName}</span></a>
                     </li>
                     </c:otherwise>
                  </c:choose>
                  <c:if test="${point.index == 2 || point.index ==  5 || point.index == 8 || point.last}"></ul></div></c:if>
               </c:forEach>
            </c:otherwise>
         </c:choose>
      </div>
      <%-- artistRecommendation END  --%>
      <div class="artistRecommendationRightBtn">
      <span onclick="artistRecommendationSlide('right')"><svg xmlns="http://www.w3.org/2000/svg" fill="currentColor" class="bi bi-caret-right-fill" viewBox="0 0 16 16">
  <path d="M12.14 8.753l-5.482 4.796c-.646.566-1.658.106-1.658-.753V3.204a1 1 0 0 1 1.659-.753l5.48 4.796a1 1 0 0 1 0 1.506z"/>
</svg></span>
      </div>
   </div>
   <%-- artisStandardt END --%>
</div>
<%-- container END --%>
<script type="text/javascript">
   $(document).ready(function() {
      todayShowSlide();
      
      /* 메인비디오 화살표 클릭 이벤트 */
      $(document).on("click","#mainVideo .mainMoveControl span",function(){
          $('html,body').animate({
            scrollTop:$("#todayShow").offset().top },'slow'); 
      });
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
      if ($slides.is(":animated") || a == sno || max==0)
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


   function artistRecommendationSlide(a) {
      if ($artistSlides.is(":animated") || a == artistSno || artistMax<1)
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
   }
   
   
</script>
