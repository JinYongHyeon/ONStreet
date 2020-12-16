<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec"%>

<script type="text/javascript">
	$(document).ready(function() {
		$(document).on("submit","#searchManageForm",function(){
			var content = $("#searchManageForm input[name=searchRemoveMember]").val();
			if(content.trim()===""){
				alert("공백은 검색이 제한됩니다. 다시 입력해 주십시오.");
				$("#searchManageForm input[name=searchRemoveMember]").val("");
				$("#searchManageForm input[name=searchRemoveMember]").focus();
				return false;
			}
		});
	});
</script>

<br><br>
<span id="manageFormTitle">MANAGE</span>
<br>
<br>
<br><br>
<div class="container">
<form action="${pageContext.request.contextPath}/manageSearchRemoveMember.do" method="get" id="searchManageForm">
				<input type="text" name="searchRemoveMember"> <input type="submit" value="검색">
			</form>
<form id="manageMemberBtn">
<a href="${pageContext.request.contextPath}/manageMemberForm.do">회원 전체  목록 보기</a>
</form>
<sec:csrfInput />

<table id="manageMemberTable">
	<thead>
		<tr>
			<th>아이디</th>
			<th>닉네임</th>
			<th>주소</th>
			<th>번호</th>
			<th>이메일</th>
			<th>이름</th>
			<th>나이</th>
			<th>탈퇴일자</th>
		</tr>
	</thead>

	<tbody>
	<c:set var="pb" value="${requestScope.authVO.pagingBean}" />
		<c:forEach var="avo" items="${requestScope.authVO.memberList}">
			<tr>
				<td>${avo.memberVO.id}</td>
				<td>${avo.memberVO.nickName}</td>
				<td>${avo.memberVO.address}</td>
				<td>${avo.memberVO.phone}</td>
				<td>${avo.memberVO.email}</td>
				<td>${avo.memberVO.name}</td>
				<td>${avo.memberVO.age}</td>
				<td>${avo.memberVO.removeUserDate}</td>
			</tr>
		</c:forEach>
	</tbody>
</table>
</div>
<div class="pagingInfo">
	<ul class="pagination">
	<c:if test="${pb.previousPageGroup}">	
	<li><a href="${pageContext.request.contextPath}/getRemoveMemberListForm.do?pageNo=${pb.startPageOfPageGroup-1}">&laquo;</a></li>
	</c:if>
	<c:forEach var="i" begin="${pb.startPageOfPageGroup}" 
	end="${pb.endPageOfPageGroup}">
	<c:choose>
	<c:when test="${pb.nowPage!=i}">
	<li><a href="${pageContext.request.contextPath}/getRemoveMemberListForm.do?pageNo=${i}">${i}</a></li> 
	</c:when>
	<c:otherwise>
	<li class="active"><a href="#" >${i}</a></li>
	</c:otherwise>
	</c:choose>
	&nbsp;
	</c:forEach>
	<c:if test="${pb.nextPageGroup}">	
	<li><a href="${pageContext.request.contextPath}/getRemoveMemberListForm.do?pageNo=${pb.endPageOfPageGroup+1}">&raquo;</a></li>
	</c:if>
	</ul>	 		
	</div>
<div class="col-sm-2"></div>