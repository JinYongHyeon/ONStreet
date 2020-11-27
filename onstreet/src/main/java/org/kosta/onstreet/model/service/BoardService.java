package org.kosta.onstreet.model.service;

import java.util.ArrayList;

import org.kosta.onstreet.model.vo.NoticeVO;

public interface BoardService {
    ArrayList<NoticeVO> getNoticeList(String pageNo);//공지사항리스트 -김수민
    int getTotalNoticeCount();
	
}