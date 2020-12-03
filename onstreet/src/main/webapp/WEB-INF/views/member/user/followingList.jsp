<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" session="false"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec"%>
<script type="text/javascript">
	
	function check(){
		var flag = false;
		$("input:checkbox[name='followingId']").each(function(){
			//checkbox check -- > flag = true;
			if($(this).is(":checked")){
			flag=true;
			return ;//반복문 빠져나오게
			}//if1
		});//each
			
		if(flag){
			if(!confirm("정말 삭제하시겠습니까?"))
				return false;
			}else{//if1
				alert("삭제할 게시물을 선택해 주세요");
			return false;
			}//if2
	}//check
		
		
		  
			
		/*.is(":checked")==true
		*/	
	/*
 	$(document).ready(function(){
		$("#removefollowBtn").submit(function(){
			$( "input[name='checkbox']:checked" ).each(function () {
			confirm("삭제하시겠습니까?");
			});
		});//click
	});//ready 
	*/

</script>


<div id="thumbnail alert-info">
<form action="${pageContext.request.contextPath}/removeFollowing.do" method="post" onsubmit="return check()">
<sec:csrfInput/>
<c:forEach var="list" items="${requestScope.list}">
<input type="checkbox" name="followingId" value="${list.followingId}" > 

<div class="artistList">
<c:choose>
	<c:when test="${list.memberVO.profile!=null}">
<img src="${pageContext.request.contextPath}/resources/img/profile/${list.memberVO.profile}"><br>
	</c:when>
	<c:otherwise>
<img src="${pageContext.request.contextPath}/resources/img/profile/default.png"><br>
	</c:otherwise>
</c:choose>
${list.memberVO.nickName}<br>
</div>
</c:forEach>
<div class="pull-left">
<input type="submit" id="removefollowBtn" class="btn btn-danger confirm_delete" value="삭제하기" data-original-title >
</div>
</form>
</div>


