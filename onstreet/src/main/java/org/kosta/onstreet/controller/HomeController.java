package org.kosta.onstreet.controller;

import javax.annotation.Resource;

import org.kosta.onstreet.model.service.BoardService;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class HomeController {

	@Resource
	private BoardService boardService;
		
	@RequestMapping(value= {"home.do","/"})
	public String home(Model model){
		model.addAttribute("todayShow",boardService.todayShow());
		return "index.tiles";
	}
	@RequestMapping("error.do")
	public String error() {
		return "/error/error";
	}
	@RequestMapping("accessDeniedView.do")
	public String accessDeniedView() {
		return "error/accessDeniedView";
	}
}
