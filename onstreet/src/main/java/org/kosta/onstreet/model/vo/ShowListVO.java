package org.kosta.onstreet.model.vo;


import java.util.List;

import org.kosta.onstreet.model.PagingBean;

/**
 * 게시물 리스트 정보와 페이징 정보를 가지고 있는 클래스 
 * @author inst
 *
 */
public class ShowListVO {
	private List<ShowVO> list;
	private PagingBean pagingBean;
	
	public ShowListVO() {
		super();
		// TODO Auto-generated constructor stub
	}
		
	public ShowListVO(List<ShowVO> list, PagingBean pagingBean) {
		super();
		this.list = list;
		this.pagingBean = pagingBean;
	}
	
	public List<ShowVO> getList() {
		return list;
	}
	public void setList(List<ShowVO> list) {
		this.list = list;
	}
	
	public PagingBean getPagingBean() {
		return pagingBean;
	}
	public void setPagingBean(PagingBean pagingBean) {
		this.pagingBean = pagingBean;
	}
	
	@Override
	public String toString() {
		return "ShowListVO [list=" + list + ", pagingBean=" + pagingBean + "]";
	}
}










