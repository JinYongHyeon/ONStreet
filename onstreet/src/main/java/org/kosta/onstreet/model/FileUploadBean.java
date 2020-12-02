package org.kosta.onstreet.model;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.aspectj.util.FileUtil;
import org.kosta.onstreet.model.vo.EventVO;
import org.kosta.onstreet.model.vo.MemberVO;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

public class FileUploadBean {
	
	/**
	 * 회원가입 프로필 업로드 - 진용현
	 */
	public void profileUpload(MemberVO mvo, HttpServletRequest request) {
		if(!mvo.getProfileFile().getOriginalFilename().equals("")) {
		String realPath = request.getSession().getServletContext().getRealPath("/resources/img/profile/");
		String copyPath = "C:"+File.separator+"kosta203"+File.separator+"final-project"+File.separator+"ONStreet"+File.separator+"onstreet"+File.separator+"src"+File.separator+"main"+File.separator+"webapp"+File.separator+"resources"+File.separator+"img"+File.separator+"profile"+File.separator;
		File file =  new File(realPath);
		if(file.exists() == false) {
			file.mkdirs();
		}
		try {
			String fileName = mvo.getProfile();
			mvo.getProfileFile().transferTo(new File(realPath+fileName));
			FileUtil.copyFile(new File(realPath+fileName), new File(copyPath+fileName));
		} catch (IllegalStateException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
		}
	}
	
	/**
	 * 멀티 이미지 업로드 - 진용현
	 * @param files
	 * @param request
	 * @return
	 */
	public ArrayList<String> multipartImgUpload(List<MultipartFile> files,MultipartHttpServletRequest request){
		String realPath = request.getSession().getServletContext().getRealPath("/resources/img/content/");
		String copyPath = "C:"+File.separator+"kosta203"+File.separator+"final-project"+File.separator+"ONStreet"+File.separator+"onstreet"+File.separator+"src"+File.separator+"main"+File.separator+"webapp"+File.separator+"resources"+File.separator+"img"+File.separator+"content"+File.separator;
		File file =  new File(realPath);
		ArrayList<String> fileUrls= new ArrayList<String>();
		if(file.exists() == false) {
			file.mkdirs();
		}
		for(int i=0; i<files.size();i++) {
			String fileName = System.currentTimeMillis()+files.get(i).getOriginalFilename().substring(files.get(i).getOriginalFilename().indexOf("."));
			if(!fileName.equals("")) {
				try {
					files.get(i).transferTo(new File(realPath+fileName));
					FileUtil.copyFile(new File(realPath+fileName), new File(copyPath+fileName));
					fileUrls.add(fileName);
					System.out.println(fileName+"업로드 완료");
				} catch (IllegalStateException e) {
					e.printStackTrace();
				} catch (IOException e) {
					e.printStackTrace();
				}
			}
		}//for
		return fileUrls;
	}
	
	/**
	 * 정지윤
	 * 이벤트 배너 사진 등록
	 */
	public void eventBannerUpload(EventVO eventVO, HttpServletRequest request) {
		if(!eventVO.getEventImageFile().getOriginalFilename().equals("")) {
			String realPath = request.getSession().getServletContext().getRealPath("/resources/img/content/");
			String copyPath = "C:"+File.separator+"kosta203"+File.separator+"final-project"+File.separator+"ONStreet"+File.separator+"onstreet"+File.separator+"src"+File.separator+"main"+File.separator+"webapp"+File.separator+"resources"+File.separator+"img"+File.separator+"content"+File.separator;
			File file =  new File(realPath);
			if(file.exists() == false) {
				file.mkdirs();
			}
			try {
				String fileName = eventVO.getEventImage();
				eventVO.getEventImageFile().transferTo(new File(realPath+fileName));
				FileUtil.copyFile(new File(realPath+fileName), new File(copyPath+fileName));
			} catch (IllegalStateException e) {
				e.printStackTrace();
			} catch (IOException e) {
				e.printStackTrace();
			}
			}
	}
}
