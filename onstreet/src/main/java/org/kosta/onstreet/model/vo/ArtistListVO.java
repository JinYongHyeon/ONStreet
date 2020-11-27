package org.kosta.onstreet.model.vo;


import java.util.List;

import org.kosta.onstreet.model.PagingBean;

/**
 * 게시물 리스트 정보와 페이징 정보를 가지고 있는 클래스 
 * @author inst
 *
 */
public class ArtistListVO {
	private List<ArtistVO> artistList;
	private PagingBean pagingBean;
	
	public ArtistListVO() {
		super();
		// TODO Auto-generated constructor stub
	}
	
	public ArtistListVO(List<ArtistVO> artistList, PagingBean pagingBean) {
		super();
		this.artistList = artistList;
		this.pagingBean = pagingBean;
	}
	
	public List<ArtistVO> getArtistList() {
		return artistList;
	}
	public void setArtistList(List<ArtistVO> artistList) {
		this.artistList = artistList;
	}
	
	public PagingBean getPagingBean() {
		return pagingBean;
	}
	public void setPagingBean(PagingBean pagingBean) {
		this.pagingBean = pagingBean;
	}
	
	@Override
	public String toString() {
		return "ArtistListVO [artistList=" + artistList + ", pagingBean=" + pagingBean + "]";
	}
}

