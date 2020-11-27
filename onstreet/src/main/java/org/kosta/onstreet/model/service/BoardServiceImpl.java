package org.kosta.onstreet.model.service;

import java.util.ArrayList;
import javax.annotation.Resource;
import org.kosta.onstreet.model.mapper.BoardMapper;
import org.kosta.onstreet.model.vo.NoticeVO;
import org.kosta.onstreet.model.PagingBean;
import org.springframework.stereotype.Service;

@Service
public class BoardServiceImpl implements BoardService {
	@Resource
private BoardService boardService;
	@Resource
private BoardMapper boardMapper;
	
	//김수민시작
	//공지사항리스트불러오기
	@Override
	public ArrayList<NoticeVO> getNoticeList(String pageNo) {
		int totalNoticeCount=boardMapper.getTotalNoticeCount();
		PagingBean pagingBean=null;
		if(pageNo==null) {
			pagingBean=new PagingBean(totalNoticeCount);
		}else {
			pagingBean=new PagingBean(totalNoticeCount,Integer.parseInt(pageNo));
		}
		ArrayList<NoticeVO> list=(boardMapper.getNoticeList(pagingBean));
		return list;
	}

	@Override
	public int getTotalNoticeCount() {
		return boardMapper.getTotalNoticeCount();
	}
}
