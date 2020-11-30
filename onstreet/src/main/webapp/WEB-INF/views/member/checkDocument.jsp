<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" session="false"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<style>
.container {
	width: 1200px;
}
</style>
<div class="container">
	<div id="checkDocument">
		<div class="checkDocumentTitle">
			<h1>이용약관</h1>
		</div>
		<div class="checkDocumentSubTitle">
			<span>개인정보 이용 약관 동의서</span>
		</div>
		<div class="checkDocumentContent">
			<pre>
1. 개인정보의 수집항목
(주)BIT는 홈페이지 회원 가입 시 회원 서비스 제공에 필요한 최소한의 정보를 수집하고 있으며 개인정보파일에 수집되는 항목은 다음과 같습니다.
-관객
- 이름, 아이디, 연락처, 이메일, 주소, 생년월일
-아티스트 
- 이름, 아이디, 연락처, 이메일, 주소, 생년월일,SNS,계좌번호

2. 개인정보 수집목적
(주)BIT가 제공하는 서비스(공연일정 날짜 제공, 이벤트 및 아티스트정보 제공) 및 개발(사전조사 및 만족도 설문조사, 고객문의 등)을 위해 수집합니다.
(주)BIT는 원칙적으로 이용자의 개인정보를 수집 및 이용 목적범위 내에서 처리하며, 
이용자의 사전 동의 없이는 본래의 범위를 초과하여 처리하거나 제3자에게 제공하지 않습니다.

가. 회원관리
회원 맞춤 서비스 제공, 개인식별, 전체 서비스의 원활한 운영을 위한 관리, 회원탈퇴 의사 확인

나. 고유서비스 이용 및 신규 개발
(주)BIT에서 제공하는 공연정보를 비롯한 각종 고유 서비스 제공의 필요 시, 신규 서비스 개발 시 의견수렴 및 안내

3. 개인정보의 보유기간
- 홈페이지 회원가입에 따라 수집된 개인정보 보유기간은 영구적입니다.

4. 기타사항(거부할 권리 등)
- 회원가입에 따른 개인정보의 수집, 이용, 제공에 대해 귀하께서 동의하신 내용은 언제든지 철회 또는 거부하실 수 있습니다. 
이의 경우 회원탈퇴로 처리되며 동의철회(거부)는 「회원탈퇴」를 클릭하거나 개인정보관리담당(책임자)에게 서면, 
전화 이메일 등으로 연락하시면 즉시 개인정보의 삭제 및 파기 등 필요한 조치를 하겠습니다.
- 개인정보제공 동의 거부에 의한 홈페이지 이용 제한
 · ONSTREET 서비스 : 기본 서비스에 대한 이용 제한
 · ONSTREET 메인화면 : 기본 서비스에 대한 이용 제한 없음


(주)BIT 개인정보보호책임 관련 신고 및 문의
• 전화번호 : XX-XXX-XXXX
• 팩 스 : XX-XXXX-XXXX
• 이 메 일 : bit@XXXXXXX.com
• 우 편 : 주소가 없는 유령회사임 경영관리팀 개인정보보호책임자 앞
• 근무시간 : 평일 09:00 ~ 18:00
(토요일 및 일요일, 공휴일은 휴무 / 점심시간 13:00~14:00)

기타 개인정보에 관한 상담 및 문의가 필요한 경우에는 개인정보침해신고센터 등으로 문의하실 수 있습니다.
</pre>
		</div>
		<div class="checkDocumentCheckBox">
			<form id="checkDocumentForm" action="${pageContext.request.contextPath}/choiceMember.do">
				<input type="checkbox" name="checkDocument"><span>위
					약관의 동의합니다.</span>
			</form>
		</div>
		<div class="checkDocumentBtn">
			<input type="button" value="확인"><input type="button" value="취소"> 
		</div>
	</div>
</div>