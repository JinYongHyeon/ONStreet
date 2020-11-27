package org.kosta.onstreet.model.mapper;

import java.util.ArrayList;

import org.apache.ibatis.annotations.Mapper;

import org.kosta.onstreet.model.vo.NoticeVO;
import org.kosta.onstreet.model.PagingBean;

@Mapper
public interface BoardMapper {
	int getTotalNoticeCount();
 ArrayList<NoticeVO>  getNoticeList(PagingBean pagingBean);//공지사항 리스트 김수민
}
