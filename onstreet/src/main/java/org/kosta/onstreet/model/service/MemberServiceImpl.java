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
	
	@Override
	public ArtistVO findMemberById(String id) {
		
		return memberMapper.login(id);
	}

	@Override
	public List<AuthVO> selectAuthorityByUsername(String id) {
		// TODO Auto-generated method stub
		return null;
	}

}
