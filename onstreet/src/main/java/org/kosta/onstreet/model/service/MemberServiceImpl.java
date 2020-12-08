package org.kosta.onstreet.model.service;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.kosta.onstreet.model.PagingBean;
import org.kosta.onstreet.model.mapper.MemberMapper;
import org.kosta.onstreet.model.vo.ArtistVO;
import org.kosta.onstreet.model.vo.AuthVO;
import org.kosta.onstreet.model.vo.EventListVO;
import org.kosta.onstreet.model.vo.FollowListVO;
import org.kosta.onstreet.model.vo.FollowVO;
import org.kosta.onstreet.model.vo.MemberVO;
import org.springframework.security.core.context.SecurityContextHolder;
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
	 * 회원가입[관객] - 진용현 1.회원가입 2.권한등록 : ROLE_MEMBER [관객]
	 * 
	 * @param memberVO
	 */
	@Transactional
	@Override
	public void registerMember(MemberVO memberVO) {
		memberVO.setPassword(passwordEncoder.encode(memberVO.getPassword())); // 암호화처리
		// if(memberVO.getProfile() == null)memberVO.setProfile("default.png");
		if (memberVO.getProfileFile().getOriginalFilename().equals(""))
			memberVO.setProfile(memberVO.getProfileFile().getOriginalFilename());
		memberMapper.registerMember(memberVO);
		AuthVO authVO = new AuthVO();
		authVO.setAuthName("ROLE_MEMBER");
		authVO.setMemberVO(memberVO);
		memberMapper.registerAuth(authVO);
	}

	/**
	 * 회원가입[아티스트] - 진용현 1.아티스트 등록 2.권한등록 : ROLE_MEMBER[관객] + ROLE_ARTIST[아트스트]
	 */
	@Transactional
	@Override
	public void registerArtist(ArtistVO artistVO) {
		artistVO.getMemberVO().setPassword(passwordEncoder.encode(artistVO.getMemberVO().getPassword()));// 암호화처리
		if (artistVO.getMemberVO().getProfileFile().getOriginalFilename().equals(""))
			artistVO.getMemberVO().setProfile(artistVO.getMemberVO().getProfileFile().getOriginalFilename());
		memberMapper.registerMember(artistVO.getMemberVO());
		memberMapper.registerArtist(artistVO);
		AuthVO authVO = new AuthVO();
		authVO.setAuthName("ROLE_MEMBER");
		authVO.setMemberVO(artistVO.getMemberVO());
		memberMapper.registerAuth(authVO);
		authVO.setAuthName("ROLE_ARTIST");
		memberMapper.registerAuth(authVO);

	}

	// 회원 탈퇴재확인 정세희
	@Override
	public int removeMember(String password, ArtistVO avo) {
		int point = 0;
		String encodepassowrd = passwordEncoder.encode(avo.getMemberVO().getPassword());
		System.out.println(avo.getMemberVO().getPassword());
		System.out.println(encodepassowrd);
		System.out.println(password);

		if (passwordEncoder.matches(password, avo.getMemberVO().getPassword())) {
			point = memberMapper.removeMember(avo);
		}
		return point;

	}

	/**
	 * 회원수정[관객] - 진용현
	 */
	@Override
	public void updateMember(MemberVO memberVO) {
		memberMapper.updateMember(memberVO);
	}

	/**
	 * 회원수정[아티스트] 진용현 1.회원수정 2.아티스트 수정
	 */
	@Transactional
	@Override
	public void updateArtist(ArtistVO artistVO) {
		memberMapper.updateMember(artistVO.getMemberVO());
		memberMapper.updateArtist(artistVO);
	}

	/**
	 * 정세희 팔로우리스트 불러오기
	 */
	@Override
	public FollowListVO getfollowingList(String id,String pageNo) {
		int followingTotalCount = memberMapper.followingTotalCount(id);
		PagingBean pagingBean = null;
		if(pageNo==null)
			pagingBean = new PagingBean(followingTotalCount);
		else
			pagingBean = new PagingBean(followingTotalCount,Integer.parseInt(pageNo));
		FollowListVO followListVO = new FollowListVO(memberMapper.getfollowingList(id,pagingBean),pagingBean);
		return followListVO;
	}

	
	/**
	 * 정지윤 
	 * 1. 중복체크
	 * 2. 중복 아니면 팔로잉 등록
	 */
	@Override
	public int registerFollowing(FollowVO followVO) {
		int count = 0;
		ArtistVO artistVO = (ArtistVO) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		followVO.setMemberVO(artistVO.getMemberVO());
		if (memberMapper.followingCheckList(followVO) == 0) {
			count = memberMapper.registerFollowing(followVO);
		}
		return count;
	}
	
	/**
	 * 정지윤
	 * 아티스트 온도
	 */
	@SuppressWarnings("null")
	@Override
	public Map<String, String> getArtistTemperture(String id) {
		return memberMapper.getArtistTemperture(id);
	}
	
	/**
	 * 정세희
	 * 팔로우삭제
	 * 
	 */
	@Override
	public int removeFollowing(FollowVO fvo) {
		ArtistVO avo = (ArtistVO) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		fvo.setMemberVO(avo.getMemberVO());
		return memberMapper.removeFollowing(fvo);
	}

	/**
	 * 정세희 이벤트승인현황
	 */
	@Override
	public EventListVO artistCheckEventList(String id, String pageNo) {
		int artisteventTotalCount = memberMapper.getTotalEventCount(id);
		PagingBean pagingBean = null;
		if (pageNo == null)
			pagingBean = new PagingBean(artisteventTotalCount);
		else
			pagingBean = new PagingBean(artisteventTotalCount, Integer.parseInt(pageNo));
		EventListVO eventListVO = new EventListVO(memberMapper.artistCheckEventList(id, pagingBean), pagingBean);
		return eventListVO;
	}
}
