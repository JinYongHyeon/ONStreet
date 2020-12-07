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
import org.kosta.onstreet.model.vo.MemberVO;
import org.kosta.onstreet.model.vo.NoticeListVO;
import org.kosta.onstreet.model.vo.NoticeVO;
import org.kosta.onstreet.model.vo.ShowListVO;
import org.kosta.onstreet.model.vo.ShowVO;


public interface BoardService {
    NoticeListVO getNoticeList(String pageNo);//공지사항리스트 -김수민
    int getTotalNoticeCount();//공지사항리스트 총합-김수민
    NoticeVO getNoticeDetail(String noticeNo);//공지사항 상세정보-김수민 
    void addNotice(NoticeVO noticeVO);//공지사항등록-김수민
    void updateNotice(NoticeVO noticeVO);//공지사항수정-김수민
    void deleteNotice(String[] noticeNo);//공지사항삭제-김수민
	// 이동욱 시작
	// 공연일정 리스트 메서드
	ShowListVO getShowList(String pageNo);
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

	// 전체공연 갯수 불러오기(페이징에 필요)
	int getTotalShowCount();
	// 공연일정 상세보기
	ShowVO getShowDetail(String showNo);
	// 댓글 리스트 불러오기
	CommentListVO getCommentList(String showNo,String PageNo);
	// 댓글 총개수 불러오기
	int getTotalCommnetCount(String showNo);
	// 댓글작성
	void addComment(CommentVO commentVO);
	// 공연일정 등록
	void addShow(ShowVO showVO);
	// 공연일정 업데이트
	void updateShow(ShowVO showVO);
	// 공연삭제 
	void deleteShow(String showNo);
	
	Set<ShowVO> todayShow();
	// 댓글 수정
	void updateComment(CommentVO commentVO);
	// 댓글 삭제
	void deleteComment(String commentNo);
	// 좋아요 추가
	void addLike(LikeVO likeVO);
	// 좋아요한 사람들 아이디리스트
	ArrayList<String> getLikeListByShowNo(String showNo);
	// 좋아요 유무 체크
	int likeCheck(LikeVO likeVO);
	// 좋아요 제거
	void minusLike(LikeVO likeVO);

	List<MemberVO> getArtistRecommendation();
	// 좋아요 수 가져오기
	int getLikeCount(String showNo);
	// 공연일자 유효일 구하기
	int getDateValidity(String showNo);
}

