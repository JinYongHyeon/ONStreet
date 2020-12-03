package org.kosta.onstreet.model.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.kosta.onstreet.model.PagingBean;
import org.kosta.onstreet.model.vo.ArtistVO;
import org.kosta.onstreet.model.vo.AuthVO;
import org.kosta.onstreet.model.vo.ShowVO;

@Mapper
public interface AdminMapper {
	/**
	 * 정지윤
	 * 회원 수 불러오고 리스트 불러오기
	 * @return
	 */
	int getTotalMemberCount();
	List<AuthVO> getManageMemberList(@Param("authName")String authName,@Param("pagingBean")PagingBean pagingBean);
	List<AuthVO> getManageMemberArtistList(@Param("authName")String authName,@Param("pagingBean")PagingBean pagingBean);
}
