package org.kosta.onstreet.model.service;


import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import javax.annotation.Resource;

import org.kosta.onstreet.model.PagingBean;
import org.kosta.onstreet.model.mapper.BoardMapper;
import org.kosta.onstreet.model.vo.ArtistListVO;
import org.kosta.onstreet.model.vo.CommentListVO;
import org.kosta.onstreet.model.vo.CommentVO;
import org.kosta.onstreet.model.vo.NoticeVO;
import org.kosta.onstreet.model.vo.ShowListVO;
import org.kosta.onstreet.model.vo.ShowVO;
import org.springframework.stereotype.Service;

@Service
public class BoardServiceImpl implements BoardService {

	@Resource
private BoardMapper boardMapper;

	
	//김수민시작
	//공지사항리스트불러오기
	@Override
	public ArrayList<NoticeVO> getNoticeList(String pageNo) {
		int totalNoticeCount=boardMapper.getTotalNoticeCount();
		PagingBean pagingBean=null;
		if(pageNo==null) {
			pagingBean=new PagingBean(totalNoticeCount);
		}else {
			pagingBean=new PagingBean(totalNoticeCount,Integer.parseInt(pageNo));
		}
		ArrayList<NoticeVO> list=(boardMapper.getNoticeList(pagingBean));
		return list;
	}
	
	/**
	 * 정지윤
	 * 아티스트 리스트 불러오기
	 */
	@Override
	public ArtistListVO getArtistList(String pageNo) {
		int artistTotalCount = boardMapper.getTotalArtistCount();
		PagingBean pagingBean = null;
		if(pageNo==null)
			pagingBean = new PagingBean(artistTotalCount);
		else
			pagingBean = new PagingBean(artistTotalCount,Integer.parseInt(pageNo));
		ArtistListVO artistListVO = new ArtistListVO(boardMapper.getArtistList(pagingBean),pagingBean);
		return artistListVO;
	}

	//이동욱시작
	//전체리스트 불러오는 메서드
	@Override
	public ShowListVO getShowList(String pageNo) {
		int showTotalCount = boardMapper.getTotalShowCount();
		PagingBean pagingBean = null;
		if(pageNo==null)
			pagingBean = new PagingBean(showTotalCount);
		else 
			pagingBean	=new PagingBean(showTotalCount, Integer.parseInt(pageNo));
		ShowListVO showListVO =new ShowListVO(boardMapper.getShowList(pagingBean),pagingBean);
		return showListVO;
	}
	// 전체공연 갯수 불러오기(페이징에 필요)
	@Override
	public int getTotalShowCount() {
		return boardMapper.getTotalShowCount();
	}
	// 공연일정 상세보기
	@Override
	public ShowVO getShowDetail(String showNo) {
		return boardMapper.getShowDetail(showNo);
	}
	
	@Override
	public int getTotalNoticeCount() {
		return boardMapper.getTotalNoticeCount();
	}
	// 댓글 리스트 불러오기
	@Override
	public CommentListVO getCommentList(String showNo, String pageNo) {
		int commentTotalCount = boardMapper.getTotalCommentCount();
		PagingBean pagingBean = null;
		if(pageNo==null)
			pagingBean = new PagingBean(commentTotalCount);
		else 
			pagingBean	=new PagingBean(commentTotalCount, Integer.parseInt(pageNo));
		CommentListVO commListVO =new CommentListVO(boardMapper.getCommentList(showNo, pagingBean),pagingBean);
		return commListVO;
	}

	@Override
	public int getTotalCommnetCount() {
		return boardMapper.getTotalCommentCount();
	}
}
