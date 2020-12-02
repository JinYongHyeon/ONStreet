package org.kosta.onstreet.model.vo;


import java.util.List;

import org.kosta.onstreet.model.PagingBean;

/**
 * 회원 리스트 정보와 페이징 정보를 가지고 있는 클래스 
 * @author inst
 *
 */
public class MemberListVO {
	private List<AuthVO> memberList;
	private PagingBean pagingBean;
	
	public MemberListVO() {
		super();
		// TODO Auto-generated constructor stub
	}
	
	public MemberListVO(List<AuthVO> memberList, PagingBean pagingBean) {
		super();
		this.memberList = memberList;
		this.pagingBean = pagingBean;
	}
	
	public List<AuthVO> getMemberList() {
		return memberList;
	}
	public void setMemberList(List<AuthVO> memberList) {
		this.memberList = memberList;
	}
	
	public PagingBean getPagingBean() {
		return pagingBean;
	}
	public void setPagingBean(PagingBean pagingBean) {
		this.pagingBean = pagingBean;
	}
	
	@Override
	public String toString() {
		return "MemberListVO [memberList=" + memberList + ", pagingBean=" + pagingBean + "]";
	}
}

