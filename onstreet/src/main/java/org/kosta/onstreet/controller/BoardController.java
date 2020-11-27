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
}
