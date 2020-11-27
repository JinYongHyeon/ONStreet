package org.kosta.onstreet;

import javax.annotation.Resource;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.kosta.onstreet.model.mapper.BoardMapper;
import org.kosta.onstreet.model.mapper.MemberMapper;
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
	
	}
	
	@Test
	public void member(){
		
		//System.out.println(mm.login("bityong")); 로그인테스트
		//System.out.println(mm.selectAuthorityByUsername("bityong")); 권한조회테스트
		System.out.println(mm.artistCheckDate("biton")==null);
	}
}




















