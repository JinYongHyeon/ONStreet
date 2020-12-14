<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" session="false"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec"%>

<script type="text/javascript"
	src="${pageContext.request.contextPath}/resources/editor/js/HuskyEZCreator.js"></script>
<script type="text/javascript">
	var oEditors = [];
	$(function() {
		nhn.husky.EZCreator
				.createInIFrame({
					oAppRef : oEditors,
					elPlaceHolder : "eventContent", //text area id 
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
						//   oEditors.getById["eventContent"].exec("PASTE_HTML", ["기존 DB에 저장된 내용을 에디터에 적용할 문구"]);
					},
					fCreator : "createSEditor2"
				});
		
		$("#multipartPreViewForm input[value=전송]").click(
				
				function() {
					if($("#multipartPreViewForm .multipartPreViewFile input[type=file]").val()===""){
						alert("이미지를 등록해주세요");
						return;
					}
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
										oEditors.getById["eventContent"]
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

		//저장버튼 클릭시 form 전송
		$("#postWrite").click(function() {
			if ($("#eventTitle").val() == "") {
				alert("게시글 제목을 입력하세요.");
				return;
			}
			
			if($("#eventDate").val() == "") {
				alert("이벤트 날짜를 선택해주세요.");
				return;
			}
			
			if($("#eventImageFile").val() == "") {
				alert("배너사진을 선택해주세요.");
				return;
			}

			oEditors.getById["eventContent"].exec("UPDATE_CONTENTS_FIELD", []);

			if ($("#eventContent").val() == ""||$("#eventContent").val()=="<p>&nbsp;</p>") {
				alert("게시글 내용을 입력하세요.");
				return;
			}

			$("#addEvent").submit();
		});

		
		
		let today = new Date();   

		let year = today.getFullYear(); // 년도
		let month = today.getMonth() + 1;  // 월
		let date = today.getDate();  // 날짜
		if(date<10) {
			date='0'+date;
		}
		$("#eventDate").attr('min',year+'-'+month+'-'+date);
		
		$("#eventImageFile").change(function() {
			var file  = this.files[0];
		    var _URL = window.URL || window.webkitURL;
		    var img = new Image();
		    
		    img.src = _URL.createObjectURL(file);
		    img.onload = function() {
		        
		        if(img.width != 800 || img.height != 150) {
		            alert("이미지 가로 800px, 세로 150px로 맞춰서 올려주세요.");
		            $("#eventImageFile").val("");
		        } 
		    }
		});
	});
</script>
<body>
<h1><b>EVENT</b></h1> <br>

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
<div class="container">
<form action="addEvent.do" method="post" id="addEvent" enctype="multipart/form-data">
<sec:csrfInput />
제목  <input type="text" name="eventTitle" placeholder="제목을 입력하세요" required="required" id="eventTitle"> <br><br>
<div class="mutiPhotoUpload">
						<div id="mutiPhotoUploadBtn">
							<button type="button" class="preView" id="test">
							<svg width="20px" height="20px" viewBox="0 0 16 16" class="bi bi-camera-fill" fill="currentColor" xmlns="http://www.w3.org/2000/svg">
							  <path d="M10.5 8.5a2.5 2.5 0 1 1-5 0 2.5 2.5 0 0 1 5 0z"/>
							  <path fill-rule="evenodd" d="M2 4a2 2 0 0 0-2 2v6a2 2 0 0 0 2 2h12a2 2 0 0 0 2-2V6a2 2 0 0 0-2-2h-1.172a2 2 0 0 1-1.414-.586l-.828-.828A2 2 0 0 0 9.172 2H6.828a2 2 0 0 0-1.414.586l-.828.828A2 2 0 0 1 3.172 4H2zm.5 2a.5.5 0 1 0 0-1 .5.5 0 0 0 0 1zm9 2.5a3.5 3.5 0 1 1-7 0 3.5 3.5 0 0 1 7 0z"/>
							</svg></button>
						</div>
<textarea rows="25" cols="170" name="eventContent" id="eventContent"></textarea></div><br><br>
이벤트 날짜  <input type="date" name="eventDate" required="required" id="eventDate"> 
<input type="file" name="eventImageFile" id="eventImageFile" accept="image/*"><br><br>
<input type="button" id="postWrite" value="등록하기"><br><br>
</form>
</div>
