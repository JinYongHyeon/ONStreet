<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" session="false"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>
<style>
	#mypageRightMenuArea{
		width:300px;
		height: 80vh;
		position: absolute;
		right:0;
		top:0;
		overflow: hidden;
	}
	#mypageRightMenuArea .mypageRightMenu{
		width: 100%;
		height: 100%;
		position:absolute;
		right: -100%;
		transition:0.4s;
	}
	#mypageRightMenuArea .mypageRightMenu::before{
		content:"";
		width:100%;
		height: 100%;
		position: absolute;
		background-color:#000;
		opacity: 0.7;
	}
	#mypageRightMenuArea:hover .mypageRightMenu{
		right:0;
	}
</style>
<div class="container">
  <h2>My page</h2>
  
  
  <table class="table table-bordered table-sm">
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
  
        <a href="${pageContext.request.contextPath}/removeMemberForm.do">회원탈퇴</a><br>
        <a href="${pageContext.request.contextPath}/updateMemberForm.do">회원정보수정</a><br>
        <a href="${pageContext.request.contextPath}/followingList.do">팔로잉목록보기</a><br>
        <a href="${pageContext.request.contextPath}/updatePasswordForm.do">비밀번호수정</a>
</div>

<div id="mypageRightMenuArea">
		<div class="mypageRightMenu">
			<ul>
				<li>test1</li>
				<li>test1</li>
				<li>test1</li>
				<li>test1</li>
			</ul>
		</div>
	</div>









	
	