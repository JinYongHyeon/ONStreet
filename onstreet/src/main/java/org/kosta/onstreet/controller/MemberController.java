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
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class MemberController {
	
	@Resource
	private MemberService memberService;
	
	/**
	 * 회원가입 이용약관 - 진용현
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
	 * 회원가입 선택[관객 or 아티스트]  - 진용현
	 * @return
	 */
	@RequestMapping("choiceMember.do")
	public String choiceMember() {
		return "member/choiceMember.tiles";
	}
	
	/**
	 * 회원가입폼[관객] - 진용현
	 * @return
	 */
	@RequestMapping("registerMemberForm.do")
	public String registerMemberForm() {

		return "member/user/registerMemberForm.tiles";
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
	 * 회원가입[관객] - 진용현
	 * @param memberVO
	 * @return
	 */
	@PostMapping("registerMember.do")
	public String registerMember(MemberVO mvo,HttpServletRequest request) {
		FileUploadBean fileUploadBean = new FileUploadBean();
		if(!mvo.getProfileFile().getOriginalFilename().equals(""))
		mvo.setProfile(System.currentTimeMillis()+mvo.getProfileFile().getOriginalFilename().substring(mvo.getProfileFile().getOriginalFilename().lastIndexOf(".")));
		fileUploadBean.profileUpload(mvo, request);
		memberService.registerMember(mvo);
		return "redirect:registerMemberResult.do";
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
		memberVO.setProfile(System.currentTimeMillis()+memberVO.getProfileFile().getOriginalFilename().substring(memberVO.getProfileFile().getOriginalFilename().lastIndexOf(".")));
		fileUploadBean.profileUpload(memberVO, request);
		artistVO.setMemberVO(memberVO);
		memberService.registerArtist(artistVO);
		return "redirect:registerArtistResult.do";
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
		memberVO.setProfile(System.currentTimeMillis()+memberVO.getProfileFile().getOriginalFilename().substring(memberVO.getProfileFile().getOriginalFilename().lastIndexOf(".")));
		fileaUploadBean.profileUpload(memberVO, request);
		memberService.updateMember(memberVO);
		
		ArtistVO avo=(ArtistVO) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		if(memberVO.getProfileFile().getOriginalFilename().equals(""))memberVO.setProfile(avo.getMemberVO().getProfile());
		avo.setMemberVO(memberVO);
		return "redirect:mypageForm.do";
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
		memberVO.setProfile(System.currentTimeMillis()+memberVO.getProfileFile().getOriginalFilename().substring(memberVO.getProfileFile().getOriginalFilename().lastIndexOf(".")));
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
	/**
	 * 회원수정 비밀번호폼 - 진용현
	 * @return
	 */
	@Secured("ROLE_MEMBER")
	@RequestMapping("updatePasswordForm.do")
	public String passwordUpdateForm() {
		return "member/passwordUpdateForm.tiles";
	}
	
	/**
	 * 회원수정 - 진용현
	 * @return
	 */
	@Secured("ROLE_MEMBER")
	@ResponseBody
	@RequestMapping(value = "updatePassword.do",method = RequestMethod.POST)
	public int updatePassword(String password,String passwordChange) {
		ArtistVO member =(ArtistVO)SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		return memberService.updatePassword(password, passwordChange, member);
	}

	/**
	 * 로그인 실패 - 진용현
	 * @return
	 */
	@RequestMapping("login_fail.do")
	public String loginFail() {
		return "member/login-fail";
	}
	
	
	
	/**
	 * 마이페이지[관객,아티스트] - 정세희
	 * @return
	 */
	@RequestMapping("mypageForm.do")
	public ModelAndView mypageForm() {
		ArtistVO avo=(ArtistVO) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		String id=avo.getMemberVO().getId();
		//System.out.println(avo==null);
		//관객마이페이지경로
		ModelAndView mv=new ModelAndView();
		if(avo.getCheckDate() == null) {
			mv.setViewName("member/user/memberMypage.tiles");
			return mv;
		}else {
		//아티스트마이페이지경로
			mv.addObject("map", memberService.getArtistTemperture(id));
			mv.addObject("followingTotalCount",memberService.followingTotalCount(id));
			mv.setViewName("member/artist/artistMypage.tiles");
			return mv;
		}
	}
	
	/**
	 * 회원탈퇴폼 - 정세희
	 * @return
	 */
	@Secured("ROLE_MEMBER")
	@RequestMapping("removeMemberForm.do")
	public ModelAndView removeMemberForm() {
		return new ModelAndView("member/user/removeMemberForm.tiles");
	}
	
	/**
	 * 회원탈퇴 - 정세희
	 * @param password
	 * @return
	 */
	@Secured("ROLE_MEMBER")
	@ResponseBody
	@PostMapping("removeMember.do")
	public int removeMember(String password) {
		ArtistVO avo=(ArtistVO) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		int pointcount=memberService.removeMember(password,avo);
		return pointcount;
		}
		
	/**
	 * 정지윤
	 * 아티스트 상세정보 불러오기
	 */
	@Secured("ROLE_MEMBER")
	@RequestMapping("getArtistDetail.do")
	public String getArtistDetail(String id,Model model) {
		ArtistVO avo=(ArtistVO) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		model.addAttribute("artistVO", memberService.findMemberById(id));
		model.addAttribute("map", memberService.getArtistTemperture(id));
		model.addAttribute("showVO", memberService.getArtistShowDate(id));
		model.addAttribute("count", memberService.follwingCheck(avo.getMemberVO(), id));
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
	 * 내 팔로우 리스트 - 정세희
	 * @param pageNo
	 * @return
	 */
	@Secured("ROLE_MEMBER")
	@RequestMapping("followingList.do")
	public ModelAndView getfollowingList(String pageNo) {
		ArtistVO avo=(ArtistVO) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		String id=avo.getMemberVO().getId();
		ModelAndView mv=new ModelAndView();
		return new ModelAndView("member/user/followingList.tiles","list",memberService.getfollowingList(id,pageNo));
	}
	
	
	/**
	 * 내 팔로우 삭제 - 정세희
	 * @param fvo
	 * @return
	 */
	@Secured("ROLE_MEMBER")
	@PostMapping("removeFollowing.do")
	public ModelAndView removeFollowing(String[] followingId) {
		memberService.removeFollowing(followingId);
		return new ModelAndView("redirect:followingList.do");
		
	}
	
	/**
	 * 이벤트 승인현황 - 정세희
	 * @param pageNo
	 * @return
	 */
	@Secured("ROLE_MEMBER")
	@RequestMapping("artistCheckEventList.do")
	public ModelAndView artistCheckEventList(String pageNo) {
		ArtistVO avo=(ArtistVO) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		String id=avo.getMemberVO().getId();
		return new ModelAndView("member/artist/artistCheckEventList.tiles","eventVO",memberService.artistCheckEventList(id,pageNo));
	}
	
	
}
