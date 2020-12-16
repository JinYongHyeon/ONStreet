<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" session="false"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>
<style>
:root {
 	/* --bg: #3C465C;  */
 	--primary: #d03535; 
	--solid: #d03535;
	--btn-w: 10em;
	--dot-w: calc(var(--btn-w)*.2);
	--tr-X: calc(var(--btn-w) - var(--dot-w));
}
* {box-sizing: border-box;}
*:before, *:after {box-sizing: border-box;}

 body {
	height: 100vh;
	display: flex;
	justify-content: center;
	align-items: center;
	flex-flow: wrap;
	background: var(--bg);
	font-size: 20px;
	font-family: 'Titillium Web', sans-serif;
}

</style>

<script type="text/javascript">
function myFunction() {
	  var artistInfo = document.getElementById("artistInfo");
	  var height = document.getElementById("artistInfoText").offsetHeight+40+'px';
	  var btnText = document.getElementById("myBtn");
	  if(artistInfo.offsetHeight+'px' === height){
		  artistInfo.style.height="150px";
		  btnText.innerHTML = "Read more"; 
	  }else{
		  artistInfo.style.height=height;
		  btnText.innerHTML = "Read less"; 
	  }
	}
</script>
<div class="container" id="mypage-alink">
  <span id="mypageTitle">Artist Mypage</span>
 
 
 
 <div id="mypage">
 
  <div class="mypageImage">
    <sec:authentication property="principal.memberVO.profile" var="member"/>
    
    <c:choose>
   	<c:when test="${member==null}">
   	<img src="${pageContext.request.contextPath}/resources/img/profile/default.png">
   	</c:when>
   	<c:otherwise>
    	<img src="${pageContext.request.contextPath}/resources/img/profile/<sec:authentication property="principal.memberVO.profile"/>"/>
   	</c:otherwise>
    </c:choose>
         <div id="btngroup">

	<div class="btn" onclick="location.href='${pageContext.request.contextPath}/removeMemberForm.do'">
		<span>회원탈퇴</span>
		<div class="dot"></div>
	</div>
	
	<div class="btn" onclick="location.href='${pageContext.request.contextPath}/updateArtistForm.do'">
		<span>회원정보수정</span>
		<div class="dot"></div>
	</div><br>
	
	<div class="btn" onclick="location.href='${pageContext.request.contextPath}/artistCheckEventList.do'">
		<span>이벤트신청현황</span>
		<div class="dot"></div>
	</div>
	<div class="btn" onclick="location.href='${pageContext.request.contextPath}/followingList.do'">
		<span>팔로잉목록보기</span>
		<div class="dot"></div>
	</div><br>
	
	<div class="btn" onclick="location.href='${pageContext.request.contextPath}/updatePasswordForm.do'">
		<span>비밀번호수정</span>
		<div class="dot"></div>
	</div>
</div>
    
    </div>
 
   <div class="col-sm-6 mypageContent">
        <b>아이디</b>
		<sec:authentication property="principal.memberVO.id"/>
		<hr>
		<b>이름</b>
		<sec:authentication property="principal.memberVO.name"/>
		<hr>
		<b>휴대폰 번호</b>
		<sec:authentication property="principal.memberVO.phone"/>
		<hr>
		<b>주소</b>
		<sec:authentication property="principal.memberVO.address"/>
		<hr>
		<b>이메일</b>
		<sec:authentication property="principal.memberVO.email"/>
		<hr>
		<b>아티스트명</b>
		<sec:authentication property="principal.memberVO.nickName"/>
		<hr>
        <b>현재온도</b>
        	<c:choose>
		<c:when test="${requestScope.map==null}">
		🔥현재 <sec:authentication property="principal.memberVO.nickName"/>의 온도는 0°C🔥
		</c:when>
		<c:otherwise>
			🔥현재 <sec:authentication property="principal.memberVO.nickName"/>의 온도는	${requestScope.map.AVGLIKE}°C🔥
		</c:otherwise>
	</c:choose>
        <hr>
		<b>팔로워</b>
		${requestScope.followingTotalCount}명
		<hr>
		<b>SNS 주소</b>
		<sec:authentication property="principal.sns"/>
		<hr>
		<b>후원계좌</b>
		<sec:authentication property="principal.account"/>
		<hr>
		<div id="artistInfo">
		<b>소개글</b>
		<p id="artistInfoText"><sec:authentication property="principal.artistInfo"/><span id="dots">
		</span><span id="more"></span></p>
		
		</div>
		<button onclick="myFunction()" id="myBtn">Read more</button>

   


     </div>
     </div> 

	
</div>



