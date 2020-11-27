package org.kosta.onstreet.model.service;


import java.util.List;

import org.kosta.onstreet.model.vo.ArtistVO;



import org.kosta.onstreet.model.vo.ShowListVO;





public interface BoardService {
	List<ArtistVO> getArtistList();
	
	ShowListVO getShowList(String pageNo);

}
