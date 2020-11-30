<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" session="false"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
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
<div class="col-sm-2"></div>
<div class="col-sm-4">
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

<div class="col-sm-4">
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
<!-- 이곳인가 -->
 <form id="commentForm" name="commentForm" method="post">
    <br><br>
        <div>
            <div>
                <span><strong>Comments</strong></span> <span id="cCnt"></span>
            </div>
            <div>
                <table class="table">                    
                    <tr>
                        <td>
                            <textarea style="width: 500px" rows="3" cols="30" id="comment" name="comment" placeholder="댓글을 입력하세요"></textarea>
                            <br>
                            <div>
                                <a href='#' class="btn pull-right btn-success">등록</a>
                            </div>
                        </td>
                    </tr>
                </table>
            </div>
        </div>
        <input type="hidden" id="" name="" />        
    </form>
<!-- 끝인가 -->

</div>
<div class="col-sm-2"></div>
