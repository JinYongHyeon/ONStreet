package org.kosta.onstreet.model.service;


import java.util.ArrayList;
import java.util.HashSet;
import java.util.Iterator;
import java.util.LinkedHashSet;
import java.util.List;
import java.util.Set;

import javax.annotation.Resource;

import org.kosta.onstreet.model.PagingBean;
import org.kosta.onstreet.model.mapper.BoardMapper;
import org.kosta.onstreet.model.vo.ArtistListVO;
import org.kosta.onstreet.model.vo.CommentListVO;
import org.kosta.onstreet.model.vo.CommentVO;
import org.kosta.onstreet.model.vo.EventListVO;
import org.kosta.onstreet.model.vo.EventVO;
import org.kosta.onstreet.model.vo.LikeVO;
import org.kosta.onstreet.model.vo.MemberListVO;
import org.kosta.onstreet.model.vo.MemberVO;
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
	public void deleteNotice(String[] noticeNo) {
       for(int i=0; i<noticeNo.length; i++) {
    	   //System.out.println(noticeNo[i]);
		boardMapper.deleteNotice(noticeNo[i]);
       }
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
	
	/**
	 * 오늘의 공연 - 진용현
	 */
	@Override
	public Set<ShowVO> todayShow() {
		List<ShowVO> list = boardMapper.todayShow();
		Set<ShowVO> set = new HashSet<ShowVO>();
		int max = 5;
		if(max>list.size())max=list.size();
		while(set.size() < max) {
			int num  = (int)(Math.floor(Math.random()*list.size()));
			set.add(list.get(num));
		}
		return set;
}
	// 댓글 수정
	@Override
	public void updateComment(CommentVO commentVO) {
		boardMapper.updateComment(commentVO);
	}
	// 댓글 삭제
	@Override
	public void deleteComment(String commentNo) {
		boardMapper.deleteComment(commentNo);
	}
	// 좋아요 추가
	@Override
	public void addLike(LikeVO likeVO) {
		boardMapper.addLike(likeVO);
		boardMapper.addLikeCol(likeVO.getshowNo());
	}
	// 좋아요한 사람들 아이디
	@Override
	public ArrayList<String> getLikeListByShowNo(String showNo) {
		return boardMapper.getLikeListByShowNo(showNo);
	}
	// 좋아요 유무 체크
	@Override
	public int likeCheck(LikeVO likeVO) {
		return boardMapper.likeCheck(likeVO);
	}
	// 좋아요 제거
	@Override
	public void minusLike(LikeVO likeVO) {
		boardMapper.minusLike(likeVO);
		boardMapper.minusLikeCol(likeVO.getshowNo());
	}
	// 좋아요 수 가져오기
	@Override
	public int getLikeCount(String showNo) {
		return boardMapper.getLikeCount(showNo);
	}
	// 공연일자 유효일 구하기
	@Override
	public int getDateValidity(String showNo) {
		return boardMapper.getDateValidity(showNo);
	}
	
	/**
	 * 추천아티스트 - 진용현 
	 * 1.평균 아티스트 리스트 불러오기 
	 * 2.만약 평균 아티스트 리스트 목록이 9명이 안될경우 전체 아티스트에서 가져옴(랜덤)
	 * 3.전체 아티스트가 9명이 안될경우 전체 아티스트 최대치가 max로 변경
	 */
	@Override
	public List<MemberVO> getArtistRecommendation() {
		List<String> artistIdList = boardMapper.getArtistRecommendation();
		List<MemberVO> artistList = new ArrayList<MemberVO>();
		int max= 9;
		if (artistIdList.size() < max) {
			LinkedHashSet<String> addArtistList = new LinkedHashSet<String>();
			// 추천 아티스트
			for (String id : artistIdList) {
				addArtistList.add(id);
			}//for

			List<String> artistAll = boardMapper.getArtistAll();
			//추천 아티스트 부족 시 전체 아티스트 랜덤추가
			if(max>artistAll.size())max=artistAll.size();
			while(addArtistList.size()<max) {
				addArtistList.add(artistAll.get((int)Math.floor(Math.random()*artistAll.size())));
			}//while
			Iterator<String> iterator = addArtistList.iterator();
			//추천 아티스트 가져오기
			while(iterator.hasNext()) {
				artistList.add(boardMapper.getArtistRecommendationList(iterator.next()));
			}
		}else {
			//추천 아티스트 가져오기
			for(String id : artistIdList) {
				artistList.add(boardMapper.getArtistRecommendationList(id));
			}
		}

		return artistList;
	}
	
	/**
	 * 아티스트 검색 - 진용현
	 */
	@Override
	public ArtistListVO getSearchArtist(String nowPage, String artistName) {
		int totalCount = boardMapper.getSearchArtistTotalCount(artistName);
		PagingBean pagingBean = null;
		if(nowPage != null) {
			pagingBean = new PagingBean(totalCount,Integer.parseInt(nowPage));
		}else {
			pagingBean = new PagingBean(totalCount);
		}
		ArtistListVO artistListVO = new ArtistListVO(boardMapper.getSearchArtist(artistName, pagingBean),pagingBean);
		return artistListVO;
	}
	
	/**
	 * 공연 검색[카운트] - 진용현
	 * @param showTitle
	 * @return
	 */
	@Override
	public int getSearchShowTotalCount(String showTitle) {
		return boardMapper.getSearchShowTotalCount(showTitle);
	}
	/**
	 * 공연 검색 - 진용현
	 * @param nowPage
	 * @param showTitle
	 * @return
	 */
	@Override
	public ShowListVO getSearchShow(String nowPage, String showTitle) {
		int totalCount = boardMapper.getSearchShowTotalCount(showTitle);
		PagingBean pagingBean = null;
		if(nowPage != null) {
			pagingBean = new PagingBean(totalCount,Integer.parseInt(nowPage));
		}else {
			pagingBean = new PagingBean(totalCount);
		}
			ShowListVO showListVO =  new ShowListVO(boardMapper.getSearchShow(showTitle, pagingBean),pagingBean);
		return showListVO;
	}
	
}
