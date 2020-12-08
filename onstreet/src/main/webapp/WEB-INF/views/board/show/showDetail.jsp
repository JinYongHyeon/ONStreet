<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" session="false"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
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

	$(document).ready(function() {
		
		 /* 댓글 작성 시 길이 체크 공간 */
        var checkTitle='';
		
        // 댓글 작성 시 길이 체크
        $('#comment').keyup(function() {
           checkTitle = '';
           var titleValue= $(this).val().trim();
           if(titleValue.length >50){
              $('#commentCheckResult').html(titleValue.length).css('color','red');
              return;
           //제목 길이 평소에는 grey로
           } else {
              $('#commentCheckResult').html(titleValue.length).css('color','grey');
              checkTitle = titleValue;
           }	
        });//keyup
        
        
		   $("#commentUpdate input[type=button]").click(function() {
		      /* alert($(this).parent().children("input[name=commentNo]").val()); */
		      $.ajax({
		      type: "get",
		      url: "${pageContext.request.contextPath}/commentUpdateForm.do",
		      dataType: "json",
		      data: "showNo=${svo.showNo}&commentNo="+$(this).parent().children("input[name=commentNo]").val()+"&countNo="+$(this).parent().children("input[name=countNo]").val(),
		      success: function(data) {
		         $("#commentUpdate"+data[2]).hide();
		         $("#commentDelete"+data[2]).hide();
		         var html = "<form action='updateComment.do' method='post' id='commentUpdateForm'>";
		            html += '<sec:csrfInput/>';
		            html += "<textarea id='commentContent' name='commentContent' style='width: 440px; height: 60px' rows='3' cols='30' maxlength='50' placeholder='수정할 댓글을 입력하세요'></textarea>";
		            html += "<input type='hidden' name='showNo' value='${requestScope.svo.showNo}'>";
		            html+= "<input type='hidden' name='commentNo' value="+data[1]+">";
		            html+= "<span id='commentUpdateCheckResult'></span>/50";
		            html += "<input type='submit' value='수정하기'>";
		            html += "<input type='button' value='취소'>";
		            html += "</form>";
		         $("#div-comment"+data[2]).append(html);
		         $("#commentUpdateForm input[type=button]").click(function() {
		        	 window.location = window.location;
				   });
		         
		      }
		      });//ajax
		   });
		   
		   <%-- 좋아요 --%>
		    $("#likeBtn").click(function(){
		       var id = $('#loginId').val();
		         $.ajax({
		            type:"post",
		            url:"${pageContext.request.contextPath}/addLike.do",
		            dataType: "text",
		            data:"showNo=${svo.showNo}&id="+id,
		            beforeSend : function(xhr){   /*데이터를 전송하기 전에 헤더에 csrf값을 설정한다*/
		                xhr.setRequestHeader("${_csrf.headerName}", "${_csrf.token}");
		               },
		            success: function(result){
		             if(result==0) {
		                $("#likeBtn span:nth-child(1)").attr("id","heart");
		                $("#likeBtn span:nth-child(1)").removeClass("fa fa-heart-o");
		                $("#likeBtn span:nth-child(1)").addClass("fa fa-heart");
		            }
		             if(result==1) {
		                $("#likeBtn span:nth-child(1)").attr("id","heart");
		                $("#likeBtn span:nth-child(1)").removeClass("fa fa-heart");
		                $("#likeBtn span:nth-child(1)").addClass("fa fa-heart-o");
		            }
		            }
		         }); // ajax
		      }); // click
		   
		   // 댓글수정 시 길이 체크
		        $(document).on('keyup', '#commentUpdateForm textarea', function() {
		           checkTitle = '';
		           var titleValue= $(this).val().trim();
		           if(titleValue.length >50){
		              $('#commentUpdateCheckResult').html(titleValue.length).css('color','red');
		              return;
		           //제목 길이 평소에는 grey로
		           } else {
		              $('#commentUpdateCheckResult').html(titleValue.length).css('color','grey');
		              checkTitle = titleValue;
		           }	
		        });//keyup
		      
		      
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
			<input type="hidden" id="loginId" value="${member.id}"> 
			<c:if test="${member.id==svo.artistVO.memberVO.id}">
				<c:choose>
					<c:when test="${requestScope.validity>2}">
						<button type="button" id="btn-update" class="btn" style="float: left; width: 50%; background-color:grey;" disabled="disabled">수정</button>
					</c:when>
					<c:otherwise>
						<button type="button" id="btn-update" class="btn btn-warning" style="float: left; width: 50%;" >수정</button>
					</c:otherwise>
				</c:choose>
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
				<%-- 좋아요 버튼 --%>
				<c:choose>
				<c:when test="${requestScope.validity>2}">
				<button type="button" class="btn btn-default btn-sm" id="likeBtn" style="background-color:grey;" disabled="disabled">
					<c:set var="ok" value="1"/>
				<c:forEach items="${requestScope.likeId}" var="likeCheck">
						<c:if test="${likeCheck==member.id}">
							<span id="heart" class='fa fa-heart' style='color:red'></span>좋아요
							<c:set var="ok" value="0"/>
						</c:if>
				</c:forEach>
				<c:if test="${requestScope.likeId.size()==0}">
					<span class="fa fa-heart-o" style="color:red" id="heartBlank"></span><span>좋아요</span>
				</c:if>
				<c:if test="${ok==1}">
				<c:forEach items="${requestScope.likeId}" var="unLikeCheck">
						<c:if test="${unLikeCheck!=member.id}">
							<span class="fa fa-heart-o" style="color:red" id="heartBlank"></span><span>좋아요</span>
						</c:if>
				</c:forEach>
				</c:if>
				</button>
				</c:when>
				<c:otherwise>
				<button type="button" class="btn btn-default btn-sm" id="likeBtn">
				<c:set var="ok" value="1"/>
				<c:forEach items="${requestScope.likeId}" var="likeCheck">
						<c:if test="${likeCheck==member.id}">
							<span id="heart" class='fa fa-heart' style='color:red'></span>좋아요
							<c:set var="ok" value="0"/>
						</c:if>
				</c:forEach>
				<c:if test="${requestScope.likeId.size()==0}">
					<span class="fa fa-heart-o" style="color:red" id="heartBlank"></span><span>좋아요</span>
				</c:if>
				<c:if test="${ok==1}">
				<c:forEach items="${requestScope.likeId}" var="unLikeCheck">
						<c:if test="${unLikeCheck!=member.id}">
							<span class="fa fa-heart-o" style="color:red" id="heartBlank"></span><span>좋아요</span>
						</c:if>
				</c:forEach>
				</c:if>
				</button>
				</c:otherwise>
				</c:choose>
			</td>
			<%-- 온도 표시 --%>
			<td>
   					<div id="myBar" class="progress-bar progress-bar-danger" role="progressbar" 
  						aria-valuemin="0" aria-valuemax="100" style="width:${requestScope.likeCount}%">
    					${requestScope.likeCount}℃
  					</div>
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
		<span>${cvo.memberVO.nickName} 님의 댓글<br>&nbsp;${cvo.commentContent}
		<br>${cvo.commentWriteDate}
		<c:if test="${member.id==cvo.memberVO.id}">
			<form id="commentUpdate" action="deleteComment.do" method="post">
				<sec:csrfInput/>
				<input type="hidden" name="commentNo" value="${cvo.commentNo}"> 
				<input type="hidden" name="countNo" value="${order.count}"> 
				<input type="hidden" name="showNo" value="${svo.showNo}">
				<c:choose>
				<c:when test="${requestScope.validity>2}">
				<input type="button" id="commentUpdate${order.count}" value="수정" disabled="disabled" style="background-color:grey;">
				</c:when>
				<c:otherwise>
				<input type="button" id="commentUpdate${order.count}" value="수정">
				</c:otherwise>
				</c:choose>
				<input type="submit" id="commentDelete${order.count}" value="삭제">
			</form>
		</c:if>
		<br></span>
	</div>
	</c:when>
<c:otherwise>
<div align="right" id="div-comment${order.count}" class="btn-comment">
<span>
${cvo.memberVO.nickName} 님의 댓글<br>&nbsp;${cvo.commentContent}
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
                            	<span id="commentCheckResult"></span>/50
            </div>
            <div>
                <table class="table">                    
                    <tr>
                        <td>
                            <textarea style="width: 500px" rows="3" cols="30" id="comment" name="commentContent" placeholder="댓글을 입력하세요" maxlength="50"></textarea>
                            
                            <br>
                            <div>
                            <c:choose>
                            	<c:when test="${requestScope.validity>2}">
                                	<input type="submit" class="btn pull-right" value="등록" style="background-color:grey;" disabled="disabled">
                            	</c:when>
                            	<c:otherwise>
                                <input type="submit" class="btn pull-right btn-success" value="등록">
                            	</c:otherwise>
                            </c:choose>
                            </div>
                        </td>
                    </tr>
                </table>
            </div>
        </div>
        
    </form>

</div>
<div style="float: left; width: 15% height: 100px;"></div>