<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>
    

<div class="col-sm-2"></div>
<div class="col-sm-8">
<h1><b>MANAGE</b></h1> <br><br>

<sec:csrfInput />

<input type="button" id="checkEvent" value="승인하기">
<form action="${pageContext.request.contextPath}/checkEvent.do" method="post" id="checkEventForm">
<table border="1">
	<thead>
		<tr>
			<th></th>
			<th>이벤트 번호</th>
			<th align="center">아티스트명</th>
			<th align="center">제목</th>
			<th>요청 날짜</th>
			<th>이벤트 날짜</th>
		</tr>
	</thead>
	<tbody>

		<c:set var="pb" value="${requestScope.eventVO.pagingBean}" />
	
		<c:forEach items="${requestScope.eventVO.eventList}" var="evo">
			<tr>
				<td>
					<sec:csrfInput/>
					<input type="hidden" name="test" value="바보">
					<input type="checkbox" name="checkEvent" value="${evo.eventNo}" class="checkEvent">
				</td>
				<td>
				${evo.eventNo}
				</td>
				<td>
				${evo.artistVO.memberVO.nickName}
				</td>
				<td>
				${evo.eventTitle}
				</td>
				<td>
				${evo.eventWriteDate}
				</td>
				<td>
				${evo.eventDate}
				</td>
			</tr>
		</c:forEach>

	</tbody>
</table>
	</form>

<div class="pagingInfo">
	<ul class="pagination">
	<c:if test="${pb.previousPageGroup}">	
	<li><a href="${pageContext.request.contextPath}/getCheckEventList.do?pageNo=${pb.startPageOfPageGroup-1}">&laquo;</a></li>
	</c:if>
	<c:forEach var="i" begin="${pb.startPageOfPageGroup}" 
	end="${pb.endPageOfPageGroup}">
	<c:choose>
	<c:when test="${pb.nowPage!=i}">
	<li><a href="${pageContext.request.contextPath}/getCheckEventList.do?pageNo=${i}">${i}</a></li> 
	</c:when>
	<c:otherwise>
	<li class="active"><a href="#" >${i}</a></li>
	</c:otherwise>
	</c:choose>
	&nbsp;
	</c:forEach>
	<c:if test="${pb.nextPageGroup}">	
	<li><a href="${pageContext.request.contextPath}/getCheckEventList.do?pageNo=${pb.endPageOfPageGroup+1}">&raquo;</a></li>
	</c:if>
	</ul>	 		
	</div>
	</div>
<div class="col-sm-2"></div>
