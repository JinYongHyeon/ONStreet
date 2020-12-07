<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" session="false"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="ie=edge">
</head>
<body>
<h1><b>EVENT</b></h1> <br>

<div id="event">
<sec:authorize access="hasRole('ROLE_ARTIST')">
	<a href="${pageContext.request.contextPath}/addEventForm.do">이벤트 등록</a>
</sec:authorize>
<br><br>
</div>
<c:forEach var="evo" items="${requestScope.eventVO.eventList}">
<div class="eventList">
<a href="getEventDetail.do?eventNo=${evo.eventNo}">
<img src="${pageContext.request.contextPath}/resources/img/content/${evo.eventImage}"></a> <br>
<span id="eventTitle">${evo.eventTitle}</span> <br>
<span id="eventDate">${evo.eventDate}</span> <br><br>
</div>
</c:forEach>

<c:set var="pb" value="${requestScope.eventVO.pagingBean}" />
<div class="pagingInfo">
   <ul class="pagination">
   <c:if test="${pb.previousPageGroup}">   
   <li><a href="${pageContext.request.contextPath}/getEventList.do?pageNo=${pb.startPageOfPageGroup-1}">&laquo;</a></li>
   </c:if>
   <c:forEach var="i" begin="${pb.startPageOfPageGroup}" 
   end="${pb.endPageOfPageGroup}">
   <c:choose>
   <c:when test="${pb.nowPage!=i}">
   <li><a href="${pageContext.request.contextPath}/getEventList.do?pageNo=${i}">${i}</a></li> 
   </c:when>
   <c:otherwise>
   <li class="active"><a href="#" >${i}</a></li>
   </c:otherwise>
   </c:choose>
   &nbsp;
   </c:forEach>
   <c:if test="${pb.nextPageGroup}">   
   <li><a href="${pageContext.request.contextPath}/getEventList.do?pageNo=${pb.endPageOfPageGroup+1}">&raquo;</a></li>
   </c:if>
   </ul>          
   </div> 
</body>
</html>