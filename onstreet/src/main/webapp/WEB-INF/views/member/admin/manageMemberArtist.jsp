<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec"%>

<script type="text/javascript">
	$(document).ready(function() {
		$("#removeMember").click(function() {
			var flag = false;
			$(".checkMember").each(function(){
				if($(this).is(":checked")){
					flag = true;
					return;
				}
			});
				if(flag === true){
					if(confirm("정말로 삭제하시겠습니까?"))
						$("#removeMemberForm").submit();
				}else if(flag === false){
					alert("삭제시킬 회원을 선택해주세요!"); 
					return;
				}
		});//click
		$("#allNoticeCheck").change(function() {
	   		 $("#removeMemberForm :checkbox[name=checkMember]").prop("checked",$(this).prop("checked"))
		});
	});//ready
</script>
<br><br>
<span id="manageFormTitle">MANAGE</span>
<br>
<br>
<br><br>
<div class="container">
<form id="manageMemberBtn">
<input type="button" id="removeMember" value="삭제하기">
<a href="${pageContext.request.contextPath}/manageMemberForm.do">회원 전체  목록 보기</a>
</form>
<sec:csrfInput />
<form action="${pageContext.request.contextPath}/manageMember.do" method="post" id="removeMemberForm">
<table id="manageMemberTable">
	<thead>
		<tr>
		    <th><input type="checkbox" id="allNoticeCheck"></th>
			<th>아이디</th>
			<th>닉네임</th>
			<th>주소</th>
			<th>번호</th>
			<th>이메일</th>
			<th>이름</th>
			<th>나이</th>
			<th>구분</th>
		</tr>
	</thead>

	<tbody>
		<c:set var="pb" value="${requestScope.authVO.pagingBean}" />
		<c:forEach var="avo" items="${requestScope.authVO.memberList}">
			<tr>
				<td>
				<input type="checkbox" name="checkMember" value="${avo.memberVO.id}" class="checkMember"><sec:csrfInput/>
				</td>
				<td>${avo.memberVO.id}</td>
				<td>${avo.memberVO.nickName}</td>
				<td>${avo.memberVO.address}</td>
				<td>${avo.memberVO.phone}</td>
				<td>${avo.memberVO.email}</td>
				<td>${avo.memberVO.name}</td>
				<td>${avo.memberVO.age}</td>
				<td>${avo.authName}</td>
			</tr>
		</c:forEach>
	</tbody>
</table>
</form>
</div>
<div class="pagingInfo">
	<ul class="pagination">
	<c:if test="${pb.previousPageGroup}">	
	<li><a href="${pageContext.request.contextPath}/manageMemberArtistForm.do?pageNo=${pb.startPageOfPageGroup-1}">&laquo;</a></li>
	</c:if>
	<c:forEach var="i" begin="${pb.startPageOfPageGroup}" 
	end="${pb.endPageOfPageGroup}">
	<c:choose>
	<c:when test="${pb.nowPage!=i}">
	<li><a href="${pageContext.request.contextPath}/manageMemberArtistForm.do?pageNo=${i}">${i}</a></li> 
	</c:when>
	<c:otherwise>
	<li class="active"><a href="#" >${i}</a></li>
	</c:otherwise>
	</c:choose>
	&nbsp;
	</c:forEach>
	<c:if test="${pb.nextPageGroup}">	
	<li><a href="${pageContext.request.contextPath}/manageMemberArtistForm.do?pageNo=${pb.endPageOfPageGroup+1}">&raquo;</a></li>
	</c:if>
	</ul>	 		
	</div>
	</div>
<div class="col-sm-2"></div>
