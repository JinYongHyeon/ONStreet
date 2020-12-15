<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" session="false"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec"%>
<style>
.followlistcheck ul{
	width: 300px;
    float: left;
    margin-right: 30px;
}
</style>

<!-- 자바스크립트 -->
<script type="text/javascript">

	/* submit 체크박스 체크용 */
	function check(){
		var flag = false;
		$("input:checkbox[name='followingId']").each(function(){
			//checkbox checked -- > flag = true;
			if($(this).is(":checked")){
			flag=true;
			return ;//반복문 빠져나오게
			}else{
				$("#removefollowBtn").prop('checked', false);	
			}
		});//each
			
		if(flag){
			if(!confirm("정말 삭제하시겠습니까?"))
				return false;
			}else{//if1
				alert("삭제할 아티스트를 선택해주세요");
			return false;
			}//if2
	}//check
	
	$(document).ready(function(){
		$(document).on("click",".followlistcheck input[name=followingId]",function(){
			var flag = false;
			//체크 유무 검사
			var followingId = document.getElementsByName("followingId");
			for(var i=0;i<followingId.length;i++){
				if(followingId[i].checked){
					flag=true;
					break;
				}	
			}
			//체크 유무 확인 후 삭제버튼 활성화 이벤트
			if(flag === true){
				$("#removefollowBtn").css("display","block");
				$("#removefollowBtn").animate({
					opacity : 1},500);
			}else{
				$("#removefollowBtn").css({"display":"none","opacity":"0"});	
			}//else
		});//click event end
		
		$(document).on("click",".followlistcheckSection input[value=모두선택]",function(){
			var flag = false;
			var fi = document.getElementsByName("followingId");
			for(i=0; i< fi.length; i++){
				fi[i].checked = true;
				flag = true;
			}
			//체크 유무 확인 후 삭제버튼 활성화 이벤트
			if(flag === true){
				$("#removefollowBtn").css("display","block");
				$("#removefollowBtn").animate({
					opacity : 1},500);
			}else{
				$("#removefollowBtn").css({"display":"none","opacity":"0"});	
			}//else
		});
		
		$(document).on("click",".followlistcheckSection input[value=모두해제]",function(){
			var flag = false;
			var fi = document.getElementsByName("followingId");
			for(i=0; i< fi.length; i++){
				fi[i].checked = false;
			}
			//체크 유무 확인 후 삭제버튼 활성화 이벤트
			if(flag === true){
				$("#removefollowBtn").css("display","block");
				$("#removefollowBtn").animate({
					opacity : 1},500);
			}else{
				$("#removefollowBtn").css({"display":"none","opacity":"0"});	
			}//else
		});
	});
	function check_all(){
	}
		function uncheck_all(){
			var fi = document.getElementsByName("followingId");
			for(i=0; i< fi.length; i++){
				fi[i].checked = false;
			}
		}
		
		
</script>
<div class="container followlistcheckSection">
<form action="${pageContext.request.contextPath}/removeFollowing.do" method="post" onsubmit="return check()" name="form">
<input type="submit" id="removefollowBtn" style="display:none; opacity: 0" class="btn btn-danger confirm_delete" value="삭제하기" data-original-title>
<input type="button" value="모두선택" class="btn btn-default select_all">
<input type="button" value="모두해제" class="btn btn-default select_all">
</div>

<div class="followlistcheck">
<sec:csrfInput/>
<c:forEach var="list" items="${requestScope.list.followList}" varStatus="point">

<c:choose>
	<c:when test="${list.memberVO.profile!=null}">
<ul>
  <li><input type="checkbox" id="cb${point.index}" name="followingId" value="${list.followingId}" />
    <label for="cb${point.index}"><img src="${pageContext.request.contextPath}/resources/img/profile/${list.memberVO.profile}"></label>
  </li>
</ul>	
	</c:when>
	
	<c:otherwise>
<ul>
  <li><input type="checkbox" id="cb${point.index}" name="followingId" value="${list.followingId}"/>
    <label for="cb${point.index}"><img src="${pageContext.request.contextPath}/resources/img/profile/default.png"/></label>
	<a href="${pageContext.request.contextPath}/getArtistDetail.do?id=${list.followingId}">${list.memberVO.nickName}</a><br>
  </li>
</ul>
	</c:otherwise>
</c:choose>
</c:forEach>
</div>
</form>

<!-- 페이징빈시작 -->
<c:set var="pb" value="${requestScope.list.pagingBean}" />
<div class="pagingInfo">
   <ol class="pagination">
   <c:if test="${pb.previousPageGroup}">   
   <li><a href="${pageContext.request.contextPath}/followingList.do?pageNo=${pb.startPageOfPageGroup-1}">&laquo;</a></li>
   </c:if>
   <c:forEach var="i" begin="${pb.startPageOfPageGroup}" 
   end="${pb.endPageOfPageGroup}">
   <c:choose>
   <c:when test="${pb.nowPage!=i}">
   <li><a href="${pageContext.request.contextPath}/followingList.do?pageNo=${i}">${i}</a></li> 
   </c:when>
   <c:otherwise>
   <li class="active"><a href="#" >${i}</a></li>
   </c:otherwise>
   </c:choose>
   &nbsp;
   </c:forEach>
   <c:if test="${pb.nextPageGroup}">   
   <li><a href="${pageContext.request.contextPath}/followingList.do?pageNo=${pb.endPageOfPageGroup+1}">&raquo;</a></li>
   </c:if>
   </ol>          
   </div> 

