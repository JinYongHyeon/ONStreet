package org.kosta.onstreet.model.service;

import org.kosta.onstreet.model.vo.ArtistListVO;
import org.kosta.onstreet.model.vo.EventListVO;
import org.kosta.onstreet.model.vo.MemberListVO;
import org.kosta.onstreet.model.vo.ShowListVO;

public interface AdminService {
	
	/**
	 * 정지윤
	 * 회원 관리 (회원 탈퇴)
	 * @param password
	 * @param artistVO
	 * @return
	 */
	void manageMember(String[] checkMember);
	
	/**
	 * 정지윤
	 * 회원 리스트 불러오기
	 */
	MemberListVO getMemberList(String pageNo);
	
	/**
	 * 정지윤
	 * 회원(ROLE_ARTIST) 리스트 불러오기
	 * @param pageNo
	 * @return
	 */
	MemberListVO getMemberArtistList(String pageNo);
	
	/**
	 * 정지윤
	 * 탈퇴 회원 리스트 불러오기
	 */
	MemberListVO getRemoveMemberList(String pageNo);
	
	/**
	 * 정지윤
	 * 회원 검색 카운트
	 */
	int manageSearchMemberTotalCount(String nickName);
	
	/**
	 * 정지윤
	 * 회원 검색
	 */
	MemberListVO manageSearchMember(String pageNo, String nickName);
	
	/**
	 * 정지윤
	 * 탈퇴 회원 검색 카운트
	 */
	int manageSearchRemoveMemberTotalCount(String nickName);
	
	/**
	 * 정지윤
	 * 탈퇴회원 검색
	 */
	MemberListVO manageSearchRemoveMember(String pageNo, String nickName);
	
	/**
	 * 정지윤
	 * 게시물 삭제
	 */
	void manageShow(String[] checkShow);
	
	/**
	 * 정지윤
	 * 공연 검색 카운트
	 */
	int manageSearchShowTotalCount(String showTitle);
	
	/**
	 * 정지윤
	 * 공연 검색
	 */
	ShowListVO manageSearchShow(String pageNo, String showTitle);
	
	/**
	 * 정지윤
	 * 미승인 아티스트 리스트 불러오기
	 */
	ArtistListVO getCheckArtistList(String pageNo);
	
	/**
	 * 정지윤
	 * 아티스트 승인
	 */
	void checkArtist(String[] checkArtist);
	
	/**
	 * 정지윤
	 * 아티스트 반려
	 */
	void uncheckArtist(String[] uncheckArtist);
	
	/**
	 * 정지윤
	 * 미승인 이벤트 리스트 불러오기
	 */
	EventListVO getCheckEventList(String pageNo);
	
	/**
	 * 정지윤
	 * 이벤트 승인
	 */
	void checkEvent(String[] checkEvent);
	
	/**
	 * 정지윤 
	 * 이벤트 반려
	 */
	void uncheckEvent(String[] uncheckEvent);
	
	/**
	 * 정지윤
	 * 게시된 이벤트 리스트 불러오기
	 */
	EventListVO manageEventList(String pageNo);
	
	/**
	 * 정지윤
	 * 이벤트 삭제
	 */
	void deleteEvent(String[] deleteEvent);
}
