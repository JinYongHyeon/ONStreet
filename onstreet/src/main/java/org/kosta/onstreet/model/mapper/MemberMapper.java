package org.kosta.onstreet.model.mapper;

import org.apache.ibatis.annotations.Mapper;
import org.kosta.onstreet.model.vo.ArtistVO;

@Mapper
public interface MemberMapper {
	
	public ArtistVO login(String id);
}
