<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" session="false"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<style>
	.container{
		width:1550px;
	}
</style>
<div class="container con">
<span id="artistTitle">ARTIST</span> <br>
<div id="artist">
<c:forEach var="avo" items="${requestScope.artistVO.artistList}">
<div class="artistList">
<c:choose>
	<c:when test="${avo.memberVO.profile == null}">
		<img src="${pageContext.request.contextPath}/resources/img/profile/default.png"> <br>
	</c:when>
	<c:otherwise>
		<img src="${pageContext.request.contextPath}/resources/img/profile/${avo.memberVO.profile}"> <br>
	</c:otherwise>
</c:choose>
<a href="${pageContext.request.contextPath}/getArtistDetail.do?id=${avo.memberVO.id}">${avo.memberVO.nickName}</a> <br>
</div>
</c:forEach>
</div>

<c:set var="pb" value="${requestScope.artistVO.pagingBean}" />
<div class="pagingInfo">
   <ul class="pagination">
   <c:if test="${pb.previousPageGroup}">   
   <li>
	   <c:choose>
	   	<c:when test="${requestScope.searchContent != null}">
	   	 <a href="${pageContext.request.contextPath}/getAristSearchList.do?pageNo=${pb.startPageOfPageGroup-1}&searchContent=${requestScope.searchContent}">&laquo;</a>
	   	</c:when>
	   	<c:otherwise>
		   <a href="${pageContext.request.contextPath}/getArtistList.do?pageNo=${pb.startPageOfPageGroup-1}">&laquo;</a>
	   	</c:otherwise>
	   </c:choose>
   </li>
   </c:if>
   <c:forEach var="i" begin="${pb.startPageOfPageGroup}" 
   end="${pb.endPageOfPageGroup}">
   <c:choose>
   <c:when test="${pb.nowPage!=i}">
   <li>
	   <c:choose>
	   	<c:when test="${requestScope.searchContent != null}">
	   		<a href="${pageContext.request.contextPath}/getAristSearchList.do?pageNo=${i}&searchContent=${requestScope.searchContent}">${i}</a>
	   	</c:when>
	   	<c:otherwise>
		   	<a href="${pageContext.request.contextPath}/getArtistList.do?pageNo=${i}">${i}</a>
	   	</c:otherwise>
	   </c:choose>
   </li> 
   </c:when>
   <c:otherwise>
   <li class="active"><a href="#" >${i}</a></li>
   </c:otherwise>
   </c:choose>
   &nbsp;
   </c:forEach>
   <c:if test="${pb.nextPageGroup}">   
   <li>
	   <c:choose>
	   	<c:when test="${requestScope.searchContent != null}">
	   	  <a href="${pageContext.request.contextPath}/getAristSearchList.do?pageNo=${pb.endPageOfPageGroup+1}&searchContent=${requestScope.searchContent}">&raquo;</a>
	   	</c:when>
	   	<c:otherwise>
	   	  <a href="${pageContext.request.contextPath}/getArtistList.do?pageNo=${pb.endPageOfPageGroup+1}">&raquo;</a>
	   	</c:otherwise>
	   </c:choose>
   </li>
   </c:if>
   </ul>          
   </div>    
</div>
