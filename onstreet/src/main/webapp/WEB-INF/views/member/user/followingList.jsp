<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" session="false"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec"%>
<script type="text/javascript">

function check_all(){
	for(i=0; i< form.followingId.length; i++){
		form.followingId[i].checked = true;
	}
}
	function uncheck_all(){
		for(i=0; i< form.followingId.length; i++){
			form.followingId[i].checked = false;
		}
	}
	
	
	


	function check(){
		var flag = false;
		$("input:checkbox[name='followingId']").each(function(){
			//checkbox checked -- > flag = true;
			if($(this).is(":checked")){
			flag=true;
			return ;//반복문 빠져나오게
			}//if1
		});//each
			
		if(flag){
			if(!confirm("정말 삭제하시겠습니까?"))
				return false;
			}else{//if1
				alert("삭제할 아티스트를 선택해주세요");
			return false;
			}//if2
	}//check
	
		
</script>



<div id="thumbnail alert-info">
<form action="${pageContext.request.contextPath}/removeFollowing.do" method="post" onsubmit="return check()" name="form">
<input type="button" value="모두 선택" onclick="check_all();"  class="btn btn-default select_all">
<input type="button" value="모두 해제" onclick="uncheck_all();"  class="btn btn-default select_all">
<sec:csrfInput/>
<c:forEach var="list" items="${requestScope.list.followList}">
<input type="checkbox" name="followingId" value="${list.followingId}"> 
<div>
<c:choose>
	<c:when test="${list.memberVO.profile!=null}">
<img src="${pageContext.request.contextPath}/resources/img/profile/${list.memberVO.profile}"><br>
	</c:when>
	<c:otherwise>
<img src="${pageContext.request.contextPath}/resources/img/profile/default.png"><br>
	</c:otherwise>
</c:choose>

<a href="${pageContext.request.contextPath}/getArtistDetail.do?id=${list.memberVO.id}">${list.memberVO.nickName}</a><br>
</div>
</c:forEach>
<div class="pull-left">
<input type="submit" id="removefollowBtn" class="btn btn-danger confirm_delete" value="삭제하기" data-original-title>
</div>
</form>
</div>

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

