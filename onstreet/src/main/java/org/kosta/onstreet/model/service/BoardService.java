package org.kosta.onstreet.model.service;


import org.kosta.onstreet.model.vo.ArtistListVO;
import org.kosta.onstreet.model.vo.ShowListVO;
import org.kosta.onstreet.model.vo.ShowVO;

public interface BoardService {
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
