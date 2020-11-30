package org.kosta.onstreet.model.vo;


import java.util.List;

import org.kosta.onstreet.model.PagingBean;

/**
 * 게시물 리스트 정보와 페이징 정보를 가지고 있는 클래스 
 * @author inst
 *
 */
public class EventListVO {
	private List<EventVO> eventList;
	private PagingBean pagingBean;
	
	public EventListVO() {
		super();
		// TODO Auto-generated constructor stub
	}
	
	public EventListVO(List<EventVO> eventList, PagingBean pagingBean) {
		super();
		this.eventList = eventList;
		this.pagingBean = pagingBean;
	}
	
	public List<EventVO> getEventList() {
		return eventList;
	}
	public void setEventList(List<EventVO> eventList) {
		this.eventList = eventList;
	}
	
	public PagingBean getPagingBean() {
		return pagingBean;
	}
	public void setPagingBean(PagingBean pagingBean) {
		this.pagingBean = pagingBean;
	}
	
	@Override
	public String toString() {
		return "EventListVO [eventList=" + eventList + ", pagingBean=" + pagingBean + "]";
	}
}

