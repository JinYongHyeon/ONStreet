package org.kosta.onstreet;

import java.util.List;

import javax.annotation.Resource;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.kosta.onstreet.model.PagingBean;
//github.com/JinYongHyeon/ONStreet.git
import org.kosta.onstreet.model.mapper.BoardMapper;
import org.kosta.onstreet.model.mapper.MemberMapper;
import org.kosta.onstreet.model.service.BoardService;
//github.com/JinYongHyeon/ONStreet.git
import org.kosta.onstreet.model.vo.NoticeVO;
//github.com/JinYongHyeon/ONStreet.git
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

/*
 *    TDD : 테스트 주도 개발(test-driven development, TDD)은 
 *            매우 짧은 개발 사이클을 반복하는 소프트웨어 개발 프로세스
 *            
 *    JUnit: 자바 단위 테스트를 위한 TDD 프레임워크
 *    
 *    아래 라이브러리가 maven의 pom.xml에 추가되어야 한다. 
       <!-- spring junit  -->
  <dependency>
            <groupId>org.springframework</groupId>
            <artifactId>spring-test</artifactId>
            <version>${org.springframework-version}</version>            
        </dependency>
        <!-- Test : 기존 4.7에서 4.9로 수정 -->
  <dependency>
   <groupId>junit</groupId>
   <artifactId>junit</artifactId>
   <version>4.9</version>
   <scope>test</scope>
  </dependency>  
 */  
@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations={"file:src/main/webapp/WEB-INF/spring-model.xml","file:src/main/webapp/WEB-INF/spring-security.xml"})
public class TestJUnit {
	@Resource
	private MemberMapper mm;
	@Resource
	private BoardMapper bm;
	
	private BoardService bs;
	@Test
	public void board(){
		int noticeTotalCount=bm.getTotalNoticeCount();
		//System.out.println(noticeTotalCount);
		  PagingBean pb=new PagingBean(noticeTotalCount); 
		   List<NoticeVO> list=bm.getNoticeList(pb);
		   for(NoticeVO vo:list) 
		   System.out.println(vo);
		 
		System.out.println(bm.getTotalArtistCount());

		/* 이동욱 테스트
		공연일정 전체 글 불러오기 테스트
		String pagingBean = "1";
		System.out.println(bs.getShowList(pagingBean));
		공연일정 상세보기 테스트
		*/
		String showNo ="4";
		System.out.println(bs.getShowDetail(showNo));

	}
	
	@Test
	public void member(){
		
		System.out.println(mm.artistCheckDate("biton")==null);
		//String id="zarta";
		//System.out.println(mm.findMemberById(id));
		//System.out.println(mm.selectAuthorityByUsername("bityong")); 권한조회테스트 - 진용현
		//System.out.println(mm.artistCheckDate("biton")==null); 아티스트 승인조회 - 진용현
		System.out.println(mm.nickNameCheck("펭수"));

	}
}




















