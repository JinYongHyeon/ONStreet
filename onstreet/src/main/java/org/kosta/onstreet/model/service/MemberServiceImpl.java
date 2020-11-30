package org.kosta.onstreet.model.service;

import java.util.List;

import javax.annotation.Resource;

import org.kosta.onstreet.model.mapper.MemberMapper;
import org.kosta.onstreet.model.vo.ArtistVO;
import org.kosta.onstreet.model.vo.AuthVO;
import org.kosta.onstreet.model.vo.MemberVO;
import org.springframework.security.authentication.encoding.PasswordEncoder;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
public class MemberServiceImpl implements MemberService {
	
	@Resource
	private MemberMapper memberMapper;
	
	/**
	 * 비밀번호 암호화처리를 위한 객체 spring-security.xml에 설정
	 */
	@Resource
	private BCryptPasswordEncoder passwordEncoder;
	
	/**
	 * 로그인 - 진용현
	 */
	@Override
	public ArtistVO findMemberById(String id) {
		
		return memberMapper.login(id);
	}
	
	/**
	 * 권한조회 -진용현
	 */
	@Override
	public List<AuthVO> selectAuthorityByUsername(String id) {
		
		return memberMapper.selectAuthorityByUsername(id);
	}
	
	/**
	 * 아티스트 승인 조회 - 진용현
	 */
	@Override
	public String artistCheckDate(String id) {
		return memberMapper.artistCheckDate(id);
	}
	
	/**
	 * 닉네임 중복검사 - 진용현
	 */
	@Override
	public int nickNameCheck(String nickName) {
		return memberMapper.nickNameCheck(nickName);
	}
	
	/**
	 * 회원가입[관객] - 진용현
	 * 1.회원가입 
	 * 2.권한등록 : ROLE_MEMBER [관객]
	 * @param memberVO
	 */
	@Transactional
	@Override
	public void registerMember(MemberVO memberVO) {
		memberVO.setPassword(passwordEncoder.encode(memberVO.getPassword())); //암호화처리
		//if(memberVO.getProfile() == null)memberVO.setProfile("default.png");
		if(!memberVO.getProfileFile().getOriginalFilename().equals(""))
		memberVO.setProfile(System.currentTimeMillis()+memberVO.getProfileFile().getOriginalFilename());
		else
		memberVO.setProfile(memberVO.getProfileFile().getOriginalFilename());
		memberMapper.registerMember(memberVO);
		AuthVO authVO = new AuthVO();
		authVO.setAuthName("ROLE_MEMBER");
		authVO.setMemberVO(memberVO);
		memberMapper.registerAuth(authVO);
	}
	
	/**
	 * 회원가입[아티스트] - 진용현
	 * 1.아티스트 등록
	 * 2.권한등록 : ROLE_MEMBER[관객] + ROLE_ARTIST[아트스트]
	 */
	@Transactional
	@Override
	public void registerArtist(ArtistVO artistVO) {
		artistVO.getMemberVO().setPassword(passwordEncoder.encode(artistVO.getMemberVO().getPassword()));//암호화처리
		//if(artistVO.getMemberVO().getProfile() == null)artistVO.getMemberVO().setProfile("default.png");
		if(!artistVO.getMemberVO().getProfileFile().getOriginalFilename().equals(""))
			artistVO.getMemberVO().setProfile(System.currentTimeMillis()+artistVO.getMemberVO().getProfileFile().getOriginalFilename());
			else
			artistVO.getMemberVO().setProfile(artistVO.getMemberVO().getProfileFile().getOriginalFilename());
		memberMapper.registerMember(artistVO.getMemberVO());
		//if(artistVO.getSns() == null)artistVO.setSns("미입력");
		//if(artistVO.getAccount() == null)artistVO.setAccount("미입력");
		System.out.println(artistVO);
		memberMapper.registerArtist(artistVO);
		AuthVO authVO = new AuthVO();
		authVO.setAuthName("ROLE_MEMBER");
		authVO.setMemberVO(artistVO.getMemberVO());
		memberMapper.registerAuth(authVO);
		authVO.setAuthName("ROLE_ARTIST");
		memberMapper.registerAuth(authVO);
		
	}	

	//회원 탈퇴재확인 정세희
	@Override
	public int removeMember(String password, ArtistVO avo) {
		int point = 0;
		String encodepassowrd=passwordEncoder.encode(avo.getMemberVO().getPassword());
		System.out.println(avo.getMemberVO().getPassword());
		System.out.println(encodepassowrd);
		System.out.println(password);
		
		if(passwordEncoder.matches(password,avo.getMemberVO().getPassword())) {
			point=memberMapper.removeMember(avo);
		}
		return point;
			
	}

}
