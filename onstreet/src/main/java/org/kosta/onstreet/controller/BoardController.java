package org.kosta.onstreet.controller;


import javax.annotation.Resource;

import org.kosta.onstreet.model.service.BoardService;
import org.springframework.security.access.annotation.Secured;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

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
	//끝
	
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
	public ModelAndView getShowDetail(String showNo) {
		ModelAndView mv = new ModelAndView();
		mv.setViewName("board/show/showDetail.tiles");
		mv.addObject("svo", boardService.getShowDetail(showNo));
		return mv;
	}
}
