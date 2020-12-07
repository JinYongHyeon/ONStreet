package org.kosta.onstreet.controller;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.kosta.onstreet.model.FileUploadBean;
import org.kosta.onstreet.model.service.BoardService;
import org.kosta.onstreet.model.vo.ArtistVO;
import org.kosta.onstreet.model.vo.CommentVO;
import org.kosta.onstreet.model.vo.EventVO;
import org.kosta.onstreet.model.vo.LikeVO;
import org.kosta.onstreet.model.vo.MemberVO;
import org.kosta.onstreet.model.vo.NoticeVO;
import org.kosta.onstreet.model.vo.ShowVO;
import org.springframework.security.access.annotation.Secured;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

@Controller
public class BoardController {
	@Resource
	private BoardService boardService;

	/**
	 * 공지사항리스트-김수민
	 * 
	 * @return
	 */
	@Secured("ROLE_MEMBER")
	@RequestMapping("getNoticeList.do")
	public ModelAndView getNoticeList(String pageNo) {
		ModelAndView mv = new ModelAndView();
		mv.setViewName("board/notice/noticeList.tiles");
		mv.addObject("lvo", boardService.getNoticeList(pageNo));
		return mv;

	}

	// 공지사항 상세보기:김수민
	@Secured("ROLE_MEMBER")
	@RequestMapping("getNoticeDetail.do")
	public ModelAndView getNoticeDetail(String noticeNo) {
		ModelAndView mv = new ModelAndView();
		mv.setViewName("board/notice/noticeDetail.tiles");
		mv.addObject("nvo", boardService.getNoticeDetail(noticeNo));
		return mv;
	}

	// 공지사항등록폼:김수민
	@GetMapping("addNoticeForm.do")
	public String addNoticeForm() {
		return "board/notice/noticeRegister.tiles";
	}

	// 공지사항등록:김수민
	@Secured("ROLE_MEMBER")
	@PostMapping("addNotice.do")
public String addNotice(NoticeVO noticeVO,RedirectAttributes ra) {
		ArtistVO avo = (ArtistVO)SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		noticeVO.setMemberVO(avo.getMemberVO());
		boardService.addNotice(noticeVO);
	  ra.addAttribute("nvo",noticeVO.getNoticeNo());
	  //System.out.println(noticeVO);
		return "redirect:getNoticeList.do";
	}
	//공지사항수정폼:김수민
	@GetMapping("updateNoticeForm.do")
	public ModelAndView updateNoticeForm(String noticeNo) {
		ModelAndView mv=new ModelAndView();
		mv.setViewName("board/notice/noticeUpdate.tiles");
		mv.addObject("nvo",noticeNo);
		//System.out.println(noticeNo);
		return mv;
	}
	//공지사항 수정:김수민
	@Secured("ROLE_MEMBER")
	@PostMapping("updateNotice.do")
	public String updateNotice(NoticeVO noticeVO,RedirectAttributes ra) {
		ArtistVO avo = (ArtistVO)SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		noticeVO.setMemberVO(avo.getMemberVO());
		boardService.updateNotice(noticeVO);
		ra.addAttribute("nvo",noticeVO.getNoticeNo());
		//System.out.println(noticeVO);
		return "redirect:getNoticeList.do?noticeNo="+noticeVO.getNoticeNo();
	}
	//공지사항 삭제 :김수민
	@Secured("ROLE_MEMBER")
	@PostMapping("deleteNotice.do")
	public String deleteNotice(String[] noticeNo){
		boardService.deleteNotice(noticeNo);
		return "redirect:getNoticeList.do";
	}
	/**
	 * 정지윤 아티스트 리스트 메서드
	 * 
	 * @return
	 */
	@Secured("ROLE_MEMBER")
	@RequestMapping("getArtistList.do")
	public ModelAndView getArtistList(String pageNo) {
		return new ModelAndView("board/artist/artistList.tiles", "artistVO", boardService.getArtistList(pageNo));
	}

	/**
	 * 정지윤 이벤트 리스트 메서드
	 * 
	 * @param pageNo
	 * @return
	 */
	@Secured("ROLE_MEMBER")
	@RequestMapping("getEventList.do")
	public ModelAndView getEventList(String pageNo) {
		return new ModelAndView("board/event/eventList.tiles", "eventVO", boardService.getEventList(pageNo));
	}

	/**
	 * 정지윤 이벤트 상세보기 메서드
	 * 
	 * @param pageNo
	 * @return
	 */
	@Secured("ROLE_MEMBER")
	@RequestMapping("getEventDetail.do")
	public String getArtistDetail(String eventNo, Model model) {
		model.addAttribute("eventVO", boardService.findEventByNo(eventNo));
		return "board/event/eventDetail.tiles";
	}
	
	/**
	 * 정지윤
	 * 이벤트 등록
	 * @param pageNo
	 * @return
	 */
	@Secured("ROLE_ARTIST")
	@RequestMapping("addEventForm.do")
	public String addEventForm() {
		return "board/event/eventRegister.tiles";
	}
	
	@Secured("ROLE_ARTIST")
	@PostMapping("addEvent.do")
	public String addEvent(EventVO eventVO,HttpServletRequest request) {
		
		ArtistVO artistVO = (ArtistVO) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		FileUploadBean eventFileUploadBean = new FileUploadBean();
		eventVO.setArtistVO(artistVO);
		if(!eventVO.getEventImageFile().getOriginalFilename().equals(""))
		eventVO.setEventImage(System.currentTimeMillis()+eventVO.getEventImageFile().getOriginalFilename().substring(eventVO.getEventImageFile().getOriginalFilename().indexOf(".")));
		eventFileUploadBean.eventBannerUpload(eventVO, request);
		
		boardService.addEvent(eventVO);
		return "redirect:getEventDetail.do?eventNo="+eventVO.getEventNo();
	}

