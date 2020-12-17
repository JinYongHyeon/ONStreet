<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" session="false"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>
<br>
<span id="artistDetailTitle">ARTIST</span>
<div class="container con">

<div class="col-sm-4 artistProfileImg">

<c:choose>
	<c:when test="${requestScope.artistVO.memberVO.profile==null}">
		<img src="${pageContext.request.contextPath}/resources/img/profile/default.png">
	</c:when>
	<c:otherwise>
		<img src="${pageContext.request.contextPath}/resources/img/profile/${requestScope.artistVO.memberVO.profile}">
	</c:otherwise>
</c:choose>

	<br>
</div>
<div class="col-sm-2"></div>
<div class="col-sm-6 artistProfile">
    <span id="artistName">${requestScope.artistVO.memberVO.nickName}</span>
    <sec:authentication property="principal" var="member" />
    	<c:if test="${member.memberVO.id != requestScope.artistVO.memberVO.id}">
    <c:choose>
    	<c:when test="${requestScope.count==0}">
    		<input type="button" value="팔로우" id="follow">
    	</c:when>
    	<c:otherwise>
    		<input type="button" value="팔로우 취소" id="follow">
    	</c:otherwise>
    </c:choose>
    </c:if>
    <hr>
     <form id="memberCountCon">
     	<c:if test="${requestScope.map==null}">
     		🔥현재 ${requestScope.artistVO.memberVO.nickName}의 온도는 0°C🔥
     	</c:if>
	</form>
	<form>
    <input type="button" id="showDateList" value="공연일정보기">
    </form>

<hr>
    <br>
	${requestScope.artistVO.artistInfo}
	<c:if test="${requestScope.artistVO.sns!=null}">
	<hr>
	<img src="${pageContext.request.contextPath}/resources/img/social-media.png">
	<b>공식계정</b> 
		${requestScope.artistVO.sns}<hr>
	</c:if>
	<c:if test="${requestScope.artistVO.account!=null}">
	<img src="${pageContext.request.contextPath}/resources/img/money.png">
	<b>후원계좌</b> 
		${requestScope.artistVO.account} <hr>
	</c:if>
	<br>
	<br>
</div>

	
	<div id="calendar">
		<div class="calendarTitle">
			<h1>아티스트 일정</h1>
			<svg width="2em" height="2em" viewBox="0 0 16 16" class="bi bi-x-square" fill="currentColor" xmlns="http://www.w3.org/2000/svg">
			  <path fill-rule="evenodd" d="M14 1H2a1 1 0 0 0-1 1v12a1 1 0 0 0 1 1h12a1 1 0 0 0 1-1V2a1 1 0 0 0-1-1zM2 0a2 2 0 0 0-2 2v12a2 2 0 0 0 2 2h12a2 2 0 0 0 2-2V2a2 2 0 0 0-2-2H2z" />
			  <path fill-rule="evenodd" d="M4.646 4.646a.5.5 0 0 1 .708 0L8 7.293l2.646-2.647a.5.5 0 0 1 .708.708L8.707 8l2.647 2.646a.5.5 0 0 1-.708.708L8 8.707l-2.646 2.647a.5.5 0 0 1-.708-.708L7.293 8 4.646 5.354a.5.5 0 0 1 0-.708z" />
<			/svg>
		</div>
		<div id="artistCalendar">
			
		</div>
	</div>
	</div>
