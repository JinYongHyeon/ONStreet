package org.kosta.onstreet.model.service;

import java.util.List;

import org.kosta.onstreet.model.vo.AuthVO;
import org.kosta.onstreet.model.vo.MemberVO;

public interface MemberService {
	
	MemberVO findMemberById(String id);

	List<AuthVO> selectAuthorityByUsername(String id);

}
