package org.kosta.onstreet;

import java.util.List;
import java.util.ArrayList;
import java.util.HashSet;
import java.util.Iterator;
import java.util.LinkedHashSet;
import java.util.List;
import java.util.Set;

import javax.annotation.Resource;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.kosta.onstreet.model.PagingBean;
import org.kosta.onstreet.model.mapper.AdminMapper;
import org.kosta.onstreet.model.mapper.BoardMapper;
import org.kosta.onstreet.model.mapper.MemberMapper;
import org.kosta.onstreet.model.vo.ArtistVO;
import org.kosta.onstreet.model.vo.EventVO;
import org.kosta.onstreet.model.vo.FollowVO;
import org.kosta.onstreet.model.vo.MemberVO;
import org.kosta.onstreet.model.vo.MemberVO;
import org.kosta.onstreet.model.vo.ShowVO;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
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
@ContextConfiguration(locations = { "file:src/main/webapp/WEB-INF/spring-model.xml",
		"file:src/main/webapp/WEB-INF/spring-security.xml" })
public class TestJUnit {
	@Resource
	private MemberMapper mm;
	@Resource
	private BoardMapper bm;
	@Resource
	private AdminMapper am;

	@Resource
	private BCryptPasswordEncoder passwordEncoder;

	@Test
	public void board() {
		/*
		 * 김수민 테스트 공지사항 총합 테스트 공지사항 리스트 불러오는 테스트 int
		 * noticeTotalCount=bm.getTotalNoticeCount();
		 * System.out.println(noticeTotalCount); PagingBean pb=new
		 * PagingBean(noticeTotalCount); List<NoticeVO> list=bm.getNoticeList(pb);
		 * for(NoticeVO vo:list) System.out.println(vo);
		 */
		// 공지사항 상세정보:김수민
		// String noticeNo="4";
		// System.out.println(bm.getNoticeDetail(noticeNo));
		// 공지사항 등록 :김수민
		/*
		 * NoticeVO nvo=new NoticeVO(); nvo.setNoticeTitle("에러");
		 * nvo.setNoticeContent("테스트완료"); MemberVO mvo=new MemberVO();
		 * mvo.setId("bityong"); nvo.setMemberVO(mvo); bm.addNotice(nvo);
		 * System.out.println(nvo);
		 */
		// 공지사항수정 :김수민

		// System.out.println(bm.getNoticeDetail("2"));
		/*
		 * NoticeVO nvo=new NoticeVO(); nvo.setNoticeTitle("springmvc");
		 * nvo.setNoticeContent("boot"); nvo.setNoticeNo("3"); bm.updateNotice(nvo);
		 * System.out.println(nvo);
		 */
		// 공지사항 삭제:김수민
		// String noticeNo="23";
		// bm.deleteNotice(noticeNo);
		/*
		 * for(int i=0; i<3; i++) { NoticeVO nvo=new NoticeVO();
		 * nvo.setNoticeTitle("aaaaa"+i); nvo.setNoticeContent("oooo"+i);
		 * nvo.setMemberVO(new
		 * MemberVO("bityong",null,null,null,null,null,null,null,null,null)); }
		 */

		// System.out.println(bm.getTotalArtistCount());
		/*
		 * int noticeTotalCount=bm.getTotalNoticeCount();
		 * System.out.println(noticeTotalCount); PagingBean pb=new
		 * PagingBean(noticeTotalCount); List<NoticeVO> list=bm.getNoticeList(pb);
		 * for(NoticeVO vo:list) System.out.println(vo);
		 */
		/**
		 * 정지윤 테스트
		 */
		/*
		 * FollowVO followVO = new FollowVO('wjdwldbs','wldbs');
		 * System.out.println(mm.followingCheckList(followVO));
		 */
		// System.out.println(bm.getEventValidity("21"));
		// System.out.println(bm.getArtistShowDate("wjdwldbs"));
		// System.out.println(bm.getTotalArtistCount());
		// System.out.println(bm.findEventByNo("1"));
		// int noticeTotalCount=bm.getTotalNoticeCount();
		// System.out.println(noticeTotalCount);
//		  PagingBean pb=new PagingBean(noticeTotalCount); 
//		   List<NoticeVO> list=bm.getNoticeList(pb);
//		   for(NoticeVO vo:list) 
//		   System.out.println(vo);
//		 
//		System.out.println(bm.getTotalArtistCount());

		/*
		 * 이동욱 테스트 공연일정 전체 글 불러오기 테스트 String pagingBean = "1";
		 * System.out.println(bs.getShowList(pagingBean)); 공연일정 상세보기 테스트
		 */
		// System.out.println(bm.getTotalCommentCount());
//		System.out.println(bs.getShowDetail(showNo));
		// 공연업데이트 테스트
//		ShowVO svo = new ShowVO();
//		svo.setShowNo("18");
//		svo.setShowTitle("수정테스트");
//		svo.setShowContent("수정이 어디갔니");
//		svo.setShowDate("2020-11-20");
//		bm.updateShow(svo);
		// 삭제 테스트
//		String no = "3";
//		bm.deleteShow(no);
		// 좋아요 리스트 불러오기
//		String no ="25";
//		System.out.println(bm.getLikeListByShowNo(no));
		// 좋아요 유무 체크
//		LikeVO lvo = new LikeVO();
//		MemberVO mvo = new MemberVO();
//		mvo.setId("donguk");
//		lvo.setshowNo("25");
//		lvo.setMemberVO(mvo);
//		System.out.println(bm.likeCheck(lvo));
//		CommentVO cvo = new CommentVO();
//		cvo.setCommentContent("테스트하기");
//		cvo.setCommentNo("27");
//		bm.updateComment(cvo);
		// 댓글 삭제
		// bm.deleteComment("27");

		// 아티스트 검색
		// System.out.println(bm.getSearchArtistTotalCount("펭"));
		// PagingBean pagingBean = new PagingBean(bm.getSearchArtistTotalCount("펭"));
		// System.out.println(bm.getSearchArtist("펭", pagingBean)); 검색

		// 공연 검색
		// System.out.println(bm.getSearchShowTotalCount("테"));
		// PagingBean pa = new PagingBean(bm.getSearchShowTotalCount("테"));
		// System.out.println(bm.getSearchShow("테", pa));

	}

