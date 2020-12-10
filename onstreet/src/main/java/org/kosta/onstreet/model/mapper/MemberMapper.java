package org.kosta.onstreet.model.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.kosta.onstreet.model.PagingBean;
import org.kosta.onstreet.model.vo.ArtistVO;
import org.kosta.onstreet.model.vo.AuthVO;
import org.kosta.onstreet.model.vo.EventVO;
import org.kosta.onstreet.model.vo.FollowVO;
import org.kosta.onstreet.model.vo.MemberVO;
import org.kosta.onstreet.model.vo.ShowVO;

@Mapper
public interface MemberMapper {
	
	/**
	 * 로그인,아티스트 상세페이지 - 진용현
	 * @param id
	 * @return ArtisVO 
	 */
	public ArtistVO login(String id);
	
	/**
	 * [로그인]아티스트 승인 취소 후 액션  - 진용현
	 */
	public void cancelArtist(String id);
	
	/**
	 *[로그인]권한조회 - 진용현
	 * @param id
	 * @return List<AuthVO>
	 */
	public List<AuthVO> selectAuthorityByUsername(String id);
	
	/**
	 * [로그인]아티스트 승인 조회 - 진용현 
	 * @param id
	 * @return
	 */
	public String artistCheckDate(String id);
	
	/**
	 * [회원가입,회원수정] 닉네임중복검사 - 진용현
	 * @param nickName
	 * @return
	 */
	public int nickNameCheck(String nickName);
	
	/**
	 * 회원가입[관객] - 진용현
	 * @param memberVO
	 * @return
	 */
	public int registerMember(MemberVO memberVO);
	
	/**
	 * 회원가입[아티스트] - 진용현
	 * @param artistVO
	 * @return
	 */
	public int registerArtist(ArtistVO artistVO);
	
	/**
	 * 회원가입 권한등록 - 진용현
	 * @param authVO
	 * @return
	 */
	public int registerAuth(AuthVO authVO);
	
	/**
	 * 회원수정[관객] - 진용현
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
	 * 회원수정[비밀번호] - 진용현
	 * @return
	 */
	public int updatePassword(MemberVO memberVO);
	
	/**
	 * 정세희 회원탈퇴
	 * @param 
	 */
	public int removeMember(ArtistVO avo);
	
	
	/**
	 * 1.팔로잉토탈카운트 - 정세희
	 */
	int followingTotalCount(String id);
	
	/**
	 * 팔로우리스트 불러오기 - 정세희
	 * @param id
	 * @param pagningbean
	 * @return
	 */
	List<FollowVO> getfollowingList(@Param("id")String id,@Param("pagingbean")PagingBean pagningbean);
	
	/**
	 * 정지윤
	 * 팔로잉 등록
	 */
	int registerFollowing(FollowVO followVO);
	
	/**
	 * 팔로우 중복 검사 - 정지윤 
	 * @param followVO
	 * @return
	 */
	int followingCheckList(FollowVO followVO);
	
	/**
	 * 팔로우삭제 정세희
	 * @param fvo
	 * @return
	 */
	public int removeFollowing(@Param("id")String id,@Param("followingId") String[] followingId);
	
	/**
	 * 정지윤
	 * 아티스트 온도
	 * @return 
	 * @return 
	 */
	 public Map<String,String> getArtistTemperture(String id);
	 
	 /**
		 * 정지윤
		 * 아티스트 공연일정 불러오기
		 */
		List<ShowVO> getArtistShowDate(String id);
	
	/**
	 * 이벤트승인현황[페이징 카운트] 정세희
	 */
	int getTotalEventCount(String id);
	
	/**
	 * 이벤트 승인현황 - 정세희
	 * @param id
	 * @param pagningbean
	 * @return
	 */
	List<EventVO> artistCheckEventList(@Param("id")String id,@Param("pagingbean")PagingBean pagningbean);
	

}
	