<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" session="false"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>

<script type="text/javascript">
	$(document).ready(function() {
		$("#checkEvent").click(function() {
			var flag = false;
			$(".checkEvent").each(function(){
				if($(this).is(":checked")){
					flag = true;
					return;
				}
			});
			$("#checkEventForm").attr("action", "${pageContext.request.contextPath}/checkEvent.do");
				if(flag === true){
					if(confirm("승인하시겠습니까?"))
						$("#checkEventForm").submit();
				}else if(flag === false){
					alert("승인시킬 이벤트를 선택해주세요!"); 
					return;
				}
		});//click
		
		$("#uncheckEvent").click(function() {
			var flag = false;
			$(".checkEvent").each(function(){
				if($(this).is(":checked")){
					flag = true;
					return;
				}
			});
			$("#checkEventForm").attr("action", "${pageContext.request.contextPath}/uncheckEvent.do");
				if(flag === true){
					if(confirm("반려하시겠습니까?"))
						$("#checkEventForm").submit();
				}else if(flag === false){
					alert("반려하실 이벤트를 선택해주세요!"); 
					return;
				}
		});//click
	});//ready
</script>
<br><br>
<span id="manageFormTitle">MANAGE</span>
<br>
<br>
<br><br>

<sec:csrfInput />
<div class="container">
<form id="manageMemberBtn">
<input type="button" id="checkEvent" value="승인하기">
<input type="button" id="uncheckEvent" value="미승인하기">
</form>
<form method="post" id="checkEventForm">
<table id="manageMemberTable">
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
					<input type="radio" name="checkEvent" value="${evo.eventNo}" class="checkEvent">
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
</div>
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
