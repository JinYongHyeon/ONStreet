package org.kosta.onstreet.controller;

import javax.annotation.Resource;

import org.kosta.onstreet.model.service.AdminService;
import org.kosta.onstreet.model.service.MemberService;
import org.kosta.onstreet.model.vo.ArtistVO;
import org.springframework.security.access.annotation.Secured;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class AdminController {
	@Resource
	private AdminService adminService;
	@Resource
	private MemberService memberService;
	
	/**
	 * 정지윤
	 * 관리자 페이지 폼
	 */
	@Secured("ROLE_ADMIN")
	@RequestMapping("adminPageForm.do")
	public String adminPageForm() {
		return "member/admin/manageForm.tiles";
	}
	
	/**
	 * 정지윤
	 * 회원관리 폼
	 */
	@Secured("ROLE_ADMIN")
	@RequestMapping("manageMemberForm.do")
	public ModelAndView getMemberList(String pageNo) {
		return new ModelAndView("member/admin/manageMember.tiles", "authVO", adminService.getMemberList(pageNo));
	}
	
	/**
	 * 정지윤
	 * 회원관리 (회원탈퇴)
	 */
	@Secured("ROLE_ADMIN")
	@ResponseBody
	@RequestMapping("manageMember.do")
	public int removeMember(String password) {
		ArtistVO artistVO=(ArtistVO) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		int pointcount=memberService.removeMember(password,artistVO);
			return pointcount;
	}
}
