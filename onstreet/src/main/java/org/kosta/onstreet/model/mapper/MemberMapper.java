package org.kosta.onstreet.model.mapper;

import java.util.ArrayList;
import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.kosta.onstreet.model.PagingBean;
import org.kosta.onstreet.model.vo.ArtistVO;
import org.kosta.onstreet.model.vo.AuthVO;
import org.kosta.onstreet.model.vo.EventListVO;
import org.kosta.onstreet.model.vo.EventVO;
import org.kosta.onstreet.model.vo.FollowVO;
import org.kosta.onstreet.model.vo.MemberVO;

@Mapper
public interface MemberMapper {
	
	/**
	 * 로그인 - 진용현
	 * @param id
	 * @return ArtisVO 
	 */
	public ArtistVO login(String id);
	
	/**
	 * 권한조회 - 진용현
	 * @param id
	 * @return List<AuthVO>
	 */
	public List<AuthVO> selectAuthorityByUsername(String id);
	
	public String artistCheckDate(String id);
	
	/**
	 * 닉네임중복검사 - 진용현
	 * @param nickName
	 * @return
	 */
	public int nickNameCheck(String nickName);
	
	/**
	 * 정세희 회원탈퇴
	 * @param 
	 */
	public int removeMember(ArtistVO avo);
	/**
	 * 회원가입 - 진용현
	 * @param memberVO
	 * @return
	 */
	public int registerMember(MemberVO memberVO);
	
	/**
	 * 회원가입 권한등록 - 진용현
	 * @param authVO
	 * @return
	 */
	public int registerAuth(AuthVO authVO);
	
	/**
	 * 회원가입[아티스트] - 진용현
	 * @param artistVO
	 * @return
	 */
	public int registerArtist(ArtistVO artistVO);
	
	/**
	 * 회원수정 - 진용현
	 * @param memberVO
	 * @return
	 */
	public int updateMember(MemberVO memberVO);
	
	/**
	 * 회원수정[아티스트] - 진용현
	 * @param artistVO
	 * @return
	 */
	public int updateArtist(ArtistVO artistVO);
	
	/**
	 * 팔로우리스트 불러오기 정세희
	 * 
	 */
	public List<FollowVO> getfollowingList(String id);
	
	/**
	 * 정지윤
	 * 팔로잉 등록
	 */
	int registerFollowing(FollowVO followVO);
	int followingCheckList(FollowVO followVO);
	
	/**
	 * 팔로우삭제 정세희
	 * @param fvo
	 * @return
	 */
	public int removeFollowing(FollowVO fvo);
	
	/**
	 * 이벤트승인현황 정세희
	 */
	ArrayList<EventListVO> artistCheckEventList(EventVO evo);
}
	