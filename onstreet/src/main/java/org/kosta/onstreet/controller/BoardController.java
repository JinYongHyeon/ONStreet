package org.kosta.onstreet.controller;

import javax.annotation.Resource;

import org.kosta.onstreet.model.service.BoardService;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class BoardController {
	@Resource

	private BoardService boardService;
	
	@RequestMapping("getArtistList.do")
	public ModelAndView getArtistList() {
		return new ModelAndView("board/artist/artistList","artistVO",boardService.getArtistList());
	}

	// 이동욱 시작
	// 전체리스트 보여준는 메서드
	@RequestMapping("getShowList.do")
	public ModelAndView getShowList(String pageNo) {
		return new ModelAndView("board/show/showList.tiles","slvo",boardService.getShowList(pageNo));

	}
}