	@Test
	public void member() {

		// System.out.println(mm.artistCheckDate("biton")==null);
		// String id="zarta";
		// System.out.println(mm.findMemberById(id));
		// System.out.println(mm.selectAuthorityByUsername("bityong")); 권한조회테스트 - 진용현
		// System.out.println(mm.artistCheckDate("biton")==null); 아티스트 승인조회 - 진용현
		// System.out.println(mm.nickNameCheck("펭수"));

		// String id="zarta";
		// System.out.println("반환값"+mm.removeMember(id));

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

//		MemberVO memberVO = new MemberVO();
//		memberVO.setNickName("펭수3");
//		memberVO.setAddress("판교");
//		memberVO.setPhone("01022223333");
//		memberVO.setEmail("qq@gmail.com");
//		memberVO.setName("펭귄");
//		memberVO.setId("shking");
//		memberVO.setProfile(null);
//		System.out.println(mm.updateMember(memberVO)); 회원수정 - 진용현

		/*
		 * ArtistVO artistVO= new ArtistVO(); MemberVO memberVO = new MemberVO();
		 * memberVO.setId("yhking"); artistVO.setSns("111"); artistVO.setAccount("222");
		 * artistVO.setArtistInfo("3333"); artistVO.setMemberVO(memberVO);
		 * System.out.println(artistVO); System.out.println(mm.updateArtist(artistVO));
		 */

		// String id="user1";
		// System.out.println(mm.removeFollowing(id));

		// String id="zarta1"; System.out.println(mm.getTotalEventCount(id));
		// int artistTotalEventCount=mm.getTotalEventCount(id);
		// PagingBean pb=new PagingBean(artistTotalEventCount);
//		  List<EventVO> list=mm.artistCheckEventList(id,pb); //System.out.println(list.size());
//		  for(EventVO vo:list) 
//		  System.out.println(vo);
//		  System.out.println(pb.getStartRowNumber());
//		  System.out.println(pb.getEndRowNumber());

		/*
		 * String id="user1"; // System.out.println(mm.followingTotalCount(id)); int
		 * followingTotalCount=mm.followingTotalCount(id); PagingBean pagingbean=new
		 * PagingBean(followingTotalCount);
		 * 
		 * List<FollowVO> list = mm.getfollowingList(id,pagingbean); for(FollowVO
		 * fvo:list) System.out.println(fvo);
		 */

		/*
		 * String id="user1"; System.out.println(mm.followingTotalCount(id)); int
		 * followingTotalCount=mm.followingTotalCount(id); PagingBean pagingbean=new
		 * PagingBean(followingTotalCount);
		 * 
		 * List<FollowVO> list = mm.getfollowingList(id,pagingbean); for(FollowVO
		 * fvo:list) System.out.println(fvo);
		 */

		
		  String password= "123456";
		  
		  String encoding = passwordEncoder.encode(password);
		  
		  MemberVO mvo = new MemberVO(); mvo.setId("yhking"); mvo.setPassword(encoding);
		  System.out.println(mm.updatePassword(mvo));
		 
		// System.out.println(mvo.getPassword().equals(encoding));
	}

	@Test
	public void admin() {
		/*
		 * //System.out.println(am.getTotalMemberCount()); PagingBean pagin = new
		 * PagingBean(10); //System.out.println(am.getManageMemberList("ROLE_MEMBER",
		 * pagin)); System.out.println(bm.getTotalShowCount());
		 * System.out.println(bm.getShowList(pagin));
		 */
		// System.out.println(am.getTotalMemberCount());
		// System.out.println(am.getTotalCheckArtist());
///		 PagingBean pagin = new PagingBean(3);
		// PagingBean pagin = new PagingBean(3);
		// System.out.println(am.getRemoveMemberList("ROLE_MEMBER", pagin));
		// System.out.println(am.getCheckArtistList(pagin));
		// System.out.println(am.getTotalCheckEvent());
		// System.out.println(am.getCheckEventList(pagin));
		// System.out.println(am.manageEventListCount());
//		 System.out.println(am.manageEventList(pagin));
		// System.out.println(am.manageEventList(pagin));
		// System.out.println(mm.getArtistTemperture("wjdwldbs"));
	}

}
