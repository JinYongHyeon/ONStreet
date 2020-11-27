package org.kosta.onstreet.controller;


import javax.annotation.Resource;

import org.kosta.onstreet.model.service.BoardService;
import org.springframework.stereotype.Controller;

@Controller
public class BoardController {
	@Resource
	private BoardService boardService;

}
