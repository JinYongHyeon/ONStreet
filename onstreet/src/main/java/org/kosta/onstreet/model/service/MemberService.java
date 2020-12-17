package org.kosta.onstreet.model.service;

import java.util.List;
import java.util.Map;

import org.kosta.onstreet.model.vo.ArtistVO;
import org.kosta.onstreet.model.vo.AuthVO;
import org.kosta.onstreet.model.vo.EventListVO;
import org.kosta.onstreet.model.vo.EventVO;
import org.kosta.onstreet.model.vo.FollowListVO;
import org.kosta.onstreet.model.vo.FollowVO;
import org.kosta.onstreet.model.vo.MemberVO;
import org.kosta.onstreet.model.vo.ShowVO;

public interface MemberService {
	
	/**
	 * 로그인,아티스트 상세페이지 - 진용현
	 * @param id
	 * @return
	 */
	ArtistVO findMemberById(String id);
	
	/**
	 * [로그인]아티스트 승인 취소 후 액션  - 진용현
	 * @param id
	 */
	void cancelArtist(String id);
	
	/**
	 * [로그인]권한조회 - 진용현
	 * @param id
	 * @return
	 */
	List<AuthVO> selectAuthorityByUsername(String id);
	
	/**
	 * [로그인]아티스트 승인 조회 - 진용현
	 * @param id
	 * @return
	 */
	String artistCheckDate(String id);
	
	/**
	 * [회원가입,회원수정]닉네임 중복검사 - 진용현
	 * @param nickName
	 * @return
	 */
	int nickNameCheck(String nickName);
	
	/**
	 * 회원가입[관객] - 진용현 1.회원가입 2.권한등록 : ROLE_MEMBER[관객]
	 * @param memberVO
	 */
	void registerMember(MemberVO memberVO);
	
	/**
	 * 회원가입[아티스트] - 진용현 1.아티스트 등록 2.권한등록 : ROLE_MEMBER[관객] + ROLE_ARTIST[아티스트]
	 * @param artistVO
	 */
	void registerArtist(ArtistVO artistVO);
	
	/**
	 * 회원수정[관객] - 진용현
	 * @param memberVO
	 */
	void updateMember(MemberVO memberVO);
	
	/**
	 * 회원수정[아티스트] - 진용현 1.회원수정 2.아티스트 수정
	 * @param artistVO
	 */
	void updateArtist(ArtistVO artistVO);
	
	/**
	 * 회원수정[비밀번호] - 진용현
	 * @param password
	 * @return
	 */
	int updatePassword(String password,String passwordChange,ArtistVO avo);

	/**
	 * 회원 탈퇴재확인 - 정세희
	 * @param password
	 * @param avo
	 * @return
	 */
	int removeMember(String password,ArtistVO avo);

	int followingTotalCount(String id);
	
	
	
	/**
	 * 팔로우리스트 불러오기 - 정세희
	 * @param id
	 * @param pageNo
	 * @return
	 */
	FollowListVO getfollowingList(String id,String pageNo);
	
	/**
	 * 팔로잉 중복체크 - 정지윤
	 * @param mvo
	 * @param follwingId
	 * @return
	 */
	int follwingCheck(MemberVO mvo, String follwingId);
	/**
	 * 팔로잉 등록 - 정지윤 1.중복체크 2.중복 아니면 팔로잉 등록
	 * @param followVO
	 * @return
	 */
	int registerFollowing(FollowVO followVO);
	
	/**
	 * 내 팔로우 삭제 - 정세희
	 * @param fvo
	 * @return
	 */
	int removeFollowing(String[] followingId);
	
	/**
	 * 아티스트 온도 - 정지윤 
	 * @param id
	 * @return
	 */
	Map<String, String> getArtistTemperture(String id);
	
	/**
	 * 정지윤
	 * 아티스트 공연일정 불러오기
	 */
	List<ShowVO> getArtistShowDate(String id);
	
	/**
	 * 이벤트 승인현황 - 정세희
	 * @param pageNo
	 * @param id
	 * @return
	 */
	EventListVO artistCheckEventList(String id,String pageNo);


	
}
