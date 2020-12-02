<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" session="false"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>
<script>

$(function(){
	$('#btn-update').click(function(){
		if(confirm("수정하시겠습니까?")){
			self.location.href = "updateShowForm.do?showNo="+${svo.showNo};
		}
	});
	$('#btn-delete').click(function(){
		if(confirm("삭제하시겠습니까?")){
			return true;
		}
		return false;
	});
});

$(document).ready(function() {
	$("#commentUpdate input[type=button]").click(function() {
		alert($("#commentUpdate input[name=commentNo]").val());
		$.ajax({
		type: "get",
		url: "${pageContext.request.contextPath}/commentUpdateForm.do",
		dataType: "text",
		data: "showNo=${svo.showNo}&commentNo="+$("#commentUpdate input[name=commentNo]").val(),
		<%-- beforeSend : function(xhr){   /*데이터를 전송하기 전에 헤더에 csrf값을 설정한다*/
             xhr.setRequestHeader("${_csrf.headerName}", "${_csrf.token}");
            }, --%>
		success: function(data) {
				
		}
		});//ajax
	
	});
});//ready

</script>
<c:set var="svo" value="${requestScope.svo}" />
<div style="float: left; width: 15%; height: 100px"></div>
<div style="float: left; width: 40%;">
<table border="1" id="showDetail">
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
			<td colspan="2">
			<sec:authentication property="principal.memberVO" var="member"/>
			<c:if test="${member.id==svo.artistVO.memberVO.id}">
				<button type="button" id="btn-update" class="btn btn-warning" style="float: left; width: 33%">수정</button>
				<form action="deleteShow.do" method="post">
					<sec:csrfInput/>
					<input type="hidden" name="showNo" value="${svo.showNo}">
					<input type="submit" id="btn-delete" class="btn btn-danger" style="float: left; width: 33%" value="삭제">
				</form>
			</c:if>
			</td>
		</tr>
		
		<tr>
			<td colspan="2"><pre>${svo.showContent}</pre></td>
		</tr>
</table>
</div>
<%-- 댓글 리스트 --%>
<div style="float: left; width: 30%;">
<c:forEach var="cvo" items="${requestScope.clvo.commentList}">
<c:choose>
<c:when test="${cvo.memberVO.id==svo.artistVO.memberVO.id}">
	<div align="left" id="btn-comment">
		<span>${cvo.memberVO.nickName}:&nbsp;${cvo.commentContent}
		<c:if test="${member.id==cvo.memberVO.id}">
		<br>
			<form id="commentUpdate">
				<input type="hidden" name="commentNo" value="${cvo.commentNo}"> 
				<input type="button" value="수정"> 
			</form>
			<form>
				<input type="submit" value="삭제"> 
			</form>
		</c:if>
		<br>${cvo.commentWriteDate}<br></span>
	</div>
	</c:when>
<c:otherwise>
<div align="right" id="btn-comment">
<span>
${cvo.memberVO.nickName}:&nbsp;${cvo.commentContent}
<c:if test="${member.id==cvo.memberVO.id}">
<br>
			<form id="commentUpdate">
				<input type="hidden" name="showNo" value="${svo.showNo}">
				<input type="hidden" name="commentNo" value="${cvo.commentNo}">
				<input type="button" value="수정"> 
			</form>
			<form>
				<input type="submit" value="삭제"> 
			</form>
		</c:if>
<br>${cvo.commentWriteDate}<br>
</span>
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