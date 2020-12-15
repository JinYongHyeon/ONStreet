<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" session="false"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %> 
<script type="text/javascript">
$(document).ready(function() {
   $("#deleteNoticecheckForm").submit(function(){         
      var nc=$("#deleteNoticecheckForm :checkbox[name=noticeNo]:checked");
      //alert(nc.length);
      if(nc.length==0){
      alert("번호를 선택해주세요");
      return false;
      } 
      return confirm("삭제 하시겠습니까?");
     });//submit
  $("#allNoticeCheck").change(function() {
    		 $("#deleteNoticecheckForm :checkbox[name=noticeNo]").prop("checked",$(this).prop("checked"))
	});//click
});//ready
</script>
<div class="showListTitle">
<span id="showListTitle">NOTICE</span>
</div>
<div class="container">
<form action="deleteNotice.do" method="post" id="deleteNoticecheckForm">
<sec:csrfInput/>

<table id="showListTable" class="table table-striped table-condensed">

<thead>
<tr>
<sec:authorize access="hasRole('ROLE_ADMIN')">
<th><input type="checkbox" id="allNoticeCheck"></th>
</sec:authorize>
<th>번호</th>
<th>제목</th>
<th>작성일시</th>
<th>작성자</th>
</tr>
</thead>
<tbody>
<c:set var="pb" value="${requestScope.lvo.pagingBean}" />
<c:forEach var="list" items="${requestScope.lvo.noList}" varStatus="status">
<tr>
<sec:authorize access="hasRole('ROLE_ADMIN')">
<td>
<%-- <input type="hidden" name="noticeNo" value="${list.noticeNo}">--%>
<input type="checkbox" name="noticeNo" value="${list.noticeNo}">
</td>
</sec:authorize>
<td align="center">
${requestScope.totalNoticePostCount-((pb.nowPage-1)*pb.postCountPerPage+status.index)}
</td>
<td><a href="getNoticeDetail.do?noticeNo=${list.noticeNo}">${list.noticeTitle}</a></td>
<td>${list.noticeWriteDate}</td>
<td>${list.memberVO.nickName}</td>
</tr>
</c:forEach>
</tbody>
</table>
</form>
<sec:authorize access="hasRole('ROLE_ADMIN')">
<!-- <div class="col-sm-8"> -->
 <button form="deleteNoticecheckForm"  type="submit" id="noticeButton_2">삭제</button>
 <form action="addNoticeForm.do" method="get" id="noticeButton_1">
 <input type="submit" value="등록"  id="noticeButton_1">
 </form>
<!--  </div> --> 
 </sec:authorize> 
 </div>
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
   </div>         