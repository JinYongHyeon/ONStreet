<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" session="false"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>
<script>
$(document).ready(function() {
	var showNo = ${requestScope.svo.showNo};
	 $.ajax({
         type : "get",
         url : "front",
         data :"command=commentList.do?showNo="+showNo,
         success: function(result){
			
         } //ajax success
      
      })//ajax
});
</script>
<c:set var="svo" value="${requestScope.svo}" />
<div style="float: left; width: 15%; height: 100px"></div>
<div style="float: left; width: 40%;">
<table border="1">
		<tr>
			<td>작성자</td><td>${svo.artistVO.memberVO.nickName}</td>
		</tr>
		<tr>
			<td>작성일시</td><td>${svo.showWriteDate}</td>
		</tr>
		<tr>
			<td>공연제목</td><td>${svo.showTitle}</td>
		</tr>
		<tr>
			<td>공연일정</td><td>${svo.showDate}</td>
		</tr>
		<tr>
			<td colspan="2"><pre>${svo.showContent}</pre></td>
		</tr>
</table>
</div>
<div style="float: left; width: 30%;">
<c:forEach var="cvo" items="${requestScope.clvo.commentList}">
<c:choose>
<c:when test="${cvo.memberVO.id==svo.artistVO.memberVO.id}">
	<div align="left">
	${cvo.memberVO.nickName}:&nbsp;${cvo.commentContent}<br>${cvo.commentWriteDate}<br>
	</div>
	</c:when>
<c:otherwise>
<div align="right">
${cvo.memberVO.nickName}:&nbsp;${cvo.commentContent}<br>${cvo.commentWriteDate}<br>
</div>
</c:otherwise>
</c:choose>
</c:forEach>
<%-- 댓글 페이징 --%>
<c:set var="pb" value="${requestScope.clvo.pagingBean}" />
	<div class="pagingInfo">
	<ul class="pagination">
	<c:if test="${pb.previousPageGroup}">	
	<li><a href="${pageContext.request.contextPath}/getShowDetail.do?showNo=${svo.showNo}&pageNo=${pb.startPageOfPageGroup-1}">&laquo;</a></li>
	</c:if>
	<c:forEach var="i" begin="${pb.startPageOfPageGroup}" 
	end="${pb.endPageOfPageGroup}">
	<c:choose>
	<c:when test="${pb.nowPage!=i}">
	<li><a href="${pageContext.request.contextPath}/getShowDetail.do?showNo=${svo.showNo}&pageNo=${i}">${i}</a></li> 
	</c:when>
	<c:otherwise>
	<li class="active"><a href="#" >${i}</a></li>
	</c:otherwise>
	</c:choose>
	&nbsp;
	</c:forEach>
	<c:if test="${pb.nextPageGroup}">	
	<li><a href="${pageContext.request.contextPath}/getShowDetail.do?showNo=${svo.showNo}&pageNo=${pb.endPageOfPageGroup+1}">&raquo;</a></li>
	</c:if>
	</ul>	 		
	</div> 	 
<!-- 댓글입력폼 -->
 <form method="post" action="addComment.do">
 	<sec:csrfInput/>
 	<input type="hidden" name="showNo" value="${svo.showNo}">
    <br><br>
        <div>
            <div>
                <span><strong>Comments</strong></span> <span id="cCnt"></span>
            </div>
            <div>
                <table class="table">                    
                    <tr>
                        <td>
                            <textarea style="width: 500px" rows="3" cols="30" id="comment" name="commentContent" placeholder="댓글을 입력하세요"></textarea>
                            <br>
                            <div>
                                <input type="submit" class="btn pull-right btn-success" value="등록">
                            </div>
                        </td>
                    </tr>
                </table>
            </div>
        </div>
        
    </form>

</div>
<div style="float: left; width: 15% height: 100px;"></div>