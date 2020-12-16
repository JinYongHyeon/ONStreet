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
h1 {
	color: var(--solid);
	font-size: 2.5rem;
	margin-top: 6rem;	
}
.btn {
	position: relative;
	margin: 0 auto;
	width: var(--btn-w);
	color: #d03535;
	border: .15em solid #d03535;
	border-radius: 5em;
	text-transform: uppercase;
	text-align: center;
	font-size: 0.9em;;
	line-height: 2em;
	cursor: pointer;	
	margin-top: 10px;
    margin-right: 10px;
}
.dot {
	content: '';
	position: absolute;
	top: 0;
	width: var(--dot-w);
	height: 100%;
	border-radius: 100%;
	transition: all 300ms ease;
	display: none;
}
.dot:after {
	content: '';
	position: absolute;
	left: calc(50% - .4em);
	top: -.4em;
	height: .8em;
	width: .8em;
	background: var(--primary);
	border-radius: 1em;
	border: .25em solid var(--solid);
	box-shadow: 0 0 .7em var(--solid),
				0 0 2em var(--primary);
}
.btn:hover .dot,
.btn:focus .dot {
	animation: atom 2s infinite linear;
	display: block;
}
@keyframes atom {
	0% {transform: translateX(0) rotate(0);}
	30%{transform: translateX(var(--tr-X)) rotate(0);}
	50% {transform: translateX(var(--tr-X)) rotate(180deg);}
	80% {transform: translateX(0) rotate(180deg);}
	100% {transform: translateX(0) rotate(360deg);}
}
#Mypage img{
	width: 35%;
    float: left;
}
  #mypage{
  width: 100%;
  margin-top: 43px;
  }
  #mypage .mypageImage img {
  	width: 89%;
  }
  #mypage .mypageImage{
  	width: 40%;
  	float: left;
  }
  #mypage .mypageContent{
  	width: 40%;
  	float:left;
  	margin-left:20px;
  	font-size: large;
  }
  #btngroup{
  	position: absolute;
  	margin-top: 29px;
  }
  #artistInfo{
  	height: 150px;
  	overflow: hidden;
  	
  }
  .mypageContent p {
  	 word-break: break-all; 
  }
</style>

<script type="text/javascript">
function myFunction() {
	  /* var dots = document.getElementById("dots");
	  var moreText = document.getElementById("more");
	  var btnText = document.getElementById("myBtn");

	  if (dots.style.display === "none") {
	    dots.style.display = "inline";
	    btnText.innerHTML = "Read more"; 
	    moreText.style.display = "none";
	  } else {
	    dots.style.display = "none";
	    btnText.innerHTML = "Read less"; 
	    moreText.style.display = "inline";
	  } */
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
   	<sec:authentication property="principal.memberVO.profile"/>
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
        ${requestScope.map.AVGLIKE}♨
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

<div class="col-sm-2"></div>
	
</div>







<%-- 
<div class="mypageBtn">
		<a href="${pageContext.request.contextPath}/removeMemberForm.do">회원탈퇴</a>
		<a href="${pageContext.request.contextPath}/updateArtistForm.do">회원정보수정</a>
		<a href="${pageContext.request.contextPath}/artistCheckEventList.do">이벤트신청현황</a>
		<a href="${pageContext.request.contextPath}/updatePasswordForm.do">비밀번호수정</a>
		<a href="${pageContext.request.contextPath}/followingList.do">팔로우리스트</a>
	</div> --%>

