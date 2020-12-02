package org.kosta.onstreet.model.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.kosta.onstreet.model.PagingBean;
import org.kosta.onstreet.model.vo.AuthVO;

@Mapper
public interface AdminMapper {
	/**
	 * 정지윤
	 * 회원 수 불러오고 리스트 불러오기
	 * @return
	 */
	int getTotalMemberCount();
	List<AuthVO> getManageMemberList(PagingBean pagingBean);
}
