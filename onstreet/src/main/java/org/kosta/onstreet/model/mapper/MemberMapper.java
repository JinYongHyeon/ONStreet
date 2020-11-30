package org.kosta.onstreet.model.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.kosta.onstreet.model.vo.ArtistVO;
import org.kosta.onstreet.model.vo.AuthVO;

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
	
	public void removeMember(String password);
}
