package org.kosta.onstreet.model.service;

import java.util.List;

import org.kosta.onstreet.model.vo.ArtistVO;
import org.kosta.onstreet.model.vo.AuthVO;
import org.kosta.onstreet.model.vo.FollowVO;
import org.kosta.onstreet.model.vo.MemberVO;

public interface MemberService {
	
	ArtistVO findMemberById(String id);

	List<AuthVO> selectAuthorityByUsername(String id);
	
	String artistCheckDate(String id);
	
	int nickNameCheck(String nickName);

	int removeMember(String password,ArtistVO avo);
	
	void registerMember(MemberVO memberVO);
	
	void registerArtist(ArtistVO artistVO);
	
	void updateMember(MemberVO memberVO);
	
	void updateArtist(ArtistVO artistVO);

	List<FollowVO> getFollowingList(String id);
}
