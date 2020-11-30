<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" session="false"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>
<script type="text/javascript">
	function target(){
		return confirm("정말 탈퇴하시겠습니까?");
	};
</script>


<form action="${pageContext.request.contextPath}/removeMember.do" method="post"  onsubmit="return target()">
<sec:csrfInput/>
<table>
	<tr>
		<td>아이디</td>
		<td><sec:authentication property="principal.memberVO.id"/></td>
		</tr>
		
		<tr>
		<td>비밀번호</td>
		<td><input type="password" name="password"></td>
	</tr>
</table>
<input type="submit" value="탈퇴하기">
</form>
	
	