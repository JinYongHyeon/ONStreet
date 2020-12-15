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
	
	$('#commentRegisterBtn').click(function(){
		if ($("#comment").val() == "") {
			alert("댓글을 입력하세요.");
			return false;
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
		            html += "<textarea id='commentContent' name='commentContent' rows='3' cols='30' maxlength='50' placeholder='수정할 댓글을 입력하세요'></textarea>";
/* 		            html += "<textarea style='background: #40434e; border: #2f323b; color: white' name='commentContent' rows='3' cols='30' id='commentContent' name='commentContent' placeholder='댓글을 입력하세요' maxlength='50'></textarea>"; */
		            html += "<input type='hidden' name='showNo' value='${requestScope.svo.showNo}' id='updateShowNo'>";
		            html+= "<input type='hidden' name='commentNo' value="+data[1]+" id='updateCommentNo'>";
		            html+= "<span id='commentUpdateCheckResult'></span>/50";
		            html += "<input type='button' value='수정하기' id='btnUpdate'>";
		            html += "<input type='button' value='취소' id='btnUpdateCancel'>";
		            html += "</form>";
		         $("#div-comment"+data[2]).append(html);
		         $("#commentUpdateForm input[type=button]").click(function() {
		        	 window.location = window.location;
				   });
		         
		      }
		      });//ajax
		   });
        
		   $(document).on('click', '#btnUpdate', function() {
			      /* alert($(this).parent().children("input[name=commentNo]").val()); */
			      $.ajax({
			      type: "post",
			      url: "${pageContext.request.contextPath}/updateComment.do",
			      dataType: "text",
 			      data: "showNo=${svo.showNo}&commentNo="+$('#updateCommentNo').val()+"&commentContent="+$('#commentContent').val(),
			      beforeSend : function(xhr){   /*데이터를 전송하기 전에 헤더에 csrf값을 설정한다*/
		                xhr.setRequestHeader("${_csrf.headerName}", "${_csrf.token}");
		               },
			      success: function(data) {
								         
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
<!-- <br><br> -->
<br><br>
<span id="showListTitle">SHOW</span>
<br><br><br>
<c:set var="svo" value="${requestScope.svo}" />
<div class="container">
<sec:authentication property="principal.memberVO" var="member"/>
			<h1>${svo.showTitle}</h1><hr>
				<div id="showDetailProfile"><img class="user-img" id="showDetailProfileImg" src="${pageContext.request.contextPath}/resources/img/profile/${svo.artistVO.memberVO.profile}" width="35px"></div>
			&nbsp;<a href="${pageContext.request.contextPath}/getArtistDetail.do?id=${svo.artistVO.memberVO.id}">${svo.artistVO.memberVO.nickName}</a><br>
			<span id="showDetailShowWriteDate">&nbsp;${svo.showWriteDate}</span><hr>
			<h4>공연날짜는 ${svo.showDate}</h4><br>
			
  					<%-- 좋아요 버튼 --%>
  					<div style="float: left;">
				<c:choose>
				<c:when test="${requestScope.validity>2}">
				<button type="button" class="btn btn-default btn-sm btn-disabled" id="likeBtn" disabled="disabled">
				<c:forEach items="${requestScope.likeId}" var="likeCheck">
						<c:if test="${likeCheck==member.id}">
							<span id="heart" class='fa fa-heart'></span>좋아요
						</c:if>
				</c:forEach>
				<c:if test="${requestScope.likeId.size()==0}">
					<span class="fa fa-heart-o" id="heartBlank"></span><span>좋아요</span>
				</c:if>
				<%-- <c:if test="${ok==1}"> --%>
				<c:forEach items="${requestScope.likeId}" var="unLikeCheck">
						<c:if test="${unLikeCheck!=member.id}">
							<span class="fa fa-heart-o" id="heartBlank"></span><span>좋아요</span>
						</c:if>
				</c:forEach>
				<%-- </c:if> --%>
				</button>
				</c:when>
				<c:otherwise>
				<c:set var="check" value="false"/>
				<button type="button" class="btn btn-default btn-sm" id="likeBtn">
				<c:forEach items="${requestScope.likeId}" var="likeCheck">
						<c:if test="${likeCheck==member.id}">
							<span id="heart" class='fa fa-heart' ></span>좋아요
							<c:set var="check" value="true"/>
						</c:if>
				</c:forEach>
				<c:if test="${requestScope.likeId.size()==0}">
					<span class="fa fa-heart-o" id="heartBlank"></span><span>좋아요</span>
				</c:if>
				<c:if test="${not check}">
				<c:forEach items="${requestScope.likeId}" var="unLikeCheck">
				<c:if test="${not check}">
						<c:if test="${unLikeCheck!=member.id}">
							<span class="fa fa-heart-o" id="heartBlank"></span><span>좋아요</span>
							<c:set var="check" value="true"/>
						</c:if>
						</c:if>
				</c:forEach>
				</c:if>
				</button>
				</c:otherwise>
				</c:choose>
				</div>
				<%-- 온도 표시 --%>
				<div id="myBar" class="progress-bar progress-bar-danger" role="progressbar" 
  						aria-valuemin="0" aria-valuemax="100" style="width:${requestScope.likeCount}%;">
    					${requestScope.likeCount}℃
  					</div><br>
				
			
			<hr>
			<div id="showDetailUpdateDeleteDiv">
			<input type="hidden" id="loginId" value="${member.id}"> 
			<c:if test="${member.id==svo.artistVO.memberVO.id}">
				<c:choose>
					<c:when test="${requestScope.validity>2}">
						<button type="button" id="btn-update" class="btn-disabled btn" disabled="disabled">수정</button>
					</c:when>
					<c:otherwise>
						<button type="button" id="btn-update" class="btn btn-warning" >수정</button>
					</c:otherwise>
				</c:choose>
				
				<form action="deleteShow.do" method="post">
					<sec:csrfInput/>
					<input type="hidden" name="showNo" value="${svo.showNo}">
					<input type="submit" id="btn-delete" class="btn btn-danger" value="삭제">
				</form>
			</c:if>
			</div>
			
			<br><br>
			</div>
			

<div id="showDetailContentSide" >
<section class="test">
						<div id="showDetailContent">
			<span>${svo.showContent}</span>
			</div>
		</section>		
</div>

<%-- 댓글 리스트 --%>
<!-- <br><br><br><br><br><br><br><br><br><br><br> -->
<div id="showDetailCommentSide">

<%-- 댓글 --%>
    <section class="chat-window">
<c:forEach var="cvo" items="${requestScope.clvo.commentList}" varStatus="order">
<c:choose>
<c:when test="${cvo.memberVO.id==svo.artistVO.memberVO.id}">
<div id="div-comment${order.count}" class="showDetailArtistComment">
		
		<article class="msg-container msg-remote" id="msg-0">
        <div class="msg-box">
        <c:choose>
        <c:when test="${cvo.memberVO.profile==null}">
        	<img class="user-img" id="user-0" src="//gravatar.com/avatar/002464562345234523523568978962?d=retro" />
        </c:when>
        <c:otherwise>
        <div id="showDetailCommentArtistProfile">
			<img class="user-img" id="user-0" src="${pageContext.request.contextPath}/resources/img/profile/${cvo.memberVO.profile}" />
			</div>
        </c:otherwise>
        </c:choose>
          <div class="flr">
          <div id="showDetailCommentNickName">
         <span>${cvo.memberVO.nickName}</span>
         </div>
            <div class="messages">
              <p class="msg" id="msg-0">
               ${cvo.commentContent}
              </p>
            </div>
            <span class="timestamp"><span class="username"></span>&bull;<span class="posttime">${cvo.commentWriteDate}</span></span>
          </div>
        </div>
      </article>
		
		
		<br>
		<c:if test="${member.id==cvo.memberVO.id}">
			<form id="commentUpdate" action="deleteComment.do" method="post">
				<sec:csrfInput/>
				<input type="hidden" name="commentNo" value="${cvo.commentNo}"> 
				<input type="hidden" name="countNo" value="${order.count}"> 
				<input type="hidden" name="showNo" value="${svo.showNo}">
				<c:choose>
				<c:when test="${requestScope.validity>2}">
				<input type="button" id="commentUpdate${order.count}" value="수정" disabled="disabled" class="btn-disabled" style="background-color: grey; border: 2px solid grey;">
				</c:when>
				<c:otherwise>
				<input type="button" id="commentUpdate${order.count}" value="수정">
				</c:otherwise>
				</c:choose>
				<input type="submit" id="commentDelete${order.count}" value="삭제">
			</form>
		</c:if>
		<br>
	</div>
	</c:when>
      
      
      
      <c:otherwise>
      
      <article class="msg-container msg-self" id="msg-0">
        <div class="msg-box">
        	
          <div class="flr" id="showDetailCommentNickName">
          <span>${cvo.memberVO.nickName}</span>
            <div class="messages">
    			<p class="msg" id="msg-1">
                ${cvo.commentContent}
              </p>
            </div>
            <span class="timestamp"><span class="username"></span>&bull;<span class="posttime">${cvo.commentWriteDate}</span></span>
          </div>
          <c:choose>
        <c:when test="${cvo.memberVO.profile==null}">
        	<img class="user-img" id="user-0" src="//gravatar.com/avatar/002464562345234523523568978962?d=retro" />
        </c:when>
        <c:otherwise>
        <div id="showDetailCommentArtistProfile">
			<img class="user-img" id="user-0" src="${pageContext.request.contextPath}/resources/img/profile/${cvo.memberVO.profile}" />
			</div>
        </c:otherwise>
        </c:choose>
        </div>
      </article>
      
      <div id="div-comment${order.count}" class="showDetailMemberComment">
<br>
<c:if test="${member.id==cvo.memberVO.id}">

			<form id="commentUpdate" action="deleteComment.do" method="post">
			<sec:csrfInput/>
				<input type="hidden" name="commentNo" value="${cvo.commentNo}"> 
				<input type="hidden" name="countNo" value="${order.count}"> 
				<input type="hidden" name="showNo" value="${svo.showNo}"> 
				<c:choose>
				<c:when test="${requestScope.validity>2}">
				<input type="button" id="commentUpdate${order.count}" value="수정" disabled="disabled" class="btn-disabled" style="background-color: grey; border: 2px solid grey;">
				</c:when>
				<c:otherwise>
				<input type="button" id="commentUpdate${order.count}" value="수정">
				</c:otherwise>
				</c:choose>
				<input type="submit" id="commentDelete${order.count}" value="삭제"> 
			</form>
		</c:if>
<br>
</div>
</c:otherwise>
</c:choose>
</c:forEach> 
      
      
      <%-- 페이징 처리 --%>
      <c:set var="pb" value="${requestScope.clvo.pagingBean}" />
	<div class="pagingInfo" align="center">
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
                <span id="commentSpan"><strong>Comments</strong></span> <span id="cCnt"></span>
                            	<span id="commentCheckResult"></span><span id="commentCheckLimit">/50</span>
            </div>
            <div>
                <table class="table">                    
           	 
                    <tr>
                        <td id="commentRegisterTd">
                            <textarea rows="3" cols="30" id="comment" name="commentContent" placeholder="댓글을 입력하세요" maxlength="50"></textarea>
                            
                            <br>
                            <div>
                            <c:choose>
                            	<c:when test="${requestScope.validity>2}">
                                	<input id="commentRegisterBtn" type="submit" class="btn pull-right btn-disabled" value="등록" disabled="disabled">
                            	</c:when>
                            	<c:otherwise>
                                <input id="commentRegisterBtn" type="submit" class="btn pull-right btn-success" value="등록">
                            	</c:otherwise>
                            </c:choose>
                            </div>
                        </td>
                    </tr>
                </table>
            </div>
        </div>
        
    </form>
      
      </section>
  </div>
      
      
    

<div id="showDetailrightSide">

</div> 