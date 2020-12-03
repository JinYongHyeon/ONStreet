<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" session="false"%>
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
	});//ready
</script>

<h1>
	<b>MANAGE</b>
</h1>
<br>
<br>
<input type="button" id="removeMember" value="삭제하기">
<a href="${pageContext.request.contextPath}/manageMemberArtistForm.do">아티스트 목록 보기</a>
<sec:csrfInput />
<table border="1">
	<thead>
		<tr>
		    <th></th>
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
		<c:forEach var="avo" items="${requestScope.authVO.memberList}">
			<tr>
				<td><form action="${pageContext.request.contextPath}/manageMember.do" method="post" id="removeMemberForm">
				<input type="checkbox" name="checkMember" value="${avo.memberVO.id}" class="checkMember"><sec:csrfInput/>
				</form></td>
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
