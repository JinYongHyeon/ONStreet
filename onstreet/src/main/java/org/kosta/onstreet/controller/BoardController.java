package org.kosta.onstreet.controller;

import java.io.File;
import java.io.FileOutputStream;
import java.io.InputStream;
import java.io.OutputStream;
import java.io.PrintWriter;
import java.text.SimpleDateFormat;
import java.util.UUID;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.kosta.onstreet.model.service.BoardService;
import org.kosta.onstreet.model.vo.ArtistVO;
import org.kosta.onstreet.model.vo.CommentVO;
import org.kosta.onstreet.model.vo.EventVO;
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
	public String addNotice(NoticeVO noticeVO, RedirectAttributes ra) {
		boardService.addNotice(noticeVO);
		ra.addAttribute("noticeVO", noticeVO.getNoticeNo());
		return "redirect:board/notice/noticeList.tiles";
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
	@RequestMapping("addEventForm.do")
	public String addEventForm() {
		return "board/event/eventRegister.tiles";
	}
	
	@PostMapping("addEvent.do")
	public String addEvent(EventVO eventVO) {
		ArtistVO artistVO = (ArtistVO) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		eventVO.setArtistVO(artistVO);
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
	
	@RequestMapping("fileupload.do")
	public void fileupload(HttpServletRequest request,HttpServletResponse response,MultipartFile multipartFile) {
		System.out.println("aaaaaaaaaaaaaaa");
				//파일정보
				String sFileInfo = "";
				//파일명을 받는다 - 일반 원본파일명
				String filename = request.getHeader("file-name");
				//파일 확장자
				String filename_ext = filename.substring(filename.lastIndexOf(".") + 1);
				//확장자를소문자로 변경
				filename_ext = filename_ext.toLowerCase();

				//이미지 검증 배열변수
				String[] allow_file = { "jpg","jpeg" ,"png", "bmp", "gif" };

				//돌리면서 확장자가 이미지인지 
				int cnt = 0;
				for (int i = 0; i < allow_file.length; i++) {
					if (filename_ext.equals(allow_file[i])) {
						cnt++;
					}
				}

				//이미지가 아님
				if (cnt == 0) {
					//out.println("NOTALLOW_" + filename);
				} else {
					//이미지이므로 신규 파일로 디렉토리 설정 및 업로드   
					//파일 기본경로
					String dftFilePath = request.getSession().getServletContext().getRealPath("/");
					//파일 기본경로 _ 상세경로
					String filePath = dftFilePath + "resources" + File.separator + "img" + File.separator + "content" + File.separator;
					String filePath2 =  "C:"+File.separator+"kosta203"+File.separator+"final-project"+File.separator+"ONStreet"+File.separator+"onstreet"+File.separator+"src"+File.separator+"main"+File.separator+"webapp"+File.separator+"resources"+File.separator+"img"+File.separator+"content"+File.separator;
					File file = new File(filePath);
					File file2 = new File(filePath2);
					if (!file.exists()) {
						file.mkdirs();
					}else if(!file2.exists()){
						file2.mkdirs();
					}
					String realFileNm = "";
					SimpleDateFormat formatter = new SimpleDateFormat("yyyyMMddHHmmss");
					String today = formatter.format(new java.util.Date());
					realFileNm = today + UUID.randomUUID().toString() + filename.substring(filename.lastIndexOf("."));
					String rlFileNm = filePath + realFileNm;
					String rlFileNm2 = filePath2 + realFileNm;
					///////////////// 서버에 파일쓰기 ///////////////// 
					InputStream is = null;
					OutputStream os = null;
					OutputStream os2 = null;
					try {
					is = request.getInputStream();
					os = new FileOutputStream(rlFileNm);
					os2 = new FileOutputStream(rlFileNm2);
					int numRead;
					byte b[] = new byte[Integer.parseInt(request.getHeader("file-size"))];
					while ((numRead = is.read(b, 0, b.length)) != -1) {
						os.write(b, 0, numRead);
				     	os2.write(b, 0, numRead);
					//System.out.println(filePath2);
					}
					}catch(Exception e) {
						e.printStackTrace();
					}finally {
						try {
						if (is != null) {
							is.close();
						}
						os.flush();
						os2.flush();
						os.close();
						os2.close();
						}catch(Exception e) {
							e.printStackTrace();
						}
					}
					///////////////// 서버에 파일쓰기 /////////////////

					// 정보 출력
					sFileInfo += "&bNewLine=true";	
					sFileInfo += "&sFileName=" + filename;	
					sFileInfo += "&sFileURL=/onstreet/resources/img/content/"+realFileNm;
					PrintWriter print = null;
					try {
					print = response.getWriter();
					print.print(sFileInfo);
					print.flush();
					print.close();
					//out.println(sFileInfo);
					}catch(Exception e) {
						e.printStackTrace();
					}
					}
	}

}

