package org.kosta.onstreet.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class HomeController {

	@RequestMapping(value= {"home.do","/"})
	public String home() {
		return "index.tiles";
	}
	@RequestMapping("error.do")
	public String error() {
		return "/error/error";
	}
}
