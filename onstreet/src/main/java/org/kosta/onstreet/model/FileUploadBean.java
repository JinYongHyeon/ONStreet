package org.kosta.onstreet.model;

import java.io.File;
import java.io.IOException;

import javax.servlet.http.HttpServletRequest;

import org.aspectj.util.FileUtil;
import org.kosta.onstreet.model.vo.MemberVO;

public class FileUploadBean {
	
	/**
	 * 회원가입 프로필 업로드 - 진용현
	 */
	public void profileUpload(MemberVO mvo, HttpServletRequest request) {
		if(!mvo.getProfileFile().getOriginalFilename().equals("")) {
		String realPath = request.getSession().getServletContext().getRealPath("/resources/img/profile/");
		String copyPath = "C:"+File.separator+"kosta203"+File.separator+"final-project"+File.separator+"ONStreet"+File.separator+"onstreet"+File.separator+"src"+File.separator+"main"+File.separator+"webapp"+File.separator+"resources"+File.separator+"img"+File.separator+"profile"+File.separator;
		File file =  new File(realPath,mvo.getProfile());
		File file2 = new File(copyPath,mvo.getProfile());
		if(file.exists()) {
			file.mkdirs();
		}
		try {
			mvo.getProfileFile().transferTo(file);
			FileUtil.copyFile(file, file2);
		} catch (IllegalStateException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
		}
	}
}
