package org.kosta.onstreet.model.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import org.kosta.onstreet.model.vo.ArtistVO;

import org.kosta.onstreet.model.PagingBean;
import org.kosta.onstreet.model.vo.ShowVO;


@Mapper
public interface BoardMapper {

	/**
	 * 정지윤
	 * 아티스트 수 불러오고 리스트 불러오기
	 * @return
	 */
	int getTotalArtistCount();
	List<ArtistVO> getArtistList(PagingBean pagingBean);

	//이동욱 시작
	//게시물 전체개수 불러오는 메서드
	int getTotalShowCount();
	//게시물 전체 리스트 불러오는 메서드
	List<ShowVO> getShowList(PagingBean pagingBean);



}
