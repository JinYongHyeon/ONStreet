<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" session="false"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<br>
<span id="artistTitle">ARITST</span>
<br><br><br>

<div class="col-sm-4 artistProfileImg">
	<img src="${pageContext.request.contextPath}/resources/img/profile/${requestScope.artistVO.memberVO.profile}">
	<br>
</div>
<div class="col-sm-1"></div>
<div class="col-sm-5 artistProfile">
    <span id="artistName">${requestScope.artistVO.memberVO.nickName}</span>
    		<input type="button" value="팔로우" id="follow">
    <hr>
     <form id="memberCountCon">
     	<c:if test="${requestScope.map==null}">
     		🔥현재 ${requestScope.artistVO.memberVO.nickName}의 온도는 0°C🔥
     	</c:if>
	</form>
	<form>
    <input type="button" id="showDateList" value="공연일정보기">
    </form>

<hr>
    <br>
	${requestScope.artistVO.artistInfo}
	<c:if test="${requestScope.artistVO.sns!=null}">
	<hr>
	<img src="${pageContext.request.contextPath}/resources/img/social-media.png">
	<b>공식계정</b> 
		${requestScope.artistVO.sns}<hr>
	</c:if>
	<c:if test="${requestScope.artistVO.account!=null}">
	<img src="${pageContext.request.contextPath}/resources/img/money.png">
	<b>후원계좌</b> 
		${requestScope.artistVO.account} <hr>
	</c:if>
	<br>
	<br>
</div>
<div class="col-sm-1"></div>

<sec:authorize access="!hasRole('ROLE_MEMBER')">
	<div id="login">
		<div class="loginTitle">
			<h3>SHOW LIST</h3>
			<svg width="2em" height="2em" viewBox="0 0 16 16" class="bi bi-x-square" fill="currentColor" xmlns="http://www.w3.org/2000/svg">
  <path fill-rule="evenodd" d="M14 1H2a1 1 0 0 0-1 1v12a1 1 0 0 0 1 1h12a1 1 0 0 0 1-1V2a1 1 0 0 0-1-1zM2 0a2 2 0 0 0-2 2v12a2 2 0 0 0 2 2h12a2 2 0 0 0 2-2V2a2 2 0 0 0-2-2H2z" />
  <path fill-rule="evenodd" d="M4.646 4.646a.5.5 0 0 1 .708 0L8 7.293l2.646-2.647a.5.5 0 0 1 .708.708L8.707 8l2.647 2.646a.5.5 0 0 1-.708.708L8 8.707l-2.646 2.647a.5.5 0 0 1-.708-.708L7.293 8 4.646 5.354a.5.5 0 0 1 0-.708z" />
</svg>
		</div>
		<div class="loginMain">
			<table class="table table-striped table-condensed">
	<thead>
		<tr class="success">
			<th>제목</th>
			<th>공연일시</th>
		</tr>
	</thead>

	<tbody>
	<c:forEach items="${requestScope.showVO}" var="showVO" varStatus="status">
			<tr>
				<td>
				${showVO.showTitle}
				</td>
				<td>
				${showVO.showDate}
				</td>
			</tr>
			</c:forEach>
	</tbody>
</table>
		</div>
	</div>
</sec:authorize>

<script type="text/javascript">
	$(document).ready(function() {
		
		$.ajax({
			type: "post",
			url: "${pageContext.request.contextPath}/registerFollowing.do",
			dataType: "text",
			data: "followingId=${requestScope.artistVO.memberVO.id}",
			beforeSend : function(xhr){   /*데이터를 전송하기 전에 헤더에 csrf값을 설정한다*/
	             xhr.setRequestHeader("${_csrf.headerName}", "${_csrf.token}");
	            },
			success: function(data) {
				if(data==="0") {
					$("#follow").attr("value", "팔로우 취소");
					return;
				}
			}
			});//ajax

		$("#follow").click(function() {
			if($("#follow").val()=="팔로우") {
			
		if(confirm("팔로우 하시겠습니까?")) {
			
		$.ajax({
			type: "post",
			url: "${pageContext.request.contextPath}/registerFollowing.do",
			dataType: "text",
			data: "followingId=${requestScope.artistVO.memberVO.id}",
			beforeSend : function(xhr){   /*데이터를 전송하기 전에 헤더에 csrf값을 설정한다*/
	             xhr.setRequestHeader("${_csrf.headerName}", "${_csrf.token}");
	            },
			success: function(data) {
				if(data==="0") {
					alert("이미 팔로우한 아티스트입니다!");
					$("#follow").attr("value", "팔로우 취소");
					return;
				} else {
					if(confirm("팔로우 리스트로 이동하시겠습니까?"))
						location.href="followingList.do";
				}
			}
			});//ajax
		}//confirm
			} else {
				if(confirm("팔로우 취소하시겠습니까?")) {
				$.ajax({
					type: "post",
					url: "${pageContext.request.contextPath}/removeFollowing.do",
					dataType: "text",
					data: "followingId=${requestScope.artistVO.memberVO.id}",
					beforeSend : function(xhr){   /*데이터를 전송하기 전에 헤더에 csrf값을 설정한다*/
			             xhr.setRequestHeader("${_csrf.headerName}", "${_csrf.token}");
			            },
					success: function(data) {
							alert("팔로우 취소되었습니다");
							$("#follow").attr("value", "팔로우");
							return;
					}
					});//ajax
				}
			}
		});
		
		<c:choose>
		<c:when test="${requestScope.map!=null}">
			var memberCountConTxt=${requestScope.map.AVGLIKE};
		</c:when>
		<c:otherwise>
			var memberCountConTxt=0;
		</c:otherwise>
	</c:choose>
	
		$({ val : 0 }).animate({ val : memberCountConTxt }, {
			   duration: 3000,
			  step: function() {
			    var num = numberWithCommas(Math.floor(this.val));
			    $("#memberCountCon").text("🔥현재 ${requestScope.artistVO.memberVO.nickName}의 온도는 "+num+"°C🔥");
			  },
			  complete: function() {
			    var num = numberWithCommas(Math.floor(this.val));
			    $("#memberCountCon").text("🔥현재 ${requestScope.artistVO.memberVO.nickName}의 온도는 "+num+"°C🔥");
			  }
			});

			function numberWithCommas(x) {
			    return x.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
			}
			
			$(document).on("click","#showDateList",function(){
				$("#login").show();
			});
	});//ready
</script>