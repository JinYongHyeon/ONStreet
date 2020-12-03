<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" session="false"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
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

	if(${requestScope.likeCheck==1}) {
		   $(document).ready(function() { 
		      $("#heartBlank").hide();
		      $("#heart").html("<i class='fa fa-heart' style='color:red'></i>")
		   });
		}


$(document).ready(function() {
	$("#commentUpdate input[type=button]").click(function() {
		/* alert($(this).parent().children("input[name=commentNo]").val()); */
		$.ajax({
		type: "get",
		url: "${pageContext.request.contextPath}/commentUpdateForm.do",
		dataType: "json",
		data: "showNo=${svo.showNo}&commentNo="+$(this).parent().children("input[name=commentNo]").val()+"&countNo="+$(this).parent().children("input[name=countNo]").val(),
		<%-- beforeSend : function(xhr){   /*데이터를 전송하기 전에 헤더에 csrf값을 설정한다*/
             xhr.setRequestHeader("${_csrf.headerName}", "${_csrf.token}");
            }, --%>
		success: function(data) {
			$("#commentUpdate"+data[2]).hide();
			$("#commentDelete"+data[2]).hide();
			var html = "<form action='updateComment.do' method='post'>";
				html += '<sec:csrfInput/>';
				html += "<input type='text' name='commentContent'>";
				html += "<input type='hidden' name='showNo' value='${requestScope.svo.showNo}'>";
				html+= "<input type='hidden' name='commentNo' value="+data[1]+">";
				html += "<input type='submit' value='수정하기'>";
				html += "</form>";
			$("#div-comment"+data[2]).append(html);
			
		}
		});//ajax
	});
	
	 $("#likeBtn").click(function(){
         if(${sessionScope.memberVO==null}) {
            alert("로그인 후 사용할 수 있습니다.");
            return;
         }
         $.ajax({
            type:"get",
            url:"front",
            data:"command=likeCount&loginId=${sessionScope.memberVO.id}&postNo=${requestScope.postVO.postNo}&postId=${requestScope.postVO.memberVO.id}",
            success: function(result){ 
               if(result==="좋아요한 게시물") {
                  if(confirm("이미 좋아요를 누른 게시물입니다.\n좋아요를 취소하시겠습니까?")) {
                        $.ajax({
                           type:"get",
                           url:"front",
                           data:"command=likeCancel&loginId=${sessionScope.memberVO.id}&postNo=${requestScope.postVO.postNo}&postId=${requestScope.postVO.memberVO.id}",
                           success: function(result){
                              $("#heartBlank").show();
                              $("#heart").hide();
                           }
                        }); // ajax
                  } 
                  $("#heart").html("<i class='fa fa-heart' style='color:red'></i>");
               }
               $("#heartBlank").hide();
               $("#heart").show().html("<i class='fa fa-heart' style='color:red'></i>");            
            }
         }); // ajax
      }); // click
	
	
	
});//ready
});
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
				<button type="button" id="btn-update" class="btn btn-warning" style="float: left; width: 50%">수정</button>
				<form action="deleteShow.do" method="post">
					<sec:csrfInput/>
					<input type="hidden" name="showNo" value="${svo.showNo}">
					<input type="submit" id="btn-delete" class="btn btn-danger" style="float: left; width: 50%" value="삭제">
				</form>
			</c:if>
			</td>
		</tr>
		<tr>
			<td>
				<button type="button" class="btn btn-default btn-sm" onclick="like()" id="likeBtn"> <span class="fa fa-heart-o" style="color:red" id="heartBlank"></span><span id="heart"></span>좋아요</button>
                <span id="likeView"></span>
			</td>
		</tr>
		<tr>
			<td colspan="2"><pre>${svo.showContent}</pre></td>
		</tr>
</table>
</div>
<%-- 댓글 리스트 --%>
<div style="float: left; width: 30%;">
<c:forEach var="cvo" items="${requestScope.clvo.commentList}" varStatus="order">
<c:choose>
<c:when test="${cvo.memberVO.id==svo.artistVO.memberVO.id}">
	<div align="left" id="div-comment${order.count}" class="btn-comment">
		<span>${cvo.memberVO.nickName}:&nbsp;${cvo.commentContent}
		<br>${cvo.commentWriteDate}
		<c:if test="${member.id==cvo.memberVO.id}">
			<form id="commentUpdate" action="deleteComment.do" method="post">
				<sec:csrfInput/>
				<input type="hidden" name="commentNo" value="${cvo.commentNo}"> 
				<input type="hidden" name="countNo" value="${order.count}"> 
				<input type="hidden" name="showNo" value="${svo.showNo}"> 
				<input type="button" id="commentUpdate${order.count}" value="수정">
				<input type="submit" id="commentDelete${order.count}" value="삭제">
			</form>
		</c:if>
		<br></span>
	</div>
	</c:when>
<c:otherwise>
<div align="right" id="div-comment${order.count}" class="btn-comment">
<span>
${cvo.memberVO.nickName}:&nbsp;${cvo.commentContent}
<br>${cvo.commentWriteDate}
<c:if test="${member.id==cvo.memberVO.id}">
			<form id="commentUpdate" action="deleteComment.do" method="post">
			<sec:csrfInput/>
				<input type="hidden" name="commentNo" value="${cvo.commentNo}"> 
				<input type="hidden" name="countNo" value="${order.count}"> 
				<input type="hidden" name="showNo" value="${svo.showNo}"> 
				<input type="button" id="commentUpdate${order.count}" value="수정">
				<input type="submit" id="commentDelete${order.count}" value="삭제"> 
			</form>
		</c:if>
<br></span>
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