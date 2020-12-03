package org.kosta.onstreet.model.service;


import javax.annotation.Resource;

import org.kosta.onstreet.model.PagingBean;
import org.kosta.onstreet.model.mapper.BoardMapper;
import org.kosta.onstreet.model.vo.ArtistListVO;
import org.kosta.onstreet.model.vo.CommentListVO;
import org.kosta.onstreet.model.vo.CommentVO;
import org.kosta.onstreet.model.vo.EventListVO;
import org.kosta.onstreet.model.vo.EventVO;
import org.kosta.onstreet.model.vo.NoticeListVO;
import org.kosta.onstreet.model.vo.NoticeVO;
import org.kosta.onstreet.model.vo.ShowListVO;
import org.kosta.onstreet.model.vo.ShowVO;
import org.springframework.stereotype.Service;

@Service
public class BoardServiceImpl implements BoardService {

	@Resource
private BoardMapper boardMapper;

	//김수민시작
	//공지사항리스트불러오기
	@Override
	public NoticeListVO getNoticeList(String pageNo) {
		int totalNoticeCount=boardMapper.getTotalNoticeCount();
		PagingBean pagingBean=null;
		if(pageNo==null) {
			pagingBean=new PagingBean(totalNoticeCount);
		}else {
			pagingBean=new PagingBean(totalNoticeCount,Integer.parseInt(pageNo));
		}
		NoticeListVO  list=new NoticeListVO(boardMapper.getNoticeList(pagingBean),pagingBean);
		return list;
	}
	//공지사항 상세사항:김수민
	@Override
	public NoticeVO getNoticeDetail(String noticeNo) {
		return boardMapper.getNoticeDetail(noticeNo);
	}
	//공지사항 등록:김수민
	@Override
	public void addNotice(NoticeVO noticeVO) {
		boardMapper.addNotice(noticeVO);
	}
	//공지사항 수정 :김수민
	public void updateNotice(NoticeVO noticeVO) {
		boardMapper.updateNotice(noticeVO);
	}
	//공지사항 삭제:김수민
	public void deleteNotice(String noticeNo) {
		boardMapper.deleteNotice(noticeNo);
	}
	/**
	 * 정지윤
	 * 아티스트 리스트 불러오기
	 */
	@Override
	public ArtistListVO getArtistList(String pageNo) {
		int artistTotalCount = boardMapper.getTotalArtistCount();
		PagingBean pagingBean = null;
		if(pageNo==null)
			pagingBean = new PagingBean(artistTotalCount);
		else
			pagingBean = new PagingBean(artistTotalCount,Integer.parseInt(pageNo));
		ArtistListVO artistListVO = new ArtistListVO(boardMapper.getArtistList(pagingBean),pagingBean);
		return artistListVO;
	}
	
	/**
	 * 정지윤
	 * 이벤트 리스트 불러오기
	 */
	@Override
	public EventListVO getEventList(String pageNo) {
		int eventTotalCount = boardMapper.getTotalEventCount();
		PagingBean pagingBean = null;
		if(pageNo==null)
			pagingBean = new PagingBean(eventTotalCount);
		else
			pagingBean = new PagingBean(eventTotalCount,Integer.parseInt(pageNo));
		EventListVO eventListVO = new EventListVO(boardMapper.getEventList(pagingBean),pagingBean);
		return eventListVO;
	}
	
	/**
	 * 정지윤
	 * 이벤트 상세보기 불러오기
	 */
	@Override
	public EventVO findEventByNo(String eventNo) {
		return boardMapper.findEventByNo(eventNo);
	}
	
	/**
	 * 정지윤
	 * 이벤트 등록
	 */
	@Override
	public void addEvent(EventVO eventVO) {
		if(eventVO.getEventImageFile().getOriginalFilename().equals(""))
			eventVO.setEventImage(eventVO.getEventImageFile().getOriginalFilename());
		boardMapper.addEvent(eventVO);
	}

	//이동욱시작
	//전체리스트 불러오는 메서드
	@Override
	public ShowListVO getShowList(String pageNo) {
		int showTotalCount = boardMapper.getTotalShowCount();
		PagingBean pagingBean = null;
		if(pageNo==null)
			pagingBean = new PagingBean(showTotalCount);
		else 
			pagingBean	=new PagingBean(showTotalCount, Integer.parseInt(pageNo));
		ShowListVO showListVO =new ShowListVO(boardMapper.getShowList(pagingBean),pagingBean);
		return showListVO;
	}
	// 전체공연 갯수 불러오기(페이징에 필요)
	@Override
	public int getTotalShowCount() {
		return boardMapper.getTotalShowCount();
	}
	// 공연일정 상세보기
	@Override
	public ShowVO getShowDetail(String showNo) {
		return boardMapper.getShowDetail(showNo);
	}
	//공지사항 총합게시물 :김수민
	@Override
	public int getTotalNoticeCount() {
		return boardMapper.getTotalNoticeCount();
	}
	// 댓글 리스트 불러오기
	@Override
	public CommentListVO getCommentList(String showNo, String pageNo) {
		int commentTotalCount = boardMapper.getTotalCommentCount(showNo);
		PagingBean pagingBean = null;
		if(pageNo==null)
			pagingBean = new PagingBean(commentTotalCount);
		else 
			pagingBean	=new PagingBean(commentTotalCount, Integer.parseInt(pageNo));
		CommentListVO commListVO =new CommentListVO(boardMapper.getCommentList(showNo, pagingBean),pagingBean);
		return commListVO;
	}
	// 댓글 게시물별 갯수불러오기
	@Override
	public int getTotalCommnetCount(String showNo) {
		return boardMapper.getTotalCommentCount(showNo);
	}
	// 댓글등록하기
	@Override
	public void addComment(CommentVO commentVO) {
		boardMapper.addComment(commentVO);
	}
	// 공연일정 등록하기
	@Override
	public void addShow(ShowVO showVO) {
		boardMapper.addShow(showVO);
	}
	// 공연일정 업데이트
	@Override
	public void updateShow(ShowVO showVO) {
		boardMapper.updateShow(showVO);
	}
	// 공연삭제 메서드
	@Override
	public void deleteShow(String showNo) {
		boardMapper.deleteShow(showNo);
	}
}
