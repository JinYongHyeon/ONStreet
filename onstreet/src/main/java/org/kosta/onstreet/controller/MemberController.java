package org.kosta.onstreet.controller;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.kosta.onstreet.model.FileUploadBean;
import org.kosta.onstreet.model.service.MemberService;
import org.kosta.onstreet.model.vo.ArtistVO;
import org.kosta.onstreet.model.vo.FollowVO;
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
	 * 회원가입 선택[관객 or 아티스트]  - 진용현
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
		if(!mvo.getProfileFile().getOriginalFilename().equals(""))
		mvo.setProfile(System.currentTimeMillis()+mvo.getProfileFile().getOriginalFilename().substring(mvo.getProfileFile().getOriginalFilename().indexOf(".")));
		fileUploadBean.profileUpload(mvo, request);
		memberService.registerMember(mvo);
		return "redirect:registerMemberResult.do";
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
	//회원탈퇴폼으로 보내는메서드 정세희
	@Secured("ROLE_MEMBER")
	@RequestMapping("removeMemberForm.do")
	public ModelAndView removeMemberForm() {
		return new ModelAndView("member/user/removeMemberForm.tiles");
	}
	
	//회원탈퇴 메서드 정세희
	@Secured("ROLE_MEMBER")
	@ResponseBody
	@PostMapping("removeMember.do")
	public int removeMember(String password) {
		ArtistVO avo=(ArtistVO) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		int pointcount=memberService.removeMember(password,avo);
			return pointcount;
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
		if(!memberVO.getProfileFile().getOriginalFilename().equals(""))
		memberVO.setProfile(System.currentTimeMillis()+memberVO.getProfileFile().getOriginalFilename().substring(memberVO.getProfileFile().getOriginalFilename().indexOf(".")));
		fileUploadBean.profileUpload(memberVO, request);
		artistVO.setMemberVO(memberVO);
		memberService.registerArtist(artistVO);
		return "redirect:registerArtistResult.do";
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
	 * 회원수정폼[아티스트] - 진용현
	 * @return
	 */
	@Secured("ROLE_ARTIST")
	@RequestMapping("updateArtistForm.do")
	public String updateArtistForm() {
		return "member/artist/updateArtistForm.tiles";
	}

	/**
	 * 정지윤
	 * 아티스트 상세정보 불러오기
	 */
	@Secured("ROLE_MEMBER")
	@RequestMapping("getArtistDetail.do")
	public String getArtistDetail(String id,Model model) {
		model.addAttribute("artistVO", memberService.findMemberById(id));
		model.addAttribute("map", memberService.getArtistTemperture(id));
		return "board/artist/artistDetail.tiles";
	}
	
	/**
	 * 정지윤
	 * 팔로잉 등록
	 */
	@Secured("ROLE_MEMBER")
	@ResponseBody
	@RequestMapping("registerFollowing.do")
	public int registerFollowing(FollowVO followVO) {
		int count = memberService.registerFollowing(followVO);
		return count;
	}
	
	/**
	 * 회원수정[관객] - 진용현
	 * @param memberVO
	 * @param request
	 * @return
	 */
	@Secured("ROLE_MEMBER")
	@RequestMapping("updateMember.do")
	public String updateMember(MemberVO memberVO,HttpServletRequest request) {
		FileUploadBean fileaUploadBean = new FileUploadBean();
		if(!memberVO.getProfileFile().getOriginalFilename().equals(""))
		memberVO.setProfile(System.currentTimeMillis()+memberVO.getProfileFile().getOriginalFilename().substring(memberVO.getProfileFile().getOriginalFilename().indexOf(".")));
		fileaUploadBean.profileUpload(memberVO, request);
		memberService.updateMember(memberVO);
		
		ArtistVO avo=(ArtistVO) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		if(memberVO.getProfileFile().getOriginalFilename().equals(""))memberVO.setProfile(avo.getMemberVO().getProfile());
		avo.setMemberVO(memberVO);
		return "redirect:mypageForm.do";
	}
	
	
	
	
	
		
	
	/**
	 * 회원가입완료[아티스트] - 진용현
	 * @return
	 */
	@RequestMapping("registerMemberResult.do")
	public String registerMemberResult() {
		return "member/user/registerMemberResult.tiles";
	}
	
	/**
	 * 회원가입완료[아티스트] - 진용현
	 * @return
	 */
	@RequestMapping("registerArtistResult.do")
	public String registerArtistResult() {
		return "member/artist/registerArtistResult.tiles";
	}
	
	/**
	 * 회원수정[아티스트] - 진용현
	 * @return
	 */
	@Secured("ROLE_ARTIST")
	@PostMapping("updateArtist.do")
	public String updateArtist(MemberVO memberVO,ArtistVO artistVO,HttpServletRequest request) {
		FileUploadBean fileaUploadBean = new FileUploadBean();
		if(!memberVO.getProfileFile().getOriginalFilename().equals(""))
		memberVO.setProfile(System.currentTimeMillis()+memberVO.getProfileFile().getOriginalFilename().substring(memberVO.getProfileFile().getOriginalFilename().indexOf(".")));
		fileaUploadBean.profileUpload(memberVO, request);
		artistVO.setMemberVO(memberVO);
		memberService.updateArtist(artistVO);
		
		ArtistVO avo=(ArtistVO) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		if(artistVO.getMemberVO().getProfileFile().getOriginalFilename().equals(""))artistVO.getMemberVO().setProfile(avo.getMemberVO().getProfile());
		if(artistVO.getSns() != null)
			avo.setSns(artistVO.getSns());
		if(artistVO.getAccount() != null)
			avo.setAccount(artistVO.getAccount());
		avo.setArtistInfo(artistVO.getArtistInfo());
		avo.setMemberVO(artistVO.getMemberVO());
		
		return "redirect:mypageForm.do";
	}
	
	//팔로우리스트 불러오기 정세희 
	@Secured("ROLE_MEMBER")
	@RequestMapping("followingList.do")
	public ModelAndView getfollowingList(String pageNo) {
		ArtistVO avo=(ArtistVO) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		String id=avo.getMemberVO().getId();
		ModelAndView mv=new ModelAndView();
		return new ModelAndView("member/user/followingList.tiles","list",memberService.getfollowingList(id,pageNo));
	}
	
	
	//팔로우 선택 삭제 정세희
	@Secured("ROLE_MEMBER")
	@PostMapping("removeFollowing.do")
	public ModelAndView removeFollowing(FollowVO fvo) {
		System.out.println(fvo);
		memberService.removeFollowing(fvo);
		return new ModelAndView("redirect:followingList.do");
		
	}
	
	//이벤트승인현황 정세희
	@Secured("ROLE_MEMBER")
	@RequestMapping("artistCheckEventList.do")
	public ModelAndView artistCheckEventList(String pageNo) {
		System.out.println(pageNo);
		ArtistVO avo=(ArtistVO) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		String id=avo.getMemberVO().getId();
		return new ModelAndView("member/artist/artistCheckEventList.tiles","eventVO",memberService.artistCheckEventList(id,pageNo));
	}
	
	
}
