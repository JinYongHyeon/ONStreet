package org.kosta.onstreet.model.service;

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
	MemberListVO getMemberArtistList(String pageNo);
}
