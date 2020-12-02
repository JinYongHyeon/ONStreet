<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" session="false"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>
<script type="text/javascript"
	src="${pageContext.request.contextPath}/resources/editor/js/HuskyEZCreator.js"></script>
<script type="text/javascript">

var oEditors = [];
	$(function() {
		nhn.husky.EZCreator
				.createInIFrame({
					oAppRef : oEditors,
					elPlaceHolder : "showContent", //text area id 
					//SmartEditor2Skin.html 파일이 존재하는 경로
					sSkinURI : "${pageContext.request.contextPath}/resources/editor/SmartEditor2Skin.html",
					htParams : {
						// 툴바 사용 여부 (true:사용/ false:사용하지 않음)
						bUseToolbar : true,
						// 입력창 크기 조절바 사용 여부 (true:사용/ false:사용하지 않음)
						bUseVerticalResizer : true,
						// 모드 탭(Editor | HTML | TEXT) 사용 여부 (true:사용/ false:사용하지 않음)
						bUseModeChanger : true,
						fOnBeforeUnload : function() {
						}
					},
					fOnAppLoad : function() {
						//기존 저장된 내용의 text 내용을 에디터상에 뿌려주고자 할때 사용
						//oEditors.getById["showContent"].exec("PASTE_HTML", ["${svo.showTitle}"]);
					},
					fCreator : "createSEditor2"
				});
		
		$(document).on("click",".photoPreViewBtn",function(){
			alert(1);
		});

		//저장버튼 클릭시 form 전송
		$("#postUpdate").click(function() {
			if ($("#postTitle").val() == "") {
				alert("게시글 제목을 입력하세요.");
				return;
			}

			oEditors.getById["showContent"].exec("UPDATE_CONTENTS_FIELD", []);

			if ($("#showContent").val() == "") {
				alert("게시글 내용을 입력하세요.");
				return;
			}

			$("#frm").submit();
		});

		$("#multipartPreViewForm input[value=전송]").click(
			
						function() {
							var formData = new FormData($('#multipartPreViewForm')[0]);
							$
									.ajax({
										type : "post",
										enctype : 'multipart/form-data',
										url : "fileupload.do",
										dataType : "json",
										beforeSend : function(xhr) { /*데이터를 전송하기 전에 헤더에 csrf값을 설정한다*/
											xhr.setRequestHeader(
													"${_csrf.headerName}",
													"${_csrf.token}");
										},
										data : formData, //
										processData : false, // Jquery 내부적으로 query string 방식으로 사용을 안할 때 사용 : 파일 전송때는 사용 안함 - 필수
										contentType : false, // multipart/form-data 방식으로 하기 위해 설정 - 필수
										success : function(data) {
											for (var i = 0; i < data.length; i++) {
												oEditors.getById["showContent"]
														.exec(
																"PASTE_HTML",
																[ "<img src='${pageContext.request.contextPath}/resources/img/content/"+data[i]+"'/>" ]);
											}
											if($("#multipartPreView").is(":animated"))return;
											$("#multipartPreView").animate({
													top:"40%",
													opacity: 0
											},1000,function(){
												$(this).css({"display":"none"},
												$("#multipartPreViewForm")[0].reset(),
												$("#multipartPreView .preViewImg ul").html(""),
												$("#multipartPreView .preViewImg .preViewDefault").show()
												);
												
											});
										}

									});//ajax
						});//click
		
		$("#multipartPreViewForm input[value=취소]").click(function(){
			if($("#multipartPreView").is(":animated"))return;
			$("#multipartPreView").animate({
					top:"40%",
					opacity: 0
			},1000,function(){
				$(this).css({"display":"none"},
				$("#multipartPreViewForm")[0].reset(),
				$("#multipartPreView .preViewImg ul").html(""),
				$("#multipartPreView .preViewImg .preViewDefault").show()
				);
				
			});
			
		});//click
						
		$("#multipartPreViewForm input[type=file]").change(multipartPreView)
		//멀티 파일 이미지 보기
		function multipartPreView(e) {
			$("#multipartPreView .preViewImg ul").html("");
			var files = e.target.files;
			var fileArr = Array.prototype.slice.call(files);
			var index = 0;

			fileArr.forEach(function(f) {
						if (!f.type.match("image/.*")) {
							alert("이미지 확장자만 업로드 가능합니다.");
							$("#multipartPreViewForm input[type=file]").val("");
							return;
						}
						
						if (files.length < 11) {
							//sel_files.push(f);
							var reader = new FileReader();
							reader.onload = function(e) {
								var html = "<li><img src=\""+e.target.result+"\"/></li>";
								//oEditors.getById["showContent"].exec("PASTE_HTML", ["기존 DB에 저장된 내용을 에디터에 적용할 문3332323222323구"]);
								//oEditors.getById["showContent"].exec("PASTE_HTML", [html]);
								$("#multipartPreView .preViewImg ul").append(
										html);
							}
							reader.readAsDataURL(f);
						}
					})
						if (files.length > 11) {
								alert("최대 10장까지 업로드 할 수 있습니다.");
								$(this).val("");
								return;
							}
			$("#multipartPreView .preViewImg .preViewDefault").hide();
			
		}//다중 이미지 미리보기
		$(".preView").click(function(){
			if($("#multipartPreView").is(":animated"))return;
			$("#multipartPreView").css({"top":"60%"});
			$("#multipartPreView").css({"display":"block"});
			$("#multipartPreView .preViewImg .preViewDefault").show();
			$("#multipartPreView").animate({
					top:"50%",
					opacity: 1
			},1000);
				
			});
	});
