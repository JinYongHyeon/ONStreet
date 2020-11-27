package org.kosta.onstreet.controller;

import java.security.Principal;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.kosta.onstreet.model.service.MemberService;
import org.kosta.onstreet.model.vo.ArtistVO;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class MemberController {
	
	@Resource
	private MemberService memberService;
	
	@RequestMapping("registerMemberForm.do")
	public String registerMemberForm() {
		return "member/user/registerMemberForm";
	}
	
	/**
	 * 로그인 실패
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
}
