package org.kosta.onstreet.controller;

import javax.annotation.Resource;

import org.kosta.onstreet.model.service.MemberService;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

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
	
}
