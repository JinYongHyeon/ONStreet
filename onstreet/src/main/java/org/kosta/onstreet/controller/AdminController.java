package org.kosta.onstreet.controller;

import javax.annotation.Resource;

import org.kosta.onstreet.model.service.AdminService;
import org.kosta.onstreet.model.service.BoardService;
import org.springframework.security.access.annotation.Secured;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
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
	
	/**
	 * 정지윤
	 * 게시물 삭제
	 */
	@Secured("ROLE_ADMIN")
	@PostMapping("manageShow.do")
	public String manageShow(String[] checkShow) {
		adminService.manageShow(checkShow);
		return "redirect:getManageShowList.do";
	}
	
	/**
	 * 정지윤
	 * 아티스트 승인 폼
	 */
	@Secured("ROLE_ADMIN")
	@RequestMapping("getCheckArtistList.do")
	public ModelAndView getCheckArtistList(String pageNo) {
		return new ModelAndView("member/admin/manageArtist.tiles","artistVO",adminService.getCheckArtistList(pageNo));
	}
	
	/**
	 * 정지윤
	 * 아티스트 승인
	 */
	@Secured("ROLE_ADMIN")
	@PostMapping("checkArtist.do")
	public String checkArtist(String[] checkArtist) {
		adminService.checkArtist(checkArtist);
		return "redirect:getCheckArtistList.do";
	}
	
	/**
	 * 정지윤
	 * 이벤트 승인 폼
	 */
	@Secured("ROLE_ADMIN")
	@RequestMapping("getCheckEventList.do")
	public ModelAndView getCheckEventList(String pageNo) {
		return new ModelAndView("member/admin/manageEvent.tiles","eventVO",adminService.getCheckEventList(pageNo));
	}
	
	/**
	 * 정지윤
	 * 이벤트 승인
	 */
	@Secured("ROLE_ADMIN")
	@PostMapping("checkEvent.do")
	public String checkEvent(String[] checkEvent) {
		adminService.checkEvent(checkEvent);
		return "redirect:getCheckEventList.do";
	}
}
