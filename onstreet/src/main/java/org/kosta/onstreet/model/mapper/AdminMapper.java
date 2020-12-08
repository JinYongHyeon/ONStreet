package org.kosta.onstreet.model.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.kosta.onstreet.model.PagingBean;
import org.kosta.onstreet.model.vo.ArtistVO;
import org.kosta.onstreet.model.vo.AuthVO;
import org.kosta.onstreet.model.vo.EventVO;
import org.kosta.onstreet.model.vo.ShowVO;

@Mapper
public interface AdminMapper {
	/**
	 * 정지윤
	 * 회원 수 불러오고 리스트 불러오기
	 * @return
	 */
	int getTotalMemberCount();
	List<AuthVO> getManageMemberList(@Param("authName")String authName,@Param("pagingBean")PagingBean pagingBean);
	List<AuthVO> getManageMemberArtistList(@Param("authName")String authName,@Param("pagingBean")PagingBean pagingBean);
	
	/**
	 * 정지윤
	 * 미승인 아티스트 리스트 불러오기
	 */
	int getTotalCheckArtist();
	List<ArtistVO> getCheckArtistList(PagingBean pagingBean);
	
	/**
	 * 정지윤
	 * 아티스트 승인
	 */
	public int checkArtist(String id);
	
	/**
	 * 정지윤
	 * 미승인 이벤트 리스트 불러오기
	 */
	int getTotalCheckEvent();
	List<EventVO> getCheckEventList(PagingBean pagingBean);
	
	/**
	 * 정지윤
	 * 이벤트 승인
	 */
	public int checkEvent(String eventNo);
	
	/**
	 * 정지윤
	 * 게시된 이벤트 리스트 불러오기
	 */
	int manageEventListCount();
	List<EventVO> manageEventList(PagingBean pagingBean);
	
	/**
	 * 정지윤
	 * 이벤트 삭제
	 */
	public int deleteEvent(String eventNo);
}
