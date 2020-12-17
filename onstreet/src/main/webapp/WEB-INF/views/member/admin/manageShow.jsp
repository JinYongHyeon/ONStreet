<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" session="false"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>

<script type="text/javascript">
if($(window).width()<500){
	alert("관리자페이지는 PC를 이용해 주십시오");
	location.href="${pageContext.request.contextPath}/home.do";
}	
	$(document).ready(function() {
		$("#removeShow").click(function() {
			var flag = false;
			$(".checkShow").each(function(){
				if($(this).is(":checked")){
					flag = true;
					return;
				}
			});
				if(flag === true){
					if(confirm("정말로 삭제하시겠습니까?"))
						$("#removeShowForm").submit();
				}else if(flag === false){
					alert("삭제시킬 게시물을 선택해주세요!"); 
					return;
				}
		});//click
		
		$(document).on("submit","#searchManageForm",function(){
			var content = $("#searchManageForm input[name=searchShow]").val();
			if(content.trim()===""){
				alert("공백은 검색이 제한됩니다. 다시 입력해 주십시오.");
				$("#searchManageForm input[name=searchShow]").val("");
				$("#searchManageForm input[name=searchShow]").focus();
				return false;
			}
		});
		$("#allNoticeCheck").change(function() {
	   		 $("#removeShowForm :checkbox[name=checkShow]").prop("checked",$(this).prop("checked"))
		});
	});//ready
</script>
<br><br>
<span id="manageFormTitle">MANAGE</span>
<br>
<br>
<br><br>
<div class="container">
<form action="${pageContext.request.contextPath}/manageSearchShow.do" method="get" id="searchManageForm">
				<input type="text" name="searchShow"> <input type="submit" value="검색">
			</form>
			<form id="manageMemberBtn">
<input type="button" id="removeShow" value="삭제하기">
<a href="${pageContext.request.contextPath}/manageEventList.do">이벤트 목록 보기</a>
</form>
<sec:csrfInput />
	<form action="${pageContext.request.contextPath}/manageShow.do" method="post" id="removeShowForm">
<table id="manageMemberTable">
	<thead>
		<tr>
			<th><input type="checkbox" id="allNoticeCheck"></th>
			<th>제목</th>
			<th align="center">작성자</th>
			<th align="center">공연일시</th>
		</tr>
	</thead>

	<tbody>

		<c:set var="pb" value="${requestScope.showListVO.pagingBean}" />

		<c:forEach items="${requestScope.showListVO.list}" var="list" varStatus="status">
			<tr>
				<td>
					<input type="checkbox" name="checkShow" value="${list.showNo}" class="checkShow"><sec:csrfInput/>
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
</form>
</div>
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