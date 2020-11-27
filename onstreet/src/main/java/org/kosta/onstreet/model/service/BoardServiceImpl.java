package org.kosta.onstreet.model.service;

import java.util.List;


import javax.annotation.Resource;

import org.kosta.onstreet.model.mapper.BoardMapper;
import org.kosta.onstreet.model.vo.NoticeVO;
import org.springframework.stereotype.Service;

@Service
public class BoardServiceImpl implements BoardService {
	@Resource
private BoardService boardService;
	@Resource
private BoardMapper boardMapper;
	@Override
	public List<NoticeVO> getnoticeList() {
		return boardMapper.getnoticeList();
	}
	
}
