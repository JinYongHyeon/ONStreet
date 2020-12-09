package org.kosta.onstreet.model.service;


import java.util.ArrayList;
import java.util.List;
import java.util.Set;

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


public interface BoardService {
	
	/**
	 * 공지사항 리스트 불러오기 - 김수민
	 * @param pageNo
	 * @return
	 */
    NoticeListVO getNoticeList(String pageNo);
    
    /**
     * 공지사항 총합게시물[페이징 카운트] - 김수민
     * @return
     */
    int getTotalNoticeCount();
    
    /**
     * 공지사항 상세정보 - 김수민
     * @param noticeNo
     * @return
     */
    NoticeVO getNoticeDetail(String noticeNo);
    
    /**
     * 공지사항 등록 - 김수민
     * @param noticeVO
     */
    void addNotice(NoticeVO noticeVO);
    
    /**
     * 공지사항 수정 - 김수민
     * @param noticeVO
     */
    void updateNotice(NoticeVO noticeVO);
    
    /**
     * 공지사항 삭제 - 김수민
     * @param noticeNo
     */
    void deleteNotice(String[] noticeNo);

	/**
	 * 정지윤
	 * 아티스트 리스트 불러오기
	 */
	ArtistListVO getArtistList(String pageNo);
	
	/**
	 * 정지윤
	 * 이벤트 리스트 불러오기
	 * @return
	 */
	EventListVO getEventList(String pageNo);
	/**
	 * 정지윤
	 * 이벤트 상세보기 불러오기
	 * @return
	 */
	EventVO findEventByNo(String eventNo);
	/**
	 * 정지윤
	 * 이벤트 등록
	 * @return
	 */
	void addEvent(EventVO eventVO);

	/**
	 * 전체 공연리스트 불러오기 - 이동욱
	 * @param pageNo
	 * @return
	 */
	ShowListVO getShowList(String pageNo);

	/**
	 * 전체공연 갯수 불러오기[페이징 카운트] - 이동욱
	 * @return
	 */
	int getTotalShowCount();

	/**
	 * 공연일정 상세보기 - 이동욱
	 * @param showNo
	 * @return
	 */
	ShowVO getShowDetail(String showNo);

	/**
	 * 공연일정 등록 - 이동욱
	 * @param showVO
	 */
	void addShow(ShowVO showVO);

	/**
	 * 공연일정 수정 - 이동욱
	 * @param showVO
	 */
	void updateShow(ShowVO showVO);
	
	/**
	 * 공연 삭제 - 이동욱
	 * @param showNo
	 */
	void deleteShow(String showNo);
	
	/**
	 * 공연일자 유효일 구하기  - 이동욱
	 * @param showNo
	 * @return
	 */
	int getDateValidity(String showNo);
	
	/**
	 * [메인]오늘의 공연 - 진용현
	 * @return
	 */
	Set<ShowVO> todayShow();

	/**
	 * [공연] 댓글 리스트 불러오기 - 이동욱
	 * @param showNo
	 * @param PageNo
	 * @return
	 */
	CommentListVO getCommentList(String showNo,String PageNo);

	/**
	 * [공연]댓글 게시물별 갯수 불러오기[페이징 카운트] - 이동욱
	 * @param showNo
	 * @return
	 */
	int getTotalCommnetCount(String showNo);

	/**
	 * [공연]댓글 작성 - 이동욱
	 * @param commentVO
	 */
	void addComment(CommentVO commentVO);

	/**
	 * [공연]댓글 수정 - 이동욱
	 * @param commentVO
	 */
	void updateComment(CommentVO commentVO);

	/**
	 * [공연]댓글 삭제 - 이동욱
	 * @param commentNo
	 */
	void deleteComment(String commentNo);

	/**
	 * [공연]좋아요 추가 - 이동욱
	 * @param likeVO
	 */
	void addLike(LikeVO likeVO);

	/**
	 * [공연]좋아요 사람들 아이디 - 이동욱
	 * @param showNo
	 * @return
	 */
	ArrayList<String> getLikeListByShowNo(String showNo);

	/**
	 * [공연]좋아요 유무 체크 - 이동욱
	 * @param likeVO
	 * @return
	 */
	int likeCheck(LikeVO likeVO);

	/**
	 * [공연]좋아요 제거 - 이동욱
	 * @param likeVO
	 */
	void minusLike(LikeVO likeVO);

	/**
	 * [공연]좋아요 수 가져오기 - 이동욱
	 * @param showNo
	 * @return
	 */
	int getLikeCount(String showNo);
	
	/**
	 * [공연]오늘날짜 가져오기 - 이동욱
	 * @return
	 */
	String getToday();
	
	/**
	 * 추천아티스트 - 진용현 
	 * 1.평균 아티스트 리스트 불러오기 
	 * 2.만약 평균 아티스트 리스트 목록이 9명이 안될경우 전체 아티스트에서 가져옴(랜덤)
	 * 3.전체 아티스트가 9명이 안될경우 전체 아티스트 최대치가 max로 변경 
	 * @return
	 */
	List<MemberVO> getArtistRecommendation();
	
	/**
	 * 아티스트 검색 - 진용현
	 * @param nowPage
	 * @param artistName
	 * @return
	 */
		ArtistListVO getSearchArtist(String nowPage, String artistName);
	
	/**
	 * 공연 검색[카운트] - 진용현
	 * @param showTitle
	 * @return
	 */
	int getSearchShowTotalCount(String showTitle);
	
	/**
	 * 공연 검색 - 진용현
	 * @param nowPage
	 * @param showTitle
	 * @return
	 */
	ShowListVO getSearchShow(String nowPage, String showTitle);
	


}

