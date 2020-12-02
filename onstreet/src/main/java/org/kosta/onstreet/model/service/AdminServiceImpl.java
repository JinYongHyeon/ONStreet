package org.kosta.onstreet.model.service;

import javax.annotation.Resource;

import org.kosta.onstreet.model.PagingBean;
import org.kosta.onstreet.model.mapper.AdminMapper;
import org.kosta.onstreet.model.mapper.MemberMapper;
import org.kosta.onstreet.model.vo.ArtistVO;
import org.kosta.onstreet.model.vo.AuthVO;
import org.kosta.onstreet.model.vo.MemberListVO;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;

@Service
public class AdminServiceImpl implements AdminService {

	@Resource
	private MemberMapper memberMapper;
	@Resource
	private AdminMapper adminMapper;
	
	/**
	 * 비밀번호 암호화처리를 위한 객체 spring-security.xml에 설정
	 */
	@Resource
	private BCryptPasswordEncoder passwordEncoder;
	
	/**
	 * 정지윤
	 * 회원관리
	 */
	@Override
	public int manageMember(String password, ArtistVO artistVO) {
		int point = 0;
		if(passwordEncoder.matches(password,artistVO.getMemberVO().getPassword())) {
			point=memberMapper.removeMember(artistVO);
		}
		return point;
	}

	/**
	 * 정지윤
	 * 회원 리스트 불러오기
	 */
	@Override
	public MemberListVO getMemberList(String pageNo) {
		int memberTotalCount = adminMapper.getTotalMemberCount();
		PagingBean pagingBean = null;
		if(pageNo==null)
			pagingBean = new PagingBean(memberTotalCount);
		else
			pagingBean = new PagingBean(memberTotalCount,Integer.parseInt(pageNo));
		MemberListVO memberListVO = new MemberListVO(adminMapper.getManageMemberList(pagingBean),pagingBean);
		return memberListVO;
	}
	
}