	// 이동욱 시작
	// 전체리스트 보여준는 메서드
	@Secured("ROLE_MEMBER")
	@RequestMapping("getShowList.do")
	public ModelAndView getShowList(String pageNo) {
		ModelAndView mv = new ModelAndView();
		mv.setViewName("board/show/showList.tiles");
		mv.addObject("slvo", boardService.getShowList(pageNo));
		mv.addObject("totalPostCount", boardService.getTotalShowCount());
		return mv;
	}

	// 공연상세보기 메서드
	@Secured("ROLE_MEMBER")
	@RequestMapping("getShowDetail.do")
	public ModelAndView getShowDetail(String showNo, String pageNo) {
		ModelAndView mv = new ModelAndView();
		mv.setViewName("board/show/showDetail.tiles");
		mv.addObject("svo", boardService.getShowDetail(showNo));
		mv.addObject("clvo", boardService.getCommentList(showNo, pageNo));
		mv.addObject("likeId",boardService.getLikeListByShowNo(showNo));
		mv.addObject("likeCount", (boardService.getLikeCount(showNo))/2);
		mv.addObject("validity", boardService.getDateValidity(showNo));
		return mv;
	}

	// 댓글 작성메서드
	@Secured("ROLE_MEMBER")
	@PostMapping("addComment.do")
	public String addComment(ShowVO showVO, CommentVO commentVO) {
		ArtistVO avo = (ArtistVO) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		commentVO.setShowVO(showVO);
		commentVO.setMemberVO(avo.getMemberVO());
		boardService.addComment(commentVO);
		return "redirect:getShowDetail.do?showNo=" + showVO.getShowNo();
	}

	// 공연일정 등록폼 메서드
	@Secured("ROLE_ARTIST")
	@RequestMapping("addShowForm.do")
	public String addShowForm() {
		return "board/show/showRegister.tiles";
	}

	// 공연일정등록 메서드
	@Secured("ROLE_ARTIST")
	@PostMapping("addShow.do")
	public String addShow(ShowVO showVO,RedirectAttributes ra) {
		ArtistVO avo = (ArtistVO) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		showVO.setArtistVO(avo);
		boardService.addShow(showVO);
		ra.addAttribute("showNo", showVO.getShowNo());
		return "redirect:getShowDetail.do";
	}
	
	/**
	 * 멀티 이미지 업로드 - 진용현
	 * @param files
	 * @param request
	 * @return
	 */
	@ResponseBody
	@RequestMapping("fileupload.do")
	public ArrayList<String>  file_uploader_html5(List<MultipartFile> files,MultipartHttpServletRequest request){
		FileUploadBean fileUploadBean = new FileUploadBean();
		return fileUploadBean.multipartImgUpload(files, request);
	}
	// 공연수정폼으로 가는 메서드
	@Secured("ROLE_ARTIST")
	@RequestMapping("updateShowForm.do")
	public String updateForm(String showNo, Model model) {
		model.addAttribute("svo", boardService.getShowDetail(showNo));
		return "board/show/showUpdate.tiles";
	}
	// 공연수정 하는 메서드
	@Secured("ROLE_ARTIST")
	@PostMapping("updateShow.do")
	public String updateShow(ShowVO showVO, RedirectAttributes ra) {
		boardService.updateShow(showVO);
		ra.addAttribute("showNo", showVO.getShowNo());
		return "redirect:getShowDetail.do";
	}
	// 공연삭제 메서드 
	@Secured("ROLE_ARTIST")
	@PostMapping("deleteShow.do")
	public String deleteShow(String showNo) {
		boardService.deleteShow(showNo);
		return "redirect:home.do";
	}
	// 공연댓글 수정 폼으로 가는 Ajax
	@Secured("ROLE_MEMBER")
	@ResponseBody
	@RequestMapping("commentUpdateForm.do")
	public ArrayList<String> commentUpdateForm(String showNo, String commentNo, int countNo) {
		ArrayList<String> list = new ArrayList<String>();
		list.add(showNo);
		list.add(commentNo);
		list.add(countNo+"");
		return list;
	}
	// 댓글수정메서드
	@Secured("ROLE_MEMBER")
	@PostMapping("updateComment.do")
	public String updateComment(String showNo, CommentVO commentVO, RedirectAttributes ra) {
		ArtistVO avo = (ArtistVO) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		ShowVO svo = new ShowVO();
		svo.setShowNo(showNo);
		commentVO.setShowVO(svo);
		commentVO.setMemberVO(avo.getMemberVO());
		boardService.updateComment(commentVO);
		ra.addAttribute("showNo", showNo);
		return "redirect:getShowDetail.do";
	}
	// 댓글삭제
	@Secured("ROLE_MEMBER")
	@PostMapping("deleteComment.do")
	public String deleteComment(String commentNo, String showNo, RedirectAttributes ra) {
		boardService.deleteComment(commentNo);
		ra.addAttribute("showNo", showNo);
		return "redirect:getShowDetail.do";
	}
	// 좋아요 
	@Secured("ROLE_MEMBER")
	@ResponseBody
	@PostMapping("addLike.do")
	public String addLike(LikeVO likeVO, String id, RedirectAttributes ra) {
		MemberVO mvo = new MemberVO();
		mvo.setId(id);
		likeVO.setMemberVO(mvo);
		int likeCheck = boardService.likeCheck(likeVO);
		ra.addAttribute("showNo", likeVO.getshowNo());
		if(likeCheck==1) {
			boardService.minusLike(likeVO);
			return "1";
		} else{
			boardService.addLike(likeVO);
			return "0";
		}
	}
}

