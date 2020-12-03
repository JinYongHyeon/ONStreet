package org.kosta.onstreet.model.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.kosta.onstreet.model.PagingBean;
import org.kosta.onstreet.model.vo.ArtistVO;
import org.kosta.onstreet.model.vo.CommentVO;
import org.kosta.onstreet.model.vo.EventVO;
import org.kosta.onstreet.model.vo.NoticeListVO;
import org.kosta.onstreet.model.vo.NoticeVO;
import org.kosta.onstreet.model.vo.ShowVO;


@Mapper
public interface BoardMapper {

	int getTotalNoticeCount();
   List<NoticeVO>  getNoticeList(PagingBean pagingBean);//공지사항 리스트 김수민
   NoticeVO getNoticeDetail(String noticeNo);//공지사항 상세보기 :김수민
   void addNotice(NoticeVO noticeVO);//공지사항 작성 :김수민
   void updateNotice(NoticeVO noticeVO);//공지사항수정:김수민
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

	//이동욱 시작
	//공연일정글 전체개수 불러오는 메서드
	int getTotalShowCount();
	//공연일정 전체 리스트 불러오는 메서드
	List<ShowVO> getShowList(PagingBean pagingBean);

	// 공연일정 상세보기
	ShowVO getShowDetail(String showNo);
	// 댓글 리스트 불러오기
	List<CommentVO> getCommentList(@Param("showNo")String showNo,@Param("pagingBean")PagingBean pagingBean);
	// 댓글 총갯수 가져오기(페이징에 필요)
	int getTotalCommentCount(String showNo);
	// 댓글 등록하기
	void addComment(CommentVO commentVO);
	// 공연일정등록하기
	void addShow(ShowVO showVO);
	// 공연일정 업데이트
	void updateShow(ShowVO showVO);
	// 공연삭제
	void deleteShow(String showNo);
	
	/**
	 * 오늘의 공연 - 진용현
	 * @return
	 */
	public	List<ShowVO> todayShow();
}
