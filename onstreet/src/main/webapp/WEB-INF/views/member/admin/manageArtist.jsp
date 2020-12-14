<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>

<script type="text/javascript">
	$(document).ready(function() {
				
		
		$("#checkArtist").click(function() {
			var flag = false;
			$(".checkArtist").each(function(){
				if($(this).is(":checked")){
					flag = true;
					return;
				}
			});
			$("#checkArtistForm").attr("action", "${pageContext.request.contextPath}/checkArtist.do");
				if(flag === true){
					if(confirm("승인하시겠습니까?"))
						$("#checkArtistForm").submit();
				}else if(flag === false){
					alert("승인시킬 아티스트를 선택해주세요!"); 
					return;
				}
		});//click
		
		$("#uncheckArtist").click(function() {
			var flag = false;
			$(".checkArtist").each(function(){
				if($(this).is(":checked")){
					flag = true;
					return;
				}
			});
			$("#checkArtistForm").attr("action", "${pageContext.request.contextPath}/uncheckArtist.do");
				if(flag === true){
					if(confirm("반려하시겠습니까?"))
						$("#checkArtistForm").submit();
				}else if(flag === false){
					alert("반려하실 아티스트를 선택해주세요!"); 
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
<div class="container">
<form id="manageMemberBtn">
<input type="button" id="checkArtist" value="승인하기">
<input type="button" id="uncheckArtist" value="미승인하기">
</form>
<sec:csrfInput />
<table id="manageMemberTable">
	<thead>
		<tr>
			<th></th>
			<th>아이디</th>
			<th align="center">닉네임</th>
			<th align="center">주소</th>
			<th>핸드폰</th>
			<th>이메일</th>
			<th>이름</th>
			<th>아티스트 정보</th>
		</tr>
	</thead>

	<tbody>

		<c:set var="pb" value="${requestScope.artistVO.pagingBean}" />

		<c:forEach items="${requestScope.artistVO.artistList}" var="avo">
			<tr>
				<td>
					<form method="post" id="checkArtistForm">
						<input type="checkbox" name="checkArtist" value="${avo.memberVO.id}" class="checkArtist"><sec:csrfInput/>
					</form>
				</td>
				<td>
				${avo.memberVO.id}
				</td>
				<td>
				${avo.memberVO.nickName}
				</td>
				<td>
				${avo.memberVO.address}
				</td>
				<td>
				${avo.memberVO.phone}
				</td>
				<td>
				${avo.memberVO.email}
				</td>
				<td>
				${avo.memberVO.name}
				</td>
				<td>
				${avo.artistInfo}
				</td>
			</tr>
		</c:forEach>
	</tbody>
</table>
</div>
<div class="pagingInfo">
	<ul class="pagination">
	<c:if test="${pb.previousPageGroup}">	
	<li><a href="${pageContext.request.contextPath}/getCheckArtistList.do?pageNo=${pb.startPageOfPageGroup-1}">&laquo;</a></li>
	</c:if>
	<c:forEach var="i" begin="${pb.startPageOfPageGroup}" 
	end="${pb.endPageOfPageGroup}">
	<c:choose>
	<c:when test="${pb.nowPage!=i}">
	<li><a href="${pageContext.request.contextPath}/getCheckArtistList.do?pageNo=${i}">${i}</a></li> 
	</c:when>
	<c:otherwise>
	<li class="active"><a href="#" >${i}</a></li>
	</c:otherwise>
	</c:choose>
	&nbsp;
	</c:forEach>
	<c:if test="${pb.nextPageGroup}">	
	<li><a href="${pageContext.request.contextPath}/getCheckArtistList.do?pageNo=${pb.endPageOfPageGroup+1}">&raquo;</a></li>
	</c:if>
	</ul>	 		
	</div>
