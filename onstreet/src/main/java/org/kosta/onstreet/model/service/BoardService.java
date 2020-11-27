package org.kosta.onstreet.model.service;

import org.kosta.onstreet.model.vo.ShowListVO;

public interface BoardService {
	
	ShowListVO getShowList(String pageNo);
}
