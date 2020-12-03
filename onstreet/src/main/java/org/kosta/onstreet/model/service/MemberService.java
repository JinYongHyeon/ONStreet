package org.kosta.onstreet.model.service;

import java.util.List;
import java.util.Set;

import org.kosta.onstreet.model.vo.ArtistVO;
import org.kosta.onstreet.model.vo.AuthVO;
import org.kosta.onstreet.model.vo.FollowVO;
import org.kosta.onstreet.model.vo.MemberVO;
import org.kosta.onstreet.model.vo.ShowVO;

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

	List<FollowVO> getfollowingList(ArtistVO avo);
	
	int registerFollowing(FollowVO followVO);
	
	int removeFollowing(FollowVO fvo);
	
}
