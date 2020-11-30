package org.kosta.onstreet.controller;

import java.io.File;
import java.io.IOException;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.apache.commons.fileupload.FileUpload;
import org.aspectj.util.FileUtil;
import org.kosta.onstreet.model.FileUploadBean;
import org.kosta.onstreet.model.service.MemberService;
import org.kosta.onstreet.model.vo.ArtistVO;
import org.kosta.onstreet.model.vo.MemberVO;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class MemberController {
	
	@Resource
	private MemberService memberService;
	
	/**
	 * 회원가입폼[관객] - 진용현
	 * @return
	 */
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
	
	//세희시작 //관객,아티스트 마이페이지
	@RequestMapping("mypageForm.do")
	public ModelAndView mypageForm() {
		ArtistVO avo=(ArtistVO) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		//System.out.println(avo==null);
		if(avo.getCheckDate() == null) {
		return new ModelAndView("member/user/memberMypage.tiles");	
		}else {
		return new ModelAndView("member/artist/artistMypage.tiles");	
			
		}
	}
	
	/**
	 * 회원가입 선택[관객 or 아티스트] 
	 * @return
	 */
	@RequestMapping("choiceMember.do")
	public String choiceMember() {
		return "member/choiceMember";
	}
	
	/**
	 * 회원가입[관객] - 진용현
	 * @param memberVO
	 * @return
	 */
	@PostMapping("registerMember.do")
	public String registerMember(MemberVO mvo,HttpServletRequest request) {
		FileUploadBean fileUploadBean = new FileUploadBean();
		fileUploadBean.profileUpload(mvo, request);
		memberService.registerMember(mvo);
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
		ArtistVO artistVO = memberService.findMemberById(id);
		String check = "id_ok";
		if(artistVO != null) {
			check ="id_fail";
		}
		return check;
	}	
	
	/**
	 * 닉네임 중복검사 - 진용현
	 * @param nickName
	 * @return
	 */
	@ResponseBody
	@RequestMapping("nickNameCheck.do")
	public int nickName(String nickName) {
		return memberService.nickNameCheck(nickName);
	}
	
	/**
	 * 회원가입폼[아티스트] - 진용현
	 * @return
	 */
	@RequestMapping("registerArtistForm.do")
	public String registerMemberArtist() {
		return "member/artist/registerArtistForm.tiles";
	}
	
	/**
	 * 회원가입[아티스트] - 진용현
	 * @param memberVO
	 * @param artistVO
	 * @return
	 */
	@PostMapping("registerArtist.do")
	public String registerArtist(MemberVO memberVO,ArtistVO artistVO,HttpServletRequest request) {
		FileUploadBean fileUploadBean = new FileUploadBean();
		fileUploadBean.profileUpload(memberVO, request);
		artistVO.setMemberVO(memberVO);
		memberService.registerArtist(artistVO);
		return "index.tiles";
	}
	
}
