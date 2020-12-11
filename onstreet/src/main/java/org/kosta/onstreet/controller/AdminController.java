package org.kosta.onstreet.controller;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.kosta.onstreet.model.service.AdminService;
import org.kosta.onstreet.model.service.BoardService;
import org.kosta.onstreet.model.vo.MemberListVO;
import org.kosta.onstreet.model.vo.ShowListVO;
import org.springframework.security.access.annotation.Secured;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
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
	 * 탈퇴 회원 관리 폼
	 */
	@Secured("ROLE_ADMIN")
	@RequestMapping("getRemoveMemberListForm.do")
	public ModelAndView getRemoveMemberListForm(String pageNo) {
		return new ModelAndView("member/admin/manageRemoveMember.tiles", "authVO", adminService.getRemoveMemberList(pageNo));
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
	 * 회원 검색
	 */
	@Secured("ROLE_ADMIN")
	@RequestMapping("manageSearchMember.do")
	public String manageSearchMember(String searchMember, String pageNo, Model model) {
		MemberListVO memberListVO = adminService.manageSearchMember(pageNo, searchMember.trim());
	    model.addAttribute("authVO", memberListVO);
	    model.addAttribute("searchMember", searchMember);
	    model.addAttribute("totalMemberCount", adminService.manageSearchMemberTotalCount(searchMember));
	    return "member/admin/manageMember.tiles";
	    }
	
	/**
	 * 정지윤
	 * 탈퇴 회원 검색
	 */
	@Secured("ROLE_ADMIN")
	@RequestMapping("manageSearchRemoveMember.do")
	public String manageSearchRemoveMember(String searchRemoveMember, String pageNo, Model model) {
		MemberListVO memberListVO = adminService.manageSearchRemoveMember(pageNo, searchRemoveMember.trim());
	    model.addAttribute("authVO", memberListVO);
	    model.addAttribute("searchRemoveMember", searchRemoveMember);
	    model.addAttribute("totalMemberCount", adminService.manageSearchRemoveMemberTotalCount(searchRemoveMember));
	    return "member/admin/manageRemoveMember.tiles";
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
		mv.addObject("showListVO", boardService.getShowList(pageNo));
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
	 * 공연 검색
	 */
	@Secured("ROLE_ADMIN")
	@RequestMapping("manageSearchShow.do")
	public String manageSearchShow(String searchShow, String pageNo, Model model) {
		ShowListVO showListVO = adminService.manageSearchShow(pageNo, searchShow.trim());
		System.out.println(showListVO);
	    model.addAttribute("showListVO", showListVO);
	    model.addAttribute("searchContent", searchShow);
	    model.addAttribute("totalPostCount", adminService.manageSearchShowTotalCount(searchShow));
	    return "member/admin/manageShow.tiles";
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
	 * 아티스트 반려
	 */
	@Secured("ROLE_ADMIN")
	@PostMapping("uncheckArtist.do")
	public String uncheckArtist(String[] checkArtist) {
		adminService.uncheckArtist(checkArtist);
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
	
	/**
	 * 정지윤
	 * 이벤트 반려
	 */
	@Secured("ROLE_ADMIN")
	@PostMapping("uncheckEvent.do")
	public String uncheckEvent(String[] checkEvent) {
		adminService.uncheckEvent(checkEvent);
		return "redirect:getCheckEventList.do";
	}
	
	/**
	 * 정지윤
	 * 게시된 이벤트 리스트 불러오기
	 */
	@Secured("ROLE_ADMIN")
	@RequestMapping("manageEventList.do")
	public ModelAndView manageEventList(String pageNo) {
		return new ModelAndView("member/admin/manageEventDelete.tiles","eventVO",adminService.manageEventList(pageNo));
	}
	
	/**
	 * 정지윤
	 * 이벤트 삭제
	 */
	@Secured("ROLE_ADMIN")
	@PostMapping("deleteEvent.do")
	public String deleteEvent(String[] deleteEvent) {
		adminService.deleteEvent(deleteEvent);
		return "redirect:manageEventList.do";
	}
	/**
	 * 정세희
	 * 반려된 이벤트삭제 
	 */
	@Secured("ROLE_ARTIST")
	@PostMapping("deleteEvent2.do")
	public ModelAndView uncheckDeleteEvent(String[] checkboxBtn) {
		System.out.println(checkboxBtn);
		adminService.deleteEvent(checkboxBtn);
		return new  ModelAndView("redirect:artistCheckEventList.do");
	}
	
	
}
