package org.kosta.onstreet.model.mapper;

import java.util.ArrayList;
import java.util.List;
import java.util.Set;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.kosta.onstreet.model.PagingBean;
import org.kosta.onstreet.model.vo.ArtistVO;
import org.kosta.onstreet.model.vo.CommentVO;
import org.kosta.onstreet.model.vo.EventVO;
import org.kosta.onstreet.model.vo.LikeVO;
import org.kosta.onstreet.model.vo.MemberVO;
import org.kosta.onstreet.model.vo.NoticeVO;
import org.kosta.onstreet.model.vo.ShowVO;


@Mapper
public interface BoardMapper {
	
	/**
	 * 공지사항 리스트[페이징 카운트] - 김수민
	 * @return
	 */
	int getTotalNoticeCount();
	
	/**
	 * 공지사항 리스트 - 김수민
	 * @param pagingBean
	 * @return
	 */
   List<NoticeVO>  getNoticeList(PagingBean pagingBean);
   
   /**
    * 공지사항 상세보기 - 김수민
    * @param noticeNo
    * @return
    */
   NoticeVO getNoticeDetail(String noticeNo);
   
   /**
    * 공지사항 작성 - 김수민
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
   void deleteNotice(String noticeNo);
   
	/**
	 * 정지윤
	 * 아티스트 수 불러오고 리스트 불러오기
	 * @return
	 */
	int getTotalArtistCount();
	List<ArtistVO> getArtistList(PagingBean pagingBean);
	
	/**
	 * 정지윤
	 * 이벤트 리스트 불러오기
	 * @return
	 */
	int getTotalEventCount();
	List<EventVO> getEventList(PagingBean pagingBean);
	
	/**
	 * 정지윤
	 * 이벤트 상세정보 불러오기
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
	 * 공연 전체개수[페이징 카운트] - 이동욱
	 * @return
	 */
	int getTotalShowCount();

	/**
	 * 공연 전체 리스트 불러오기 - 이동욱
	 * @param pagingBean
	 * @return
	 */
	List<ShowVO> getShowList(PagingBean pagingBean);

	/**
	 * 공연 상세보기 - 이동욱
	 * @param showNo
	 * @return
	 */
	ShowVO getShowDetail(String showNo);
	
	/**
	 * 공연 등록 - 이동욱
	 * @param showVO
	 */
	void addShow(ShowVO showVO);

	/**
	 * 공연 수정 - 이동욱
	 * @param showVO
	 */
	void updateShow(ShowVO showVO);

	/**
	 * 공연 삭제 - 이동욱 
	 * @param showNo
	 */
	void deleteShow(String showNo);
	
	/**
	 * 공연일자 유효일 구하기 - 이동욱
	 * @param showNo
	 * @return
	 */
	int getDateValidity(String showNo);
	
	/**
	 * 오늘의 공연 - 진용현
	 * @return
	 */
	public	List<ShowVO> todayShow();
	
	/**
	 * [공연]댓글 리스트 불러오기 - 이동욱
	 * @param showNo
	 * @param pagingBean
	 * @return
	 */
	List<CommentVO> getCommentList(@Param("showNo")String showNo,@Param("pagingBean")PagingBean pagingBean);

	/**
	 * [공연]댓글 게시물별 갯수 불러오기[페이징 카운트] - 이동욱
	 * @param showNo
	 * @return
	 */
	int getTotalCommentCount(String showNo);

	/**
	 * [공연]댓글 등록하기 - 이동욱
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
	 * [공연]좋아요 제거 -이동욱
	 * @param likeVO
	 */
	void minusLike(LikeVO likeVO);
	
	/**
	 * [공연]공연 테이블 좋아요 컬럼 - 1 - 이동욱
	 * @param showNo
	 */
	void minusLikeCol(String showNo);
	
	/**
	 * [공연]공연 테이블 좋아요 컬럼 - +1 - 이동욱
	 * @param showNo
	 */
	void addLikeCol(String showNo);
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
	 *  추천 아티스트 아이디 가져오기 - 진용현
	 * @return
	 */
	public List<String> getArtistRecommendation();
	
	/**
	 * 추천 아티스트 부족 시 사용되는 [전체 아티스트 조회] - 진용현
	 * @return
	 */
	public List<String> getArtistAll();
	
	/**
	 * 추천아티스트(닉네임,프로필 조회) - 진용현
	 * @param id
	 * @return
	 */
	public MemberVO getArtistRecommendationList(String id);
	
	/**
	 * 검색 아티스트[카운트] - 진용현
	 * @param artistName
	 * @return
	 */
	public int getSearchArtistTotalCount(String artistName);
	
	/**
	 * 검색 아티스트 - 진용현
	 * @param artistName
	 * @param pagingBean
	 * @return
	 */
	public List<ArtistVO> getSearchArtist(@Param("artistName") String artistName,@Param("pagingBean") PagingBean pagingBean);
	
	/**
	 * 검색 공연[카운트] - 진용현
	 * @param showTitle
	 * @return
	 */
	public int getSearchShowTotalCount(String showTitle);
	
	/**
	 * 검색 공연 - 진용현
	 * @param showTitle
	 * @param pagingBean
	 * @return
	 */
	public List<ShowVO> getSearchShow(@Param("showTitle")String showTitle,@Param("pagingBean") PagingBean pagingBean);

	
	/**
	 * 공지사항 리스트(공연일정 상단에) - 이동욱
	 * @return
	 */
	public ArrayList<NoticeVO> getNoticeListForShowList();
}
