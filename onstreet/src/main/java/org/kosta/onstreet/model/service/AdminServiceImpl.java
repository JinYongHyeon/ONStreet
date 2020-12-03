package org.kosta.onstreet.model.service;

import javax.annotation.Resource;

import org.kosta.onstreet.model.PagingBean;
import org.kosta.onstreet.model.mapper.AdminMapper;
import org.kosta.onstreet.model.mapper.BoardMapper;
import org.kosta.onstreet.model.mapper.MemberMapper;
import org.kosta.onstreet.model.vo.ArtistVO;
import org.kosta.onstreet.model.vo.MemberListVO;
import org.kosta.onstreet.model.vo.MemberVO;
import org.kosta.onstreet.model.vo.ShowListVO;
import org.springframework.stereotype.Service;

@Service
public class AdminServiceImpl implements AdminService {

	@Resource
	private MemberMapper memberMapper;
	@Resource
	private AdminMapper adminMapper;
	@Resource
	private BoardMapper boardMapper;
	
	/**
	 * 정지윤
	 * 회원관리 - 삭제
	 */
	@Override
	public void manageMember(String[] checkMember) {
		ArtistVO avo = new ArtistVO();
		MemberVO memberVO = new MemberVO();
		for(String id:checkMember) {
			memberVO.setId(id);
			avo.setMemberVO(memberVO);
			memberMapper.removeMember(avo);
		}
	}

	/**
	 * 정지윤
	 * 회원(ROLE_MEMBER) 리스트 불러오기
	 */
	@Override
	public MemberListVO getMemberList(String pageNo) {
		int memberTotalCount = adminMapper.getTotalMemberCount();
		PagingBean pagingBean = null;
		if(pageNo==null)
			pagingBean = new PagingBean(memberTotalCount);
		else
			pagingBean = new PagingBean(memberTotalCount,Integer.parseInt(pageNo));
		MemberListVO memberListVO = new MemberListVO(adminMapper.getManageMemberList("ROLE_MEMBER",pagingBean),pagingBean);
		return memberListVO;
	}
	
	/**
	 * 정지윤
	 * 회원(ROLE_ARTIST) 리스트 불러오기
	 */
	@Override
	public MemberListVO getMemberArtistList(String pageNo) {
		int memberTotalCount = adminMapper.getTotalMemberCount();
		PagingBean pagingBean = null;
		if(pageNo==null)
			pagingBean = new PagingBean(memberTotalCount);
		else
			pagingBean = new PagingBean(memberTotalCount,Integer.parseInt(pageNo));
		MemberListVO memberListVO = new MemberListVO(adminMapper.getManageMemberArtistList("ROLE_ARTIST", pagingBean),pagingBean);
		return memberListVO;
	}
}
