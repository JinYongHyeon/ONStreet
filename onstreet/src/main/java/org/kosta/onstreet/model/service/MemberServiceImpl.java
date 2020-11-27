package org.kosta.onstreet.model.service;

import java.util.List;

import javax.annotation.Resource;

import org.kosta.onstreet.model.mapper.MemberMapper;
import org.kosta.onstreet.model.vo.ArtistVO;
import org.kosta.onstreet.model.vo.AuthVO;
import org.springframework.stereotype.Service;

@Service
public class MemberServiceImpl implements MemberService {
	
	@Resource
	private MemberMapper memberMapper;
	
	/**
	 * 로그인 - 진용현
	 */
	@Override
	public ArtistVO findMemberById(String id) {
		
		return memberMapper.login(id);
	}
	
	/**
	 * 권한조회 -진용현
	 */
	@Override
	public List<AuthVO> selectAuthorityByUsername(String id) {
		
		return memberMapper.selectAuthorityByUsername(id);
	}
	
	/**
	 * 아티스트 승인 조회 - 진용현
	 */
	@Override
	public String artistCheckDate(String id) {
		return memberMapper.artistCheckDate(id);
	}
	
	/**
	 * 닉네임 중복검사 - 진용현
	 */
	@Override
	public int nickNameCheck(String nickName) {
		return memberMapper.nickNameCheck(nickName);
	}

}
