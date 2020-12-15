<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" session="false"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec"%>
<style>
ul {
  list-style-type: none;
}

li {
  display: inline-block;
}

input[type="checkbox"][id^="cb"] {
  display: none;
}

label {
  border: 1px solid #fff;
  padding: 10px;
  display: block;
  position: relative;
  margin: 10px;
  cursor: pointer;
  -webkit-touch-callout: none;
  -webkit-user-select: none;
  -khtml-user-select: none;
  -moz-user-select: none;
  -ms-user-select: none;
  user-select: none;
}

label::before {
  background-color: white;
  color: white;
  content: " ";
  display: block;
  border-radius: 50%;
  border: 1px solid grey;
  position: absolute;
  top: -5px;
  left: -5px;
  width: 25px;
  height: 25px;
  text-align: center;
  line-height: 28px;
  transition-duration: 0.4s;
  transform: scale(0);
}

label img {
  height: 100px;
  width: 100px;
  transition-duration: 0.2s;
  transform-origin: 50% 50%;
}

:checked+label {
  border-color: #ddd;
}

:checked+label::before {
  content: "✓";
  background-color: grey;
  transform: scale(1);
}

:checked+label img {
  transform: scale(0.9);
  box-shadow: 0 0 5px #333;
  z-index: -1;
}
.container{
	border: 1px solid var(--black-100);
    border-radius: 5px;
    padding: 12px;
    margin: auto;	
    }
    

</style>

<!-- 자바스크립트 -->
<script type="text/javascript">

	/* submit 체크박스 체크용 */
	function check(){
		var flag = false;
		$("input:checkbox[name='followingId']").each(function(){
			//checkbox checked -- > flag = true;
			if($(this).is(":checked")){
				alert(1);
				$("#removefollowBtn").css("display","block");
				$("#removefollowBtn").animate({
					opacity : 1},1000);
			flag=true;
			return ;//반복문 빠져나오게
			}else{
				$("#removefollowBtn").animate({
					opacity : 0
				},1000,function(){
					$(this).css("display","none");	
				});
				$("#removefollowBtn").prop('checked', false);	
			}
		});//each
			
		if(flag){
			if(!confirm("정말 삭제하시겠습니까?"))
				return false;
			}else{//if1
				alert("삭제할 아티스트를 선택해주세요");
			return false;
			}//if2
	}//check
	
	$(document).ready(function(){
		$(document).on("click",".followlistcheck input[name=followingId]",function(){
			ccc();
		});//click event end
		
		$(document).on("click",".followlistcheckSection input[value=모두선택]",function(){
			var fi = document.getElementsByName("followingId");
			for(i=0; i< fi.length; i++){
				fi[i].checked = true;
			}
			ccc();
		});
	});
	function ccc(){
		var flag = false;
		//체크 유무 검사
		$(".followlistcheck input[name=followingId]").each(function(){
			if($(this).is(":checked")){
				flag=true;
				return false;
			}
			//체크 유무 확인 후 삭제버튼 활성화 이벤트
			if(flag === true){
				$("#removefollowBtn").css("display","block");
				$("#removefollowBtn").animate({
					opacity : 1},1000);
			}else{
				$("#removefollowBtn").animate({
					opacity : 0
				},1000,function(){
					$(this).css("display","none");	
				});
			}//else
		});
	}
	
	function check_all(){

		ccc();
	}
		function uncheck_all(){
			var fi = document.getElementsByName("followingId");
			for(i=0; i< fi.length; i++){
				fi[i].checked = false;
			}
			ccc();
		}
		
</script>
<div class="container">
<form action="${pageContext.request.contextPath}/removeFollowing.do" method="post" onsubmit="return check()" name="form">
<input type="button" value="모두선택" class="btn btn-default select_all">
<input type="button" value="모두 해제" class="btn btn-default select_all">
</div>

<div class="container followlistcheck">
<sec:csrfInput/>
<c:forEach var="list" items="${requestScope.list.followList}" varStatus="point">

<c:choose>
	<c:when test="${list.memberVO.profile!=null}">
<ul>
  <li><input type="checkbox" id="cb${point.index}" name="followingId" value="${list.followingId}" />
    <label for="cb${point.index}"><img src="${pageContext.request.contextPath}/resources/img/profile/${list.memberVO.profile}"></label>
  </li>
</ul>	
	</c:when>
	
	<c:otherwise>
<ul>
  <li><input type="checkbox" id="cb${point.index}" name="followingId" value="${list.followingId}"/>
    <label for="cb${point.index}"><img src="${pageContext.request.contextPath}/resources/img/profile/default.png"/></label>
  </li>
</ul>	
	</c:otherwise>
</c:choose>
<a href="${pageContext.request.contextPath}/getArtistDetail.do?id=${list.followingId}">${list.memberVO.nickName}</a><br>
</c:forEach>
</div>
<input type="submit" id="removefollowBtn" style="display:none; opacity: 0" class="btn btn-danger confirm_delete" value="삭제하기" data-original-title>
</form>

<!-- 페이징빈시작 -->
<c:set var="pb" value="${requestScope.list.pagingBean}" />
<div class="pagingInfo">
   <ol class="pagination">
   <c:if test="${pb.previousPageGroup}">   
   <li><a href="${pageContext.request.contextPath}/followingList.do?pageNo=${pb.startPageOfPageGroup-1}">&laquo;</a></li>
   </c:if>
   <c:forEach var="i" begin="${pb.startPageOfPageGroup}" 
   end="${pb.endPageOfPageGroup}">
   <c:choose>
   <c:when test="${pb.nowPage!=i}">
   <li><a href="${pageContext.request.contextPath}/followingList.do?pageNo=${i}">${i}</a></li> 
   </c:when>
   <c:otherwise>
   <li class="active"><a href="#" >${i}</a></li>
   </c:otherwise>
   </c:choose>
   &nbsp;
   </c:forEach>
   <c:if test="${pb.nextPageGroup}">   
   <li><a href="${pageContext.request.contextPath}/followingList.do?pageNo=${pb.endPageOfPageGroup+1}">&raquo;</a></li>
   </c:if>
   </ol>          
   </div> 

