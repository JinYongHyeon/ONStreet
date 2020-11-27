package org.kosta.onstreet.model.service;


import org.kosta.onstreet.model.vo.ArtistListVO;
import org.kosta.onstreet.model.vo.ShowListVO;

public interface BoardService {
	
	ShowListVO getShowList(String pageNo);

	/**
	 * 정지윤
	 * 아티스트 리스트 불러오기
	 */
	ArtistListVO getArtistList(String pageNo);

}
