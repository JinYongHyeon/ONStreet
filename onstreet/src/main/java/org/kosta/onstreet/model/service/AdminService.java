package org.kosta.onstreet.model.service;

import org.kosta.onstreet.model.vo.ArtistVO;
import org.kosta.onstreet.model.vo.MemberListVO;

public interface AdminService {
	
	/**
	 * 정지윤
	 * 회원 관리 (회원 탈퇴)
	 * @param password
	 * @param artistVO
	 * @return
	 */
	int manageMember(String password,ArtistVO artistVO);
	
	/**
	 * 정지윤
	 * 회원 리스트 불러오기
	 */
	MemberListVO getMemberList(String pageNo);
}
