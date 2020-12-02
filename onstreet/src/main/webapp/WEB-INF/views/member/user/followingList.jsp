<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" session="false"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec"%>
<script type="text/javascript">
	$(document).ready(function(){
		$("#removefollowBtn").submit(function(){
			$( "input[name='checkbox']:checked" ).each(function () {
			confirm("삭제하시겠습니까?");
			});
		});//click
	});//ready

</script>


<div id="thumbnail alert-info">
<form action="${pageContext.request.contextPath}/removeFollowing.do" method="post" id="removefollowBtn">
<sec:csrfInput/>
<div class="pull-left">
<input type="submit" class="btn btn-danger confirm_delete" value="삭제하기" data-original-title>
</div>
<c:forEach var="list" items="${requestScope.list}">
<input type="checkbox" name="checkbox"> 
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
</form>
</div>


