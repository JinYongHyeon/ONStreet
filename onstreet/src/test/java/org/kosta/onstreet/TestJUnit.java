package org.kosta.onstreet;

import java.util.HashMap;
import java.util.List;

import javax.annotation.Resource;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.kosta.onstreet.model.PagingBean;
//github.com/JinYongHyeon/ONStreet.git
import org.kosta.onstreet.model.mapper.BoardMapper;
import org.kosta.onstreet.model.mapper.MemberMapper;
import org.kosta.onstreet.model.service.BoardService;
import org.kosta.onstreet.model.vo.ArtistVO;
import org.kosta.onstreet.model.vo.AuthVO;
import org.kosta.onstreet.model.vo.MemberVO;
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
	@Test
	public void board(){
		/*
		 * int noticeTotalCount=bm.getTotalNoticeCount();
		 * System.out.println(noticeTotalCount); PagingBean pb=new
		 * PagingBean(noticeTotalCount); List<NoticeVO> list=bm.getNoticeList(pb);
		 * for(NoticeVO vo:list) System.out.println(vo);
		 */
		
		 /**
		  * 정지윤 테스트
		  */
		//System.out.println(bm.getTotalArtistCount());
		System.out.println(bm.findEventByNo("1"));
		//int noticeTotalCount=bm.getTotalNoticeCount();
		//System.out.println(noticeTotalCount);
//		  PagingBean pb=new PagingBean(noticeTotalCount); 
//		   List<NoticeVO> list=bm.getNoticeList(pb);
//		   for(NoticeVO vo:list) 
//		   System.out.println(vo);
//		 
//		System.out.println(bm.getTotalArtistCount());

		/* 이동욱 테스트
		공연일정 전체 글 불러오기 테스트
		String pagingBean = "1";
		System.out.println(bs.getShowList(pagingBean));
		공연일정 상세보기 테스트
		*/
		//System.out.println(bm.getTotalCommentCount());
//		System.out.println(bs.getShowDetail(showNo));

	}
	
	@Test
	public void member(){
		
		//System.out.println(mm.artistCheckDate("biton")==null);
		//String id="zarta";
		//System.out.println(mm.findMemberById(id));
		//System.out.println(mm.selectAuthorityByUsername("bityong")); 권한조회테스트 - 진용현
		//System.out.println(mm.artistCheckDate("biton")==null); 아티스트 승인조회 - 진용현
		//System.out.println(mm.nickNameCheck("펭수"));
		
		//String id="zarta";
		//System.out.println("반환값"+mm.removeMember(id));
		
//		MemberVO memberVO = new MemberVO();
//		memberVO.setId("ju1234");
//		memberVO.setPassword("1234");
//		memberVO.setNickName("여우");
//		memberVO.setAddress("부천");
//		memberVO.setPhone("12345678901");
//		memberVO.setEmail("ju@gmail.com");
//		memberVO.setName("박신혜");
//		memberVO.setAge("1990-01-01");
//		memberVO.setProfile("default.png");
//		System.out.println(mm.registerMember(memberVO)); 회원가입 - 진용현
//		AuthVO authVO = new AuthVO();
//		authVO.setAuthName("ROLE_MEMBER");
//		MemberVO memberVO = new MemberVO();
//		memberVO.setId("ju1234");
//		authVO.setMemberVO(memberVO);
//		System.out.println(mm.registerAuth(authVO)); 회원가입 권한등록 - 진용현
//		ArtistVO artistVO = new ArtistVO();
//		artistVO.setSns("fb");
//		artistVO.setAccount("123-3333-44444");
//		artistVO.setArtistInfo("펭귄은 귀엽다");
//		MemberVO memberVO = new MemberVO();
//		memberVO.setId("ju1234");
//		artistVO.setMemberVO(memberVO);
//		System.out.println(mm.registerArtist(artistVO)); 회원가입[아티스트] - 진용현
	}
}




















