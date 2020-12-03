<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" session="false"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>
<div class="col-sm-2"></div>
<div class="col-sm-8">
<h1><b>MANAGE</b></h1> <br><br>
<table border="1">
	<thead>
		<tr>
			<th></th>
			<th>제목</th>
			<th align="center">작성자</th>
			<th align="center">공연일시</th>
		</tr>
	</thead>

	<tbody>

		<c:set var="pb" value="${requestScope.slvo.pagingBean}" />

		<c:forEach items="${requestScope.slvo.list}" var="list" varStatus="status">
			<tr>
				<td>
				<input type="checkbox">
				</td>
				<td>
				${list.showTitle}
				</td>
				<td>
				${list.artistVO.memberVO.nickName}
				</td>
				<td>
				${list.showDate}
				</td>
			</tr>
		</c:forEach>
	</tbody>
</table>

<div class="pagingInfo">
	<ul class="pagination">
	<c:if test="${pb.previousPageGroup}">	
	<li><a href="${pageContext.request.contextPath}/getManageShowList.do?pageNo=${pb.startPageOfPageGroup-1}">&laquo;</a></li>
	</c:if>
	<c:forEach var="i" begin="${pb.startPageOfPageGroup}" 
	end="${pb.endPageOfPageGroup}">
	<c:choose>
	<c:when test="${pb.nowPage!=i}">
	<li><a href="${pageContext.request.contextPath}/getManageShowList.do?pageNo=${i}">${i}</a></li> 
	</c:when>
	<c:otherwise>
	<li class="active"><a href="#" >${i}</a></li>
	</c:otherwise>
	</c:choose>
	&nbsp;
	</c:forEach>
	<c:if test="${pb.nextPageGroup}">	
	<li><a href="${pageContext.request.contextPath}/getManageShowList.do?pageNo=${pb.endPageOfPageGroup+1}">&raquo;</a></li>
	</c:if>
	</ul>	 		
	</div>
	</div>
<div class="col-sm-2"></div>