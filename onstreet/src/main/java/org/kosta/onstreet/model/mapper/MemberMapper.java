package org.kosta.onstreet.model.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.kosta.onstreet.model.vo.ArtistVO;
import org.kosta.onstreet.model.vo.AuthVO;
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
	
}
	