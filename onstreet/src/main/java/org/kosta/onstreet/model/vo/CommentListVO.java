package org.kosta.onstreet.model.vo;


import java.util.List;

import org.kosta.onstreet.model.PagingBean;

/**
 * 게시물 리스트 정보와 페이징 정보를 가지고 있는 클래스 
 * @author inst
 *
 */
public class CommentListVO {
	private List<CommentVO> commentList;
	private PagingBean pagingBean;
	
	public CommentListVO() {
		super();
		// TODO Auto-generated constructor stub
	}
	
	public CommentListVO(List<CommentVO> commentList, PagingBean pagingBean) {
		super();
		this.commentList = commentList;
		this.pagingBean = pagingBean;
	}
	
	public List<CommentVO> getcommentList() {
		return commentList;
	}
	public void setcommentList(List<CommentVO> commentList) {
		this.commentList = commentList;
	}
	
	public PagingBean getPagingBean() {
		return pagingBean;
	}
	public void setPagingBean(PagingBean pagingBean) {
		this.pagingBean = pagingBean;
	}
	
	@Override
	public String toString() {
		return "commentListVO [commentList=" + commentList + ", pagingBean=" + pagingBean + "]";
	}
}

