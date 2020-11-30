package org.kosta.onstreet.model.service;

import java.util.List;

import org.kosta.onstreet.model.vo.ArtistVO;
import org.kosta.onstreet.model.vo.AuthVO;

public interface MemberService {
	

	ArtistVO findMemberById(String id);

	List<AuthVO> selectAuthorityByUsername(String id);
	
	String artistCheckDate(String id);
	
	int nickNameCheck(String nickName);

	void removeMember(String password);
}
