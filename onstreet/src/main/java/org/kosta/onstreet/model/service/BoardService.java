package org.kosta.onstreet.model.service;


import java.util.ArrayList;

import org.kosta.onstreet.model.vo.NoticeVO;
import org.kosta.onstreet.model.PagingBean;
import org.kosta.onstreet.model.vo.ArtistListVO;
import org.kosta.onstreet.model.vo.NoticeListVO;
import org.kosta.onstreet.model.vo.ShowListVO;
import org.kosta.onstreet.model.vo.ShowVO;


public interface BoardService {
    ArrayList<NoticeVO> getNoticeList(String pageNo);//공지사항리스트 -김수민
    int getTotalNoticeCount();//공지사항리스트 총합-김수민
    NoticeVO getNoticeDetail(String noticeNo);
	// 이동욱 시작
	// 공연일정 리스트 메서드
	ShowListVO getShowList(String pageNo);
	/**
	 * 정지윤
	 * 아티스트 리스트 불러오기
	 */
	ArtistListVO getArtistList(String pageNo);

	// 전체공연 갯수 불러오기(페이징에 필요)
	int getTotalShowCount();
	// 공연일정 상세보기
	ShowVO getShowDetail(String showNo);
}

