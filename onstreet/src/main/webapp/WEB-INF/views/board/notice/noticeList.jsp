<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" session="false"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%> 
<table border="1">
<thead>
<tr>
<th>번호</th>
<th>제목</th>
<th>작성일시</th>
<th>작성자닉네임</th>
</tr>
</thead>
<tbody>
<c:forEach var="list" items="${requestScope.lvo}">
<tr>
<td>${list.noticeNo}</td>
<td><a href="getNoticeDetail.do?noticeNo=${list.noticeNo}">
  ${list.noticeTitle}</a></td>
<td>${list.noticeWriteDate}</td>
<td>${list.memberVO.nickName}</td>
</tr>
</c:forEach>	
</tbody>
</table>
<ul class="pagination">
	<c:if test="${pb.previousPageGroup}">	
	<li><a href="${pageContext.request.contextPath}/getNoticeList.do?pageNo=${pb.startPageOfPageGroup-1}">&laquo;</a></li>
	</c:if>
	<c:forEach var="i" begin="${pb.startPageOfPageGroup}" 
	end="${pb.endPageOfPageGroup}">
	<c:choose>
	<c:when test="${pb.nowPage!=i}">
	<li><a href="${pageContext.request.contextPath}/getNoticeList.do?pageNo=${i}">${i}</a></li> 
	</c:when>
	<c:otherwise>
	<li class="active"><a href="#">${i}</a></li>
	</c:otherwise>
	</c:choose>
	&nbsp;
	</c:forEach>
	<c:if test="${pb.nextPageGroup}">	
	<li><a href="${pageContext.request.contextPath}/getNoticeList.do?pageNo=${pb.endPageOfPageGroup+1}">&raquo;</a></li>
	</c:if>
	</ul><br>	 			
 <div class="col-sm-8" align="right">
 <form action="addNoticeForm.do" method="get">
 <input type="submit" value="등록">
 </form>
 </div>