<link href="${pageContext.request.contextPath}/resources/style/main.min.css" rel="stylesheet"/>
<script  type="text/javascript" src="${pageContext.request.contextPath}/resources/javascript/main.min.js"></script>
<script type="text/javascript">
	$(document).ready(function() {
		
		//캘린더 열기
		$(document).on("click","#showDateList",function(){
			$("#calendar").css({"z-index":"3","top":"60%"});
			$("#calendar").animate({
				opacity: 1,
				top:"50%"
			},1000);
		});
		
		//캘린더 닫기
		$(document).on("click","#calendar .calendarTitle svg",function(){
			$("#calendar").css("z-index","3");
			$("#calendar").animate({
				opacity: 0,
				top:"40%"
			},1000,function(){
				$(this).css("z-index","-3");
			});
		});

		$("#follow").click(function() {
			if($("#follow").val()=="팔로우") {
			
		if(confirm("팔로우 하시겠습니까?")) {
			
		$.ajax({
			type: "post",
			url: "${pageContext.request.contextPath}/registerFollowing.do",
			dataType: "text",
			data: "followingId=${requestScope.artistVO.memberVO.id}",
			beforeSend : function(xhr){   /*데이터를 전송하기 전에 헤더에 csrf값을 설정한다*/
	             xhr.setRequestHeader("${_csrf.headerName}", "${_csrf.token}");
	            },
			success: function(data) {
				if(data==="1") {
					alert("이미 팔로우한 아티스트입니다!");
					$("#follow").attr("value", "팔로우 취소");
					return;
				} else {
					if(confirm("팔로우 리스트로 이동하시겠습니까?")) { 
						location.href="followingList.do";
					} else {
						$("#follow").attr("value", "팔로우 취소");
					}
				}
			}
			});//ajax
		}//confirm
			} else {
				if(confirm("팔로우 취소하시겠습니까?")) {
				$.ajax({
					type: "post",
					url: "${pageContext.request.contextPath}/removeFollowing.do",
					dataType: "text",
					data: "followingId=${requestScope.artistVO.memberVO.id}",
					beforeSend : function(xhr){   /*데이터를 전송하기 전에 헤더에 csrf값을 설정한다*/
			             xhr.setRequestHeader("${_csrf.headerName}", "${_csrf.token}");
			            },
					success: function(data) {
							alert("팔로우 취소되었습니다");
							$("#follow").attr("value", "팔로우");
							return;
					}
					});//ajax
				}
			}
		});
		
		<c:choose>
		<c:when test="${requestScope.map!=null}">
			var memberCountConTxt=${requestScope.map.AVGLIKE};
		</c:when>
		<c:otherwise>
			var memberCountConTxt=0;
		</c:otherwise>
	</c:choose>
	
		$({ val : 0 }).animate({ val : memberCountConTxt }, {
			   duration: 3000,
			  step: function() {
			    var num = numberWithCommas(Math.floor(this.val));
			    $("#memberCountCon").text("🔥현재 ${requestScope.artistVO.memberVO.nickName}의 온도는 "+num+"°C🔥");
			  },
			  complete: function() {
			    var num = numberWithCommas(Math.floor(this.val));
			    $("#memberCountCon").text("🔥현재 ${requestScope.artistVO.memberVO.nickName}의 온도는 "+num+"°C🔥");
			  }
			});

			function numberWithCommas(x) {
			    return x.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
			}
			
			$(document).on("click","#showDateList",function(){
				$("#login").show();
			});
	});//ready
	
	//캘린더 기능
	document.addEventListener('DOMContentLoaded', function() {
		 var calendarEl = document.getElementById('artistCalendar');

		    var calendar = new FullCalendar.Calendar(calendarEl, {
		      headerToolbar: {
		        left: 'prev,next today',
		        center: 'title',
		        /* timeGridWeek,timeGridDay,listMonth */
		        right: 'dayGridMonth'
		      },
		      navLinks: false, // can click day/week names to navigate views
		      businessHours: false, // display business hours
		      editable: false,
		      selectable: true,
		      locale: 'ko',
		      events: [
	    	  <c:forEach items="${requestScope.showVO}" var="showVO" varStatus="status">
				<c:set var="showDate" value="${fn:replace(showVO.showDate,'년', '-')}"/>
				<c:set var="showDate" value="${fn:replace(showDate,'월', '-')}"/>
				<c:set var="showDate" value="${fn:replace(showDate,'일', '')}"/>
				<c:set var="showDate" value="${fn:replace(showDate, ' ', '')}"/>
				<c:set var="showTitle" value="${showVO.showTitle}"/>
				<c:if test="${fn:length(showVO.showTitle)>18}">
				<c:set var="showTitle" value="${fn:substring(showTitle,0,17)}..."/>
				</c:if>
		        {
		          title: '${showTitle}',
		          start: '${showDate}',
		          url :'${pageContext.request.contextPath}/getShowDetail.do?showNo=${showVO.showNo}'
		        },
		        </c:forEach>
		      
		      ]
		      , eventClick:function(event) {
	               location.href=url;
	            }

		    });

		    calendar.render();
	})
	
</script>