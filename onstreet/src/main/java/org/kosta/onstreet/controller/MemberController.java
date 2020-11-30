package org.kosta.onstreet.controller;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.kosta.onstreet.model.FileUploadBean;
import org.kosta.onstreet.model.service.MemberService;
import org.kosta.onstreet.model.vo.ArtistVO;
import org.kosta.onstreet.model.vo.MemberVO;
import org.springframework.security.access.annotation.Secured;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class MemberController {
	
	@Resource
	private MemberService memberService;
	
	/**
	 * 회원가입폼[관객] - 진용현
	 * @return
	 */
	@RequestMapping("registerMemberForm.do")
	public String registerMemberForm() {

		return "member/user/registerMemberForm.tiles";
	}
	
	/**
	 * 로그인 실패 - 진용현
	 * @return
	 */
	@RequestMapping("login_fail.do")
	public String loginFail() {
		return "member/login-fail";
	}
	
	//세희시작 //관객,아티스트 마이페이지
	@RequestMapping("mypageForm.do")
	public ModelAndView mypageForm() {
		ArtistVO avo=(ArtistVO) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		//System.out.println(avo==null);
		if(avo.getCheckDate() == null) {
		return new ModelAndView("member/user/memberMypage.tiles");	
		}else {
		return new ModelAndView("member/artist/artistMypage.tiles");	
			
		}
	}
	
	/**
	 * 회원가입 선택[관객 or 아티스트] 
	 * @return
	 */
	@RequestMapping("choiceMember.do")
	public String choiceMember() {
		return "member/choiceMember.tiles";
	}
	
	/**
	 * 회원가입[관객] - 진용현
	 * @param memberVO
	 * @return
	 */
	@PostMapping("registerMember.do")
	public String registerMember(MemberVO mvo,HttpServletRequest request) {
		FileUploadBean fileUploadBean = new FileUploadBean();
		mvo.setProfile(System.currentTimeMillis()+mvo.getProfileFile().getOriginalFilename());
		fileUploadBean.profileUpload(mvo, request);
		memberService.registerMember(mvo);
		return "index.tiles";
	}
	
	/**
	 * 아이디 중복검사 - 진용현
	 * @param id
	 * @return
	 */
	@ResponseBody
	@RequestMapping("idCheck.do")
	public String idCheck(String id) {
		ArtistVO artistVO = memberService.findMemberById(id);
		String check = "id_ok";
		if(artistVO != null) {
			check ="id_fail";
		}
		return check;
	}	
	
	/**
	 * 닉네임 중복검사 - 진용현
	 * @param nickName
	 * @return
	 */
	@ResponseBody
	@RequestMapping("nickNameCheck.do")
	public int nickName(String nickName) {
		return memberService.nickNameCheck(nickName);
	}
	
	/**
	 * 회원가입폼[아티스트] - 진용현
	 * @return
	 */
	@RequestMapping("registerArtistForm.do")
	public String registerMemberArtist() {
		return "member/artist/registerArtistForm.tiles";
	}
	
	/**
	 * 회원가입[아티스트] - 진용현
	 * @param memberVO
	 * @param artistVO
	 * @return
	 */
	@PostMapping("registerArtist.do")
	public String registerArtist(MemberVO memberVO,ArtistVO artistVO,HttpServletRequest request) {
		FileUploadBean fileUploadBean = new FileUploadBean();
		memberVO.setProfile(System.currentTimeMillis()+memberVO.getProfileFile().getOriginalFilename());
		fileUploadBean.profileUpload(memberVO, request);
		artistVO.setMemberVO(memberVO);
		memberService.registerArtist(artistVO);
		return "index.tiles";
	}
	
	/**
	 * 이용약관 - 진용현
	 * @param url
	 * @param model
	 * @return
	 */
	@RequestMapping("checkDocument.do")
	public String checkDocument(String url,Model model) {
		model.addAttribute("url", url);
		return "member/checkDocument.tiles";
	}
	
	/**
	 * 회원수정폼[관객] - 진용현
	 * @return
	 */
	@Secured("ROLE_MEMBER")
	@RequestMapping("updateMemberForm.do")
	public String updateMemberForm() {
		return "member/user/updateMemberForm.tiles";
	}

	/**
	 * 정지윤
	 * 아티스트 상세정보 불러오기
	 */
	@RequestMapping("getArtistDetail.do")
	public String getArtistDetail(String id,Model model) {
		model.addAttribute("artistVO", memberService.findMemberById(id));
		return "board/artist/artistDetail.tiles";
	}
}
