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
	font-size: 1.3em;
	line-height: 2em;
	cursor: pointer;	
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

</style>


<div class="container" id="mypage-alink">
  <span id="mypageTitle">My page</span>   
  
  
  <table class="table table-bordered table-sm" id="mypagetable">
  
    <thead>
    
      <tr>
        <th>아이디</th>
        <td><sec:authentication property="principal.memberVO.id"/></td>
      </tr>
      <tr>
        <th>이름</th>
        <td><sec:authentication property="principal.memberVO.name"/></td>
       </tr>
       <tr>
        <th>닉네임</th>
        <td><sec:authentication property="principal.memberVO.nickName"/></td>
        </tr>
        <tr>
        <th>휴대폰 번호</th>
        <td><sec:authentication property="principal.memberVO.phone"/></td>
        </tr>
        <tr>
        <th>주소</th>
        <td><sec:authentication property="principal.memberVO.address"/></td>
        </tr>
        <tr>
        <th>이메일</th>
        <td><sec:authentication property="principal.memberVO.email"/></td>
        </tr>
      
      </thead>
      
  </table>
       	<a href="${pageContext.request.contextPath}/removeMemberForm.do">회원탈퇴</a>
        <a href="${pageContext.request.contextPath}/updateMemberForm.do">회원정보수정</a>
        <a href="${pageContext.request.contextPath}/followingList.do">팔로잉목록보기</a>
        <a href="${pageContext.request.contextPath}/updatePasswordForm.do">비밀번호수정</a>
</div>


<div class="container">	
	<div class="btn">
		<span>회원탈퇴</span>
		<div class="dot"></div>
	</div>
	<div class="btn">
		<span>회원정보수정</span>
		<div class="dot"></div>
	</div>
	<div class="btn">
		<span>팔로잉목록보기</span>
		<div class="dot"></div>
	</div>
	<div class="btn">
		<span>비밀번호수정</span>
		<div class="dot"></div>
	</div>
</div>









	
	