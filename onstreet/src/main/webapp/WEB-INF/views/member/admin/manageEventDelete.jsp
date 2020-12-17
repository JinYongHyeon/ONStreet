<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>
    
<script type="text/javascript">
if($(window).width()<500){
	alert("관리자페이지는 PC를 이용해 주십시오");
	location.href="${pageContext.request.contextPath}/home.do";
}	
	$(document).ready(function() {
		$("#deleteEvent").click(function() {
			var flag = false;
			$(".deleteEvent").each(function(){
				if($(this).is(":checked")){
					flag = true;
					return;
				}
			});
				if(flag === true){
					if(confirm("정말로 삭제하시겠습니까?"))
						$("#deleteEventForm").submit();
				}else if(flag === false){
					alert("삭제시킬 이벤트를 선택해주세요!"); 
					return;
				}
		});//click
		$("#allNoticeCheck").change(function() {
	   		 $("#deleteEventForm :checkbox[name=deleteEvent]").prop("checked",$(this).prop("checked"))
		});
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
<input type="button" id="deleteEvent" value="삭제하기">
<a href="${pageContext.request.contextPath}/getManageShowList.do">공연일정 목록 보기</a>
</form>
<form action="${pageContext.request.contextPath}/deleteEvent.do" method="post" id="deleteEventForm">
<table id="manageMemberTable">
	<thead>
		<tr>
			<th><input type="checkbox" id="allNoticeCheck"></th>
			<th>이벤트 번호</th>
			<th>아티스트명</th>
			<th>제목</th>
			<th>이벤트 날짜</th>
			<th>요청 날짜</th>
			<th>승인 날짜</th>
		</tr>
	</thead>
	<tbody>

		<c:set var="pb" value="${requestScope.eventVO.pagingBean}" />
	
		<c:forEach items="${requestScope.eventVO.eventList}" var="evo">
			<tr>
				<td>
					<sec:csrfInput/>
					<input type="checkbox" name="deleteEvent" value="${evo.eventNo}" class="deleteEvent">
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
				${evo.eventDate}
				</td>
				<td>
				${evo.eventWriteDate}
				</td>
				<td>
				${evo.eventCheckDate}
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
	<li><a href="${pageContext.request.contextPath}/manageEventList.do?pageNo=${pb.startPageOfPageGroup-1}">&laquo;</a></li>
	</c:if>
	<c:forEach var="i" begin="${pb.startPageOfPageGroup}" 
	end="${pb.endPageOfPageGroup}">
	<c:choose>
	<c:when test="${pb.nowPage!=i}">
	<li><a href="${pageContext.request.contextPath}/manageEventList.do?pageNo=${i}">${i}</a></li> 
	</c:when>
	<c:otherwise>
	<li class="active"><a href="#" >${i}</a></li>
	</c:otherwise>
	</c:choose>
	&nbsp;
	</c:forEach>
	<c:if test="${pb.nextPageGroup}">	
	<li><a href="${pageContext.request.contextPath}/manageEventList.do?pageNo=${pb.endPageOfPageGroup+1}">&raquo;</a></li>
	</c:if>
	</ul>	 		
	</div>

