package org.kosta.onstreet.controller;

import java.io.File;
import java.io.IOException;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.aspectj.util.FileUtil;
import org.kosta.onstreet.model.service.MemberService;
import org.kosta.onstreet.model.vo.ArtistVO;
import org.kosta.onstreet.model.vo.MemberVO;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
public class MemberController {
	
	@Resource
	private MemberService memberService;
	
	@RequestMapping("registerMemberForm.do")
	public String registerMemberForm() {

		return "member/user/registerMemberForm.tiles";
	}
	
	/**
	 * 로그인 실패 - 진용현
	 * @return
	 */
	@RequestMapping("login_fail.do")
	public String loginFail() {
		return "member/login-fail";
	}
	
	/**
	 * 회원가입 - 진용현
	 * @param memberVO
	 * @return
	 */
	@PostMapping("registerMember.do")
	public String registerMember(MemberVO mvo,HttpServletRequest request) {
		String realPath = request.getSession().getServletContext().getRealPath("/resources/img/profile/");
		String copyPath = "C:"+File.separator+"kosta203"+File.separator+"final-project"+File.separator+"ONStreet"+File.separator+"onstreet"+File.separator+"src"+File.separator+"main"+File.separator+"webapp"+File.separator+"resources"+File.separator+"img"+File.separator+"profile"+File.separator;
		System.out.println(realPath);

		File file =  new File(realPath,System.currentTimeMillis()+mvo.getProfileFile().getOriginalFilename());
		File file2 = new File(copyPath,System.currentTimeMillis()+mvo.getProfileFile().getOriginalFilename());
		
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
		return "index.tiles";
	}
	
	/**
	 * 아이디 중복검사 - 진용현
	 * @param id
	 * @return
	 */
	@ResponseBody
	@RequestMapping("idCheck.do")
	public String idCheck(String id) {
		System.out.println(id);
		ArtistVO artistVO = memberService.findMemberById(id);
		String check = "id_ok";
		if(artistVO != null) {
			check ="id_fail";
		}
		return check;
	}
	
	@ResponseBody
	@RequestMapping("nickNameCheck.do")
	public int nickName(String nickName) {
		return memberService.nickNameCheck(nickName);
	}
	
}
