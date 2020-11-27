package org.kosta.onstreet.model.vo;

import java.util.List;

import org.kosta.onstreet.model.PagingBean;

public class NoticeListVO {
private List<NoticeVO> NoList;
private PagingBean pagingBean;
public NoticeListVO() {
	super();
	// TODO Auto-generated constructor stub
}
public NoticeListVO(List<NoticeVO> noList, PagingBean pagingBean) {
	super();
	NoList = noList;
	this.pagingBean = pagingBean;
}
public List<NoticeVO> getNoList() {
	return NoList;
}
public void setNoList(List<NoticeVO> noList) {
	NoList = noList;
}
public PagingBean getPagingBean() {
	return pagingBean;
}
public void setPagingBean(PagingBean pagingBean) {
	this.pagingBean = pagingBean;
}
@Override
public String toString() {
	return "NoticeListVO [NoList=" + NoList + ", pagingBean=" + pagingBean + "]";
}

}
