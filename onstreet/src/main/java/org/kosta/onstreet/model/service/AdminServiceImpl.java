package org.kosta.onstreet.model.service;

import javax.annotation.Resource;

import org.kosta.onstreet.model.PagingBean;
import org.kosta.onstreet.model.mapper.AdminMapper;
import org.kosta.onstreet.model.mapper.BoardMapper;
import org.kosta.onstreet.model.mapper.MemberMapper;
import org.kosta.onstreet.model.vo.ArtistListVO;
import org.kosta.onstreet.model.vo.ArtistVO;
import org.kosta.onstreet.model.vo.EventListVO;
import org.kosta.onstreet.model.vo.MemberListVO;
import org.kosta.onstreet.model.vo.MemberVO;
import org.kosta.onstreet.model.vo.ShowListVO;
import org.kosta.onstreet.model.vo.ShowVO;
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
	
	/**
	 * 정지윤 
	 * 탈퇴 회원 리스트 불러오기
	 */
	@Override
	public MemberListVO getRemoveMemberList(String pageNo) {
		int removeMemberTotal = adminMapper.getTotalRemoveMemberCount();
		PagingBean pagingBean = null;
		if(pageNo==null)
			pagingBean = new PagingBean(removeMemberTotal);
		else
			pagingBean = new PagingBean(removeMemberTotal,Integer.parseInt(pageNo));
		MemberListVO memberListVO = new MemberListVO(adminMapper.getRemoveMemberList("ROLE_MEMBER", pagingBean),pagingBean);
		return memberListVO;
	}
	/**
	 * 정지윤
	 * 게시물 삭제
	 */
	@Override
	public void manageShow(String[] checkShow) {
		ShowVO showVO = new ShowVO();
		for(String showNo:checkShow) {
			showVO.setShowNo(showNo);
			boardMapper.deleteShow(showNo);
		}
	}

	/**
	 * 정지윤
	 * 미승인 아티스트 리스트 불러오기
	 */
	@Override
	public ArtistListVO getCheckArtistList(String pageNo) {
		int checkArtistTotalCount = adminMapper.getTotalCheckArtist();
		PagingBean pagingBean = null;
		if(pageNo==null)
			pagingBean = new PagingBean(checkArtistTotalCount);
		else
			pagingBean = new PagingBean(checkArtistTotalCount,Integer.parseInt(pageNo));
		ArtistListVO artistListVO = new ArtistListVO(adminMapper.getCheckArtistList(pagingBean),pagingBean);
		return artistListVO;
	}

	/**
	 * 정지윤
	 * 아티스트 승인
	 */
	@Override
	public void checkArtist(String[] checkArtist) {
		for(String id:checkArtist) {
			adminMapper.checkArtist(id);
		}
	}
	
	/**
	 * 정지윤
	 * 아티스트 반려
	 */
	@Override
	public void uncheckArtist(String[] uncheckArtist) {
		for(String id:uncheckArtist)
			adminMapper.uncheckArtist(id);
	}

	/**
	 * 정지윤
	 * 미승인 이벤트 리스트 불러오기
	 */
	@Override
	public EventListVO getCheckEventList(String pageNo) {
		int checkEventTotalCount = adminMapper.getTotalCheckEvent();
		PagingBean pagingBean = null;
		if(pageNo==null)
			pagingBean = new PagingBean(checkEventTotalCount);
		else
			pagingBean = new PagingBean(checkEventTotalCount,Integer.parseInt(pageNo));
		EventListVO eventListVO = new EventListVO(adminMapper.getCheckEventList(pagingBean),pagingBean);
		return eventListVO;
	}
	
	/**
	 * 정지윤
	 * 이벤트 승인
	 */
	@Override
	public void checkEvent(String[] checkEvent) {
		for(String eventNo:checkEvent) {
			adminMapper.checkEvent(eventNo);
		}
	}
	
	/**
	 * 정지윤
	 * 이벤트 반려
	 */
	@Override
	public void uncheckEvent(String[] uncheckEvent) {
		for(String eventNo:uncheckEvent) {
			adminMapper.uncheckEvent(eventNo);	
		}
	}

	/**
	 * 정지윤
	 * 게시된 이벤트 리스트 불러오기
	 */
	@Override
	public EventListVO manageEventList(String pageNo) {
		int manageEventCount = adminMapper.manageEventListCount();
		PagingBean pagingBean = null;
		if(pageNo==null)
			pagingBean = new PagingBean(manageEventCount);
		else
			pagingBean = new PagingBean(manageEventCount,Integer.parseInt(pageNo));
		EventListVO eventListVO = new EventListVO(adminMapper.manageEventList(pagingBean),pagingBean);
		return eventListVO;
	}
	
	/**
	 * 정지윤
	 * 이벤트 삭제
	 */
	public void deleteEvent(String[] deleteEvent) {
		for(String eventNo:deleteEvent) {
			adminMapper.deleteEvent(eventNo);
		}
	}
}
