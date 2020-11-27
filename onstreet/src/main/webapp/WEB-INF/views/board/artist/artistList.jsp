<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" session="false"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:forEach var="avo" items="${requestScope.artistVO.artistList}">
아티스트 이름 : ${avo.nickName} 
아티스트 사진 : ${avo.profile}
</c:forEach>
