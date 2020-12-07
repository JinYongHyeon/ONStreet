<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" session="false"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %> 
<script type="text/javascript">
$(document).ready(function() {
	$("#deleteNoticecheck").submit(function(){
		var no=$("#deleteNoticecheck input[type:checkbox]");
		var info=false;
		//jQuery 반복문 체크박스 동일한 name 갯수만큼 반복
		no.each(function(){
			if($(this).is(":checked")){
				info= true;
				return;
			}
		});
			if(info===false){
			alert("번호를 선택해주세요");
			return false;
			}
				return confirm("삭제 하시겠습니까?"); 
     });//submit
});//ready
</script>
<table id="noticeList">
<thead>
<tr>
<th>번호</th>
<th>제목</th>
<th>작성일시</th>
<th>작성자</th>
</tr>
</thead>
<tbody>
<tr>
<td>
<form action="deleteNotice.do" method="post" id="deleteNoticecheck">
<sec:csrfInput/>
<c:forEach var="list" items="${requestScope.lvo.noList}">
<tr>
<td>
<%-- <input type="hidden" name="noticeNo" value="${list.noticeNo}">--%>
<input type="checkbox" name="noticeNo" value="${list.noticeNo}">${list.noticeNo}
<td><a href="getNoticeDetail.do?noticeNo=${list.noticeNo}">${list.noticeTitle}</a></td>
<td>${list.noticeWriteDate}</td>
<td>${list.memberVO.nickName}</td>
</tr>
</c:forEach>
</form>
</td>
</tr>
</tbody>
</table>
<div class="pagingInfo">
	<c:set var="pb" value="${requestScope.lvo.pagingBean}"></c:set>
	<ul class="pagination">
	<c:if test="${pb.previousPageGroup}">	
	<li><a href="${pageContext.request.contextPath}/getNoticeList.do?pageNo=${pb.startPageOfPageGroup-1}">&laquo;</a></li>
	</c:if>
	<c:forEach var="i" begin="${pb.startPageOfPageGroup}" end="${pb.endPageOfPageGroup}">
	<c:choose>
	<c:when test="${pb.nowPage!=i}">
	<li><a href="${pageContext.request.contextPath}/getNoticeList.do?pageNo=${i}">${i}</a></li> 
	</c:when>
	<c:otherwise>
	<li class="active"><a href="#" >${i}</a></li>
	</c:otherwise>
	</c:choose>
	</c:forEach>
	<c:if test="${pb.nextPageGroup}">	
	<li><a href="${pageContext.request.contextPath}/getNoticeList.do?pageNo=${pb.endPageOfPageGroup+1}">&raquo;</a></li>
	</c:if>
	</ul>	 		
	</div><br>	 			
 <div class="col-sm-8" align="right">
 <form action="addNoticeForm.do" method="get">
 <input type="submit" value="등록">
 </form>
 <button form="deleteNoticecheck" type="submit">삭제</button>
 </div> 