package org.kosta.onstreet.model.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.kosta.onstreet.model.vo.ArtistVO;

@Mapper
public interface BoardMapper {
	List<ArtistVO> getArtistList();
}
