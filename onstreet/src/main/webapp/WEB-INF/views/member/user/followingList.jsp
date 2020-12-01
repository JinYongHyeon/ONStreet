<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" session="false"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<table>
	<thead>
		<tr>
			<td>팔로워</td>
			<td>프로필</td>
		</tr>
	</thead>
<tbody>
<c:forEach var="list" items="${requestScope.list}">
<tr>
<td>${list.memberVO.nickName}</td>
<td><c:choose>
	<c:when test="${list.memberVO.profile!=null}">
<img src="${pageContext.request.contextPath}/resources/img/profile/${list.memberVO.profile}">
	</c:when>
	<c:otherwise>
<img src="${pageContext.request.contextPath}/resources/img/profile/default.png">
	
	</c:otherwise>
</c:choose>
</td>
</tr>
</c:forEach>
</tbody>	
	

</table>