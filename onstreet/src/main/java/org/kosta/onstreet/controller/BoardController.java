package org.kosta.onstreet.controller;

import javax.annotation.Resource;

import org.kosta.onstreet.model.service.BoardService;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class BoardController {
	@Resource
	BoardService boardService;
	@RequestMapping("getShowList.do")
	public String getShowList() {
		
		return "board/show/showList.tiles";
	}
}
