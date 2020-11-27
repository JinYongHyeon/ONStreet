package org.kosta.onstreet.model.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.kosta.onstreet.model.vo.NoticeVO;

@Mapper
public interface BoardMapper {
 List<NoticeVO> getnoticeList();
}
