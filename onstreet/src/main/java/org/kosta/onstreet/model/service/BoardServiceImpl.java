package org.kosta.onstreet.model.service;

import java.util.List;

import javax.annotation.Resource;

import org.kosta.onstreet.model.mapper.BoardMapper;
import org.kosta.onstreet.model.vo.ArtistVO;
import org.springframework.stereotype.Service;

@Service
public class BoardServiceImpl implements BoardService {
	@Resource
	private BoardMapper boardMapper;
	
	@Override
	public List<ArtistVO> getArtistList() {
		return boardMapper.getArtistList();
	}
}
