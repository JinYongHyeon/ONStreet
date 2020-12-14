 <%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" session="false"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<div class="container">
<div id="choiceRegister">
	<div class="choiceTitle">
		<h1>회원가입</h1>
	</div>
		<section>
				<ul>
					<li><a href="${pageContext.request.contextPath}/registerMemberForm.do"><img src="${pageContext.request.contextPath}/resources/img/audience1.png" alt="관객"><!-- <span>관객</span> --></a></li>
					<li><h3>
							<a
								href="${pageContext.request.contextPath}/registerMemberForm.do">관객</a>
						</h3></li>
				</ul>
				<ul>
					<li><a href="${pageContext.request.contextPath}/registerArtistForm.do"><img src="${pageContext.request.contextPath}/resources/img/artist1.jpg" alt="아티스트"><!-- <span>아티스트</span> --></a></li>
					<li>
						<h3>
							<a
								href="${pageContext.request.contextPath}/registerArtistForm.do">아티스트</a>
						</h3>
					</li>
				</ul>
		</section>
	</div>
</div>
	<%-- container --%>