package org.kosta.onstreet.controller;


import javax.annotation.Resource;

import org.kosta.onstreet.model.service.BoardService;
import org.kosta.onstreet.model.vo.MemberVO;
import org.kosta.onstreet.model.vo.NoticeVO;
import org.springframework.security.access.annotation.Secured;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

@Controller
public class BoardController {
	@Resource
	private BoardService boardService;
	/**
	 * 공지사항리스트-김수민
	 * 
	 * @return
	 */
	@Secured("ROLE_MEMBER")
	@RequestMapping("getNoticeList.do")
public ModelAndView getNoticeList(String pageNo) {
		ModelAndView mv=new ModelAndView();
		mv.setViewName("board/notice/noticeList.tiles");
		mv.addObject("lvo",boardService.getNoticeList(pageNo));
	return mv;
	
}
	@Secured("ROLE_MEMBER")
@RequestMapping("getNoticeDetail.do")
public ModelAndView getNoticeDetail(String noticeNo){
		ModelAndView mv=new ModelAndView();
		mv.setViewName("board/notice/noticeDetail.tiles");
		mv.addObject("nvo",boardService.getNoticeDetail(noticeNo));
	return mv;
	}
	@GetMapping("addNoticeForm.do")
	public String addNoticeForm() {
		return "board/notice/noticeRegister.tiles";
	}
	@Secured("ROLE_MEMBER")
	@PostMapping("addNotice.do")
public String addNotice(NoticeVO noticeVO,RedirectAttributes ra) {
	  boardService.addNotice(noticeVO);
	  ra.addAttribute("noticeVO",noticeVO.getNoticeNo());
		return "board/notice/noticeList.tiles";
	}
	/**
	 * 정지윤
	 * 아티스트 리스트 메서드
	 * @return
	 */
	@Secured("ROLE_MEMBER")
	@RequestMapping("getArtistList.do")
	public ModelAndView getArtistList(String pageNo) {
		return new ModelAndView("board/artist/artistList.tiles","artistVO",boardService.getArtistList(pageNo));
	}
	
	/**
	 * 정지윤
	 * 이벤트 리스트 메서드
	 * @param pageNo
	 * @return
	 */
	@Secured("ROLE_MEMBER")
	@RequestMapping("getEventList.do")
	public ModelAndView getEventList(String pageNo) {
		return new ModelAndView("board/event/eventList.tiles","eventVO",boardService.getEventList(pageNo));
	}
	
	/**
	 * 정지윤
	 * 이벤트 상세보기 메서드
	 * @param pageNo
	 * @return
	 */
	@RequestMapping("getEventDetail.do")
	public String getArtistDetail(String eventNo,Model model) {
		model.addAttribute("eventVO", boardService.findEventByNo(eventNo));
		return "board/event/eventDetail.tiles";
	}

	// 이동욱 시작
	// 전체리스트 보여준는 메서드
	@Secured("ROLE_MEMBER")
	@RequestMapping("getShowList.do")
	public ModelAndView getShowList(String pageNo) {
		ModelAndView mv = new ModelAndView();
		mv.setViewName("board/show/showList.tiles");
		mv.addObject("slvo",boardService.getShowList(pageNo));
		mv.addObject("totalPostCount",boardService.getTotalShowCount());
		return mv;
	}
	// 공연상세보기 메서드
	@Secured("ROLE_MEMBER")
	@RequestMapping("getShowDetail.do")
	public ModelAndView getShowDetail(String showNo,String pageNo) {
		ModelAndView mv = new ModelAndView();
		mv.setViewName("board/show/showDetail.tiles");
		mv.addObject("svo", boardService.getShowDetail(showNo));
		mv.addObject("clvo", boardService.getCommentList(showNo,pageNo));
		return mv;
	}
	
}
