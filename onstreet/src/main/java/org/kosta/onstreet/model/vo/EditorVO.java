package org.kosta.onstreet.model.vo;

import org.springframework.web.multipart.MultipartFile;

public class EditorVO {
	private MultipartFile multipartFile;

	public EditorVO() {
		super();
		// TODO Auto-generated constructor stub
	}

	public EditorVO(MultipartFile multipartFile) {
		super();
		this.multipartFile = multipartFile;
	}

	public MultipartFile getMultipartFile() {
		return multipartFile;
	}

	public void setMultipartFile(MultipartFile multipartFile) {
		this.multipartFile = multipartFile;
	}
	
	
}
