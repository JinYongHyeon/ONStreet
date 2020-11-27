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
}
