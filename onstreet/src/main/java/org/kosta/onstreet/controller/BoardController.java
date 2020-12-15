package org.kosta.onstreet.controller;

import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.kosta.onstreet.model.FileUploadBean;
import org.kosta.onstreet.model.service.BoardService;
import org.kosta.onstreet.model.vo.ArtistListVO;
import org.kosta.onstreet.model.vo.ArtistVO;
import org.kosta.onstreet.model.vo.CommentVO;
import org.kosta.onstreet.model.vo.EventVO;
import org.kosta.onstreet.model.vo.LikeVO;
import org.kosta.onstreet.model.vo.MemberVO;
import org.kosta.onstreet.model.vo.NoticeVO;
import org.kosta.onstreet.model.vo.ShowListVO;
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
		mv.addObject("totalNoticePostCount", boardService.getTotalNoticeCount());
		return mv;
   }

   /**
    * 공지사항 상세보기 - 김수민
    * 
    * @param noticeNo
    * @return
    */
   @Secured("ROLE_MEMBER")
   @RequestMapping("getNoticeDetail.do")
   public ModelAndView getNoticeDetail(String noticeNo) {
      ModelAndView mv = new ModelAndView();
      mv.setViewName("board/notice/noticeDetail.tiles");
      mv.addObject("nvo", boardService.getNoticeDetail(noticeNo));
      return mv;
   }

   /**
    * 공지사항 등록폼 - 김수민
    * 
    * @return
    */
   @GetMapping("addNoticeForm.do")
   public String addNoticeForm() {
      return "board/notice/noticeRegister.tiles";
   }

   /**
    * 공지사항 등록 - 김수민
    * 
    * @param noticeVO
    * @param ra
    * @return
    */
   @Secured("ROLE_MEMBER")
   @PostMapping("addNotice.do")
   public String addNotice(NoticeVO noticeVO, RedirectAttributes ra) {
      ArtistVO avo = (ArtistVO) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
      noticeVO.setMemberVO(avo.getMemberVO());
      boardService.addNotice(noticeVO);
      ra.addAttribute("nvo", noticeVO.getNoticeNo());
      return "redirect:getNoticeList.do";
   }

   /**
    * 공지사항 수정폼 - 김수민
    * 
    * @param noticeNo
    * @return
    */
   @GetMapping("updateNoticeForm.do")
   public ModelAndView updateNoticeForm(String noticeNo) {
      ModelAndView mv = new ModelAndView();
      mv.setViewName("board/notice/noticeUpdate.tiles");
      mv.addObject("nvo", noticeNo);
      return mv;
   }

   /**
    * 공지사항 수정 - 김수민
    * 
    * @param noticeVO
    * @param ra
    * @return
    */
   @Secured("ROLE_MEMBER")
   @PostMapping("updateNotice.do")
   public String updateNotice(NoticeVO noticeVO, RedirectAttributes ra) {
      ArtistVO avo = (ArtistVO) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
      noticeVO.setMemberVO(avo.getMemberVO());
      boardService.updateNotice(noticeVO);
      ra.addAttribute("nvo", noticeVO.getNoticeNo());
      return "redirect:getNoticeList.do?noticeNo=" + noticeVO.getNoticeNo();
   }

   /**
    * 공지사항 삭제 - 김수민
    * 
    * @param noticeNo
    * @return
    */
   @Secured("ROLE_ADMIN")
   @PostMapping("deleteNotice.do")
   public String deleteNotice(String[] noticeNo) {
      boardService.deleteNotice(noticeNo);
      return "redirect:getNoticeList.do";
   }

   /**
    * 정지윤 
    * 아티스트 리스트 메서드
    * @return
    */
   @Secured("ROLE_MEMBER")
   @RequestMapping("getArtistList.do")
   public ModelAndView getArtistList(String pageNo) {
      return new ModelAndView("board/artist/artistList.tiles", "artistVO", boardService.getArtistList(pageNo));
   }

   /**
    * 정지윤 
    * 이벤트 리스트 메서드
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
    * 정지윤 이벤트 등록
    * 
    * @param pageNo
    * @return
    */
   @Secured("ROLE_ARTIST")
   @RequestMapping("addEventForm.do")
   public String addEventForm() {
      return "board/event/eventRegister.tiles";
   }

	/**
	 * 정지윤 이벤트 등록
	 * @param eventVO
	 * @param request
	 * @return
	 */
	@Secured("ROLE_ARTIST")
	@PostMapping("addEvent.do")
	public String addEvent(EventVO eventVO, HttpServletRequest request) {

      ArtistVO artistVO = (ArtistVO) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
      FileUploadBean eventFileUploadBean = new FileUploadBean();
      eventVO.setArtistVO(artistVO);
      if (!eventVO.getEventImageFile().getOriginalFilename().equals(""))
         eventVO.setEventImage(System.currentTimeMillis() + eventVO.getEventImageFile().getOriginalFilename()
               .substring(eventVO.getEventImageFile().getOriginalFilename().indexOf(".")));
      eventFileUploadBean.eventBannerUpload(eventVO, request);

      boardService.addEvent(eventVO);
      return "redirect:checkWaitEvent.do?eventNo=" + eventVO.getEventNo();
   }

	
	/**
	 * 정지윤 
	 * 이벤트 등록 폼
	 * @param pageNo
	 * @return
	 */
	@Secured("ROLE_ARTIST")
	@RequestMapping("checkWaitEvent.do")
	public String checkWaitEvent() {
		return "board/event/checkWaitEvent.tiles";
	}

	/**
	 * 공연 리스트 - 이동욱
	 * 
	 * @param pageNo
	 * @return
	 */
	@Secured("ROLE_MEMBER")
	@RequestMapping("getShowList.do")
	public ModelAndView getShowList(String pageNo) {
		ModelAndView mv = new ModelAndView();
		mv.setViewName("board/show/showList.tiles");
		mv.addObject("slvo", boardService.getShowList(pageNo));
		mv.addObject("totalPostCount", boardService.getTotalShowCount());
		mv.addObject("nlvo", boardService.getNoticeListForShowList());
		mv.addObject("totalNoticePostCount", boardService.getTotalNoticeCount());
		return mv;
	}

   /**
    * 공연 상세보기 - 이동욱
    * 
    * @param showNo
    * @param pageNo
    * @return
    */
   @Secured("ROLE_MEMBER")
   @RequestMapping("getShowDetail.do")
   public ModelAndView getShowDetail(String showNo, String pageNo) {
	  ModelAndView mv = new ModelAndView();
	  mv.setViewName("board/show/showDetail.tiles");
      mv.addObject("svo", boardService.getShowDetail(showNo));
      mv.addObject("clvo", boardService.getCommentList(showNo, pageNo));
      mv.addObject("likeId", boardService.getLikeListByShowNo(showNo));
      mv.addObject("likeCount", (boardService.getLikeCount(showNo)) / 2);
      mv.addObject("validity", boardService.getDateValidity(showNo));
      return mv;
   }

   /**
    * 공연등록폼 - 이동욱
    * 
    * @param model
    * @return
    */
   @Secured("ROLE_ARTIST")
   @RequestMapping("addShowForm.do")
   public String addShowForm(Model model) {
      model.addAttribute("today", boardService.getToday());
      return "board/show/showRegister.tiles";
   }

   /**
    * 공연 등록 - 이동욱
    * 
    * @param showVO
    * @param ra
    * @return
    */
   @Secured("ROLE_ARTIST")
   @PostMapping("addShow.do")
   public String addShow(ShowVO showVO, RedirectAttributes ra) {
      ArtistVO avo = (ArtistVO) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
      showVO.setArtistVO(avo);
      boardService.addShow(showVO);
      ra.addAttribute("showNo", showVO.getShowNo());
      return "redirect:getShowDetail.do";
   }

   /**
    * 공연수정폼 - 이동욱
    * 
    * @param showNo
    * @param model
    * @return
    */
   @Secured("ROLE_ARTIST")
   @RequestMapping("updateShowForm.do")
   public String updateForm(String showNo, Model model) {
      model.addAttribute("svo", boardService.getShowDetail(showNo));
      return "board/show/showUpdate.tiles";
   }

   /**
    * 공연수정 - 이동욱
    * 
    * @param showVO
    * @param ra
    * @return
    */
   @Secured("ROLE_ARTIST")
   @PostMapping("updateShow.do")
   public String updateShow(ShowVO showVO, RedirectAttributes ra) {
      boardService.updateShow(showVO);
      ra.addAttribute("showNo", showVO.getShowNo());
      return "redirect:getShowDetail.do";
   }

   /**
    * 공연삭제 - 이동욱
    * 
    * @param showNo
    * @return
    */
   @Secured("ROLE_ARTIST")
   @PostMapping("deleteShow.do")
   public String deleteShow(String showNo) {
      boardService.deleteShow(showNo);
      return "redirect:home.do";
   }

   /**
    * [공연]댓글 작성 - 이동욱
    * 
    * @param showVO
    * @param commentVO
    * @return
    */
   @Secured("ROLE_MEMBER")
   @PostMapping("addComment.do")
   public String addComment(ShowVO showVO, CommentVO commentVO) {
      ArtistVO avo = (ArtistVO) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
      commentVO.setShowVO(showVO);
      commentVO.setMemberVO(avo.getMemberVO());
      boardService.addComment(commentVO);
      return "redirect:getShowDetail.do?showNo=" + showVO.getShowNo();
   }

   /**
    * [공연]댓글 수정폼(Ajax) - 이동욱
    * @param showNo
    * @param commentNo
    * @param countNo
    * @return
    */
   @Secured("ROLE_MEMBER")
   @ResponseBody
   @RequestMapping("commentUpdateForm.do")
   public ArrayList<String> commentUpdateForm(String showNo, String commentNo, int countNo) {
      ArrayList<String> list = new ArrayList<String>();
      list.add(showNo);
      list.add(commentNo);
      list.add(countNo + "");
      return list;
   }

	/**
	 * [공연]댓글 수정 - 이동욱
	 * @param showNo
	 * @param commentVO
	 * @param ra
	 * @return
	 */
	@Secured("ROLE_MEMBER")
	@ResponseBody
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


   /**
    * 댓글 삭제 - 이동욱
    * @param commentNo
    * @param showNo
    * @param ra
    * @return
    */
   @Secured("ROLE_MEMBER")
   @PostMapping("deleteComment.do")
   public String deleteComment(String commentNo, String showNo, RedirectAttributes ra) {
      boardService.deleteComment(commentNo);
      ra.addAttribute("showNo", showNo);
      return "redirect:getShowDetail.do";
   }
   
   /**
    * [공연]좋아요 - 이동욱
    * @param likeVO
    * @param id
    * @param ra
    * @return
    */
   @Secured("ROLE_MEMBER")
   @ResponseBody
   @PostMapping("addLike.do")
   public String addLike(LikeVO likeVO, String id, RedirectAttributes ra) {
      MemberVO mvo = new MemberVO();
      mvo.setId(id);
      likeVO.setMemberVO(mvo);
      int likeCheck = boardService.likeCheck(likeVO);
      ra.addAttribute("showNo", likeVO.getshowNo());
      if (likeCheck == 1) {
         boardService.minusLike(likeVO);
         return "1";
      } else {
         boardService.addLike(likeVO);
         return "0";
      }
   }

   /**
    * [공연]멀티 이미지 업로드 - 진용현
    * 
    * @param files
    * @param request
    * @return
    */
   @ResponseBody
   @RequestMapping("fileupload.do")
   public ArrayList<String> file_uploader_html5(List<MultipartFile> files, MultipartHttpServletRequest request) {
      FileUploadBean fileUploadBean = new FileUploadBean();
      return fileUploadBean.multipartImgUpload(files, request);
   }


   /**
    * 아티스트 검색 - 진용현
    * 
    * @param searchContent
    * @param nowPage
    * @param model
    * @return
    */
   @Secured("ROLE_MEMBER")
   @RequestMapping("getAristSearchList.do")
   public String getSearchList(String searchContent, String pageNo, Model model) {
      ArtistListVO artistList = boardService.getSearchArtist(pageNo, searchContent.trim());
      model.addAttribute("artistVO", artistList);
      model.addAttribute("searchContent", searchContent);
      return "board/artist/artistList.tiles";

   }

   /**
    * 공연 검색 - 진용현
    * 
    * @return
    */
   @Secured("ROLE_MEMBER")
   @RequestMapping("getShowSearchList.do")
   public String getSearchShow(String searchContent, String pageNo, Model model) {
      ShowListVO showListVO = boardService.getSearchShow(pageNo, searchContent.trim());
      model.addAttribute("slvo", showListVO);
      model.addAttribute("searchContent", searchContent);
      model.addAttribute("totalPostCount", boardService.getSearchShowTotalCount(searchContent));
      return "board/show/showList.tiles";
   }
}