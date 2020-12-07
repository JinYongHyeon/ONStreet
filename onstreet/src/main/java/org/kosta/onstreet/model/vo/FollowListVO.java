package org.kosta.onstreet.model.vo;

import java.util.List;

import org.kosta.onstreet.model.PagingBean;

public class FollowListVO {
	private List<FollowVO> followList;
	private PagingBean pagingBean;
	public FollowListVO() {
		super();
		// TODO Auto-generated constructor stub
	}
	public FollowListVO(List<FollowVO> followList, PagingBean pagingBean) {
		super();
		this.followList = followList;
		this.pagingBean = pagingBean;
	}
	public List<FollowVO> getFollowList() {
		return followList;
	}
	public void setFollowList(List<FollowVO> followList) {
		this.followList = followList;
	}
	public PagingBean getPagingBean() {
		return pagingBean;
	}
	public void setPagingBean(PagingBean pagingBean) {
		this.pagingBean = pagingBean;
	}
	@Override
	public String toString() {
		return "FollowListVO [followList=" + followList + ", pagingBean=" + pagingBean + "]";
	}
	
}
