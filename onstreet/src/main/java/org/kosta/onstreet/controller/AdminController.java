package org.kosta.onstreet.controller;

import javax.annotation.Resource;

import org.kosta.onstreet.model.service.AdminService;
import org.springframework.security.access.annotation.Secured;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class AdminController {
	@Resource
	private AdminService adminService;
	
	/**
	 * 정지윤
	 * 관리자 페이지 폼
	 */
	@Secured("ROLE_ADMIN")
	@RequestMapping("adminPageForm.do")
	public String adminPageForm() {
		return "member/admin/manageForm.tiles";
	}
}
