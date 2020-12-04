package org.kosta.onstreet.controller;

import javax.annotation.Resource;

import org.kosta.onstreet.model.service.AdminService;
import org.kosta.onstreet.model.service.BoardService;
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
	private BoardService boardService;
	
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
	 * 회원관리 폼
	 */
	@Secured("ROLE_ADMIN")
	@RequestMapping("manageMemberArtistForm.do")
	public ModelAndView getMemberArtistList(String pageNo) {
		return new ModelAndView("member/admin/manageMemberArtist.tiles", "authVO", adminService.getMemberArtistList(pageNo));
	}
	
	/**
	 * 정지윤
	 * 회원관리 (회원탈퇴)
	 */
	@Secured("ROLE_ADMIN")
	@RequestMapping("manageMember.do")
	public String removeMember(String[] checkMember) {
		adminService.manageMember(checkMember);
		return "redirect:manageMemberForm.do";
	}
	
	/**
	 * 정지윤
	 * 게시물관리 폼
	 */
	@Secured("ROLE_ADMIN")
	@RequestMapping("getManageShowList.do")
	public ModelAndView getShowList(String pageNo) {
		ModelAndView mv = new ModelAndView();
		mv.setViewName("member/admin/manageShow.tiles");
		mv.addObject("slvo", boardService.getShowList(pageNo));
		mv.addObject("totalPostCount", boardService.getTotalShowCount());
		return mv;
	}
}
