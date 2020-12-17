<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" session="false"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>
<div class="showListTitle">
<span id="showListTitle">SHOW</span>
</div>
<div class="container">
<table id="showListTable" class="table table-striped table-condensed">
	<thead>
		<tr class="success">
			<th>번호</th>
			<th>제목</th>
			<th>작성자</th>
			<th>공연일시</th>
		</tr>
		
		
	</thead>

	<tbody>
	<c:if test="${requestScope.nlvo.size()!=0}">
	<%-- <c:forEach items="${requestScope.nlvo.noList}" begin="0" end="1" varStatus="order" var="noList"> --%>
		<tr id="showListTableNotice">
		<td>${requestScope.totalNoticePostCount}</td>
		<td id="showListTitleTd"><a href="getNoticeDetail.do?noticeNo=${requestScope.nlvo[0].noticeNo}">${requestScope.nlvo[0].noticeTitle}</a></td>		
		<td>${requestScope.nlvo[0].memberVO.nickName}</td>		
		<td>${requestScope.nlvo[0].noticeWriteDate}</td>
		</tr>
		<tr id="showListTableNotice">
		<td>${requestScope.totalNoticePostCount-1}</td>
		<td id="showListTitleTd"><a href="getNoticeDetail.do?noticeNo=${requestScope.nlvo[1].noticeNo}">${requestScope.nlvo[1].noticeTitle}</a></td>		
		<td>${requestScope.nlvo[1].memberVO.nickName}</td>		
		<td>${requestScope.nlvo[1].noticeWriteDate}</td>		
		</tr>
		<%-- </c:forEach> --%>
		</c:if>
		
		<c:set var="pb" value="${requestScope.slvo.pagingBean}" />

		<c:forEach items="${requestScope.slvo.list}" var="list" varStatus="status">
			<tr>
				<td>
				${requestScope.totalPostCount-((pb.nowPage-1)*pb.postCountPerPage+status.index)}
				</td>
				<td id="showListTitleTd">
 
				<a href="getShowDetail.do?showNo=${list.showNo}">
				${list.showTitle}
				</a>
				</td>
				<td>
				<div id="showListNickNameTd">
				${list.artistVO.memberVO.nickName}
				</div>
				</td>
				<td align="center">
				${list.showDate}
				</td>
			</tr>
		</c:forEach>
	</tbody>
</table>
<sec:authorize access="hasRole('ROLE_ARTIST')">
	
	<div align="right">
		<form method="get" action="addShowForm.do" id="showListRegisterBtn">
			<sec:csrfInput/>
			<input type="submit" class="btn btn-primary" value="공연등록"/>
		</form>
	</div>
	</sec:authorize>
<div class="pagingInfo">
	<ul class="pagination">
	<c:if test="${pb.previousPageGroup}">	
	<li>
	<c:choose>
		<c:when test="${requestScope.searchContent != null}">
				<a href="${pageContext.request.contextPath}/getShowSearchList.do?pageNo=${pb.startPageOfPageGroup-1}&searchContent=${requestScope.searchContent}">&laquo;</a>
		</c:when>
		<c:otherwise>
			<a href="${pageContext.request.contextPath}/getShowList.do?pageNo=${pb.startPageOfPageGroup-1}">&laquo;</a>
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
			<a href="${pageContext.request.contextPath}/getShowSearchList.do?pageNo=${i}&searchContent=${requestScope.searchContent}">${i}</a>
		</c:when>
		<c:otherwise>
			<a href="${pageContext.request.contextPath}/getShowList.do?pageNo=${i}">${i}</a>
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
			<a href="${pageContext.request.contextPath}/getShowSearchList.do?pageNo=${pb.endPageOfPageGroup+1}&searchContent=${requestScope.searchContent}">&raquo;</a>
		</c:when>
		<c:otherwise>
			<a href="${pageContext.request.contextPath}/getShowList.do?pageNo=${pb.endPageOfPageGroup+1}">&raquo;</a>
		</c:otherwise>
	</c:choose>
	</li>
	</c:if>
	</ul>	 		
	</div>
	</div>