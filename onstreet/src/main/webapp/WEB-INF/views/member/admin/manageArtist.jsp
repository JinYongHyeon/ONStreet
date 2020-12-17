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
		/*관리자 아티스트 승인 - 아티스트 정보[팝업]보기*/
		$(document).on("click","#checkArtistForm tbody tr td:nth-child(8)",function(){
				//애니메이션 검사
			   if($("#manageArtistInfopopup").is(":animated")||$("#manageArtistInfopopup").css("display")=="block")return;
				$("#manageArtistInfopopup p").text($(this).text());
				$("#loginBlind").css("display","block");
				 $("html").animate({scrollTop:0},1000,function(){
			         $(this).css("overflow","hidden");
			      });
				//아티스트 정보
				$("#manageArtistInfopopup").css({"display":"block","top":"60%"});
				$("#manageArtistInfopopup").animate({
					top:"50%",
					opacity:1
				},800);
				//검은배경화면
				$("#loginBlind").animate({
					opacity:0.7
				},800);
		});
		$(document).on("click","#manageArtistInfopopup .manageArtistInfoTitle svg",function(){
			//애니메이션 검사
			  if($("#manageArtistInfo").is(":animated"))return;
			//아티스트 정보
			$("#manageArtistInfopopup").animate({
				top:"30%",
				opacity:0
			},800,function(){
				$(this).css("display","none");
				$("#manageArtistInfo p").text("");
			});
			//검은배경화면
			$("#loginBlind").animate({
				opacity:0
			},800,function(){
				$(this).css("display","none");
			});
		});
	});//ready
</script>
<div id="manageArtistInfopopup">
	<div class="manageArtistInfoTitle">
		<h1>아티스트 정보</h1>
		<svg width="2em" height="2em" viewBox="0 0 16 16" class="bi bi-x-square" fill="currentColor" xmlns="http://www.w3.org/2000/svg">
		  <path fill-rule="evenodd" d="M14 1H2a1 1 0 0 0-1 1v12a1 1 0 0 0 1 1h12a1 1 0 0 0 1-1V2a1 1 0 0 0-1-1zM2 0a2 2 0 0 0-2 2v12a2 2 0 0 0 2 2h12a2 2 0 0 0 2-2V2a2 2 0 0 0-2-2H2z" />
		  <path fill-rule="evenodd" d="M4.646 4.646a.5.5 0 0 1 .708 0L8 7.293l2.646-2.647a.5.5 0 0 1 .708.708L8.707 8l2.647 2.646a.5.5 0 0 1-.708.708L8 8.707l-2.646 2.647a.5.5 0 0 1-.708-.708L7.293 8 4.646 5.354a.5.5 0 0 1 0-.708z" />
		</svg>
	</div>
	<p></p>
</div>
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
					<form method="post" id="checkArtistForm">
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
	<form method="post" id="checkArtistForm">
	<tbody>

		<c:set var="pb" value="${requestScope.artistVO.pagingBean}" />


		<c:forEach items="${requestScope.artistVO.artistList}" var="avo">
			<tr>
				<td>
						<input type="radio" name="checkArtist" value="${avo.memberVO.id}" class="checkArtist"><sec:csrfInput/>
					
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
				<span id="manageArtistInfo">${avo.artistInfo}</span>
				</td>
			</tr>
		</c:forEach>
	</tbody>
		</form>
</table>
</form>
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