</script>



<button type="button" class="preView">보기</button>

<div id="multipartPreView">

	<div class="preViewImg">
		<div class="preViewDefault">
			<svg width="100px" height="100px" viewBox="0 0 16 16"
				class="bi bi-images" fill="currentColor"
				xmlns="http://www.w3.org/2000/svg">
  <path fill-rule="evenodd"
					d="M12.002 4h-10a1 1 0 0 0-1 1v8l2.646-2.354a.5.5 0 0 1 .63-.062l2.66 1.773 3.71-3.71a.5.5 0 0 1 .577-.094l1.777 1.947V5a1 1 0 0 0-1-1zm-10-1a2 2 0 0 0-2 2v8a2 2 0 0 0 2 2h10a2 2 0 0 0 2-2V5a2 2 0 0 0-2-2h-10zm4 4.5a1.5 1.5 0 1 1-3 0 1.5 1.5 0 0 1 3 0z" />
  <path fill-rule="evenodd"
					d="M4 2h10a1 1 0 0 1 1 1v8a1 1 0 0 1-1 1v1a2 2 0 0 0 2-2V3a2 2 0 0 0-2-2H4a2 2 0 0 0-2 2h1a1 1 0 0 1 1-1z" />
</svg>
			<h1>사진을 업로드해주세요</h1>
		</div>
		<ul>

		</ul>
	</div>
	<form  enctype="multipart/form-data" id="multipartPreViewForm">
		<div class="multipartPreViewFile">
			<input type="file" name="files" multiple="multiple">
		</div>
		<div class="multipartPreViewBtn">
			<input type="button" value="전송"> <input type="button"
				value="취소">
		</div>
	</form>
</div>



<c:set var="svo" value="${requestScope.svo}" />
<div style="float: left; width: 15%; height: 100px"></div>
<div style="float: left; width: 70%;">
<form action="updateShow.do" method="post" id="frm">
<input type="hidden" name="showNo" value="${svo.showNo}">
<sec:csrfInput/>
<table border="1" id="showDetail">
		<tr>
			<td>공연제목</td><td><input type="text" name="showTitle" value="${svo.showTitle}" required="required"></td>
		</tr>
		<tr>
			<td>공연내용</td>
			<td style="width: 1300px"><textarea rows="25" cols="100"
						name="showContent" id="showContent">${svo.showContent}</textarea></td>
		</tr>
		<tr>
			<td>공연일정</td><td><input type="date" name="showDate" required="required" value="${svo.showDate}"></td>
		</tr>
</table>
<input type="submit" value="수정하기" id="postUpdate" class="btn btn-warning">
</form>
</div>
<div style="float: left; width: 15%;"></div>