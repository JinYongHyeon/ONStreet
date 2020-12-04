<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h1>이벤트승인현황</h1>
<sec:csrfInput/>

<c:forEach var="evtlist" items="${requestScope.eventVO.eventList}">
<div class="eventList">
<span id="eventNo">${evtlist.eventNo}</span> <br>
<span id="eventTitle">${evtlist.eventTitle}</span>
<span id="eventContent">${evtlist.eventContent}</span> <br>
<span id="eventDate">${evtlist.eventDate}</span> <br>
<c:set var="eventCheckDate" value="${evtlist.eventCheckDate}"/>
<c:choose>
<c:when test="${!empty eventCheckDate}">
승인
</c:when>
<c:otherwise>
미승인
</c:otherwise>
</c:choose>
</div>
</c:forEach>


<c:set var="pb" value="${requestScope.eventVO.pagingBean}" />
<div class="pagingInfo">
   <ul class="pagination">
   <c:if test="${pb.previousPageGroup}">   
   <li><a href="${pageContext.request.contextPath}/artistCheckEvent.do?pageNo=${pb.startPageOfPageGroup-1}">&laquo;</a></li>
   </c:if>
   <c:forEach var="i" begin="${pb.startPageOfPageGroup}" 
   end="${pb.endPageOfPageGroup}">
   <c:choose>
   <c:when test="${pb.nowPage!=i}">
   <li><a href="${pageContext.request.contextPath}/artistCheckEvent.do?pageNo=${i}">${i}</a></li> 
   </c:when>
   <c:otherwise>
   <li class="active"><a href="#" >${i}</a></li>
   </c:otherwise>
   </c:choose>
   &nbsp;
   </c:forEach>
   <c:if test="${pb.nextPageGroup}">   
   <li><a href="${pageContext.request.contextPath}/artistCheckEvent.do?pageNo=${pb.endPageOfPageGroup+1}">&raquo;</a></li>
   </c:if>
   </ul>          
   </div>  
</body>
</html>