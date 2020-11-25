package org.kosta.onstreet.model.vo;

public class FollowVO {
	private String followingId; // 아티스트 아이디
	private MemberVO memberVO; // 자신 아이디

	public FollowVO() {
		super();
		// TODO Auto-generated constructor stub
	}

	
	public FollowVO(String followingId, MemberVO memberVO) {
		super();
		this.followingId = followingId;
		this.memberVO = memberVO;
	}

	
	public String getFollowingId() {
		return followingId;
	}


	public void setFollowingId(String followingId) {
		this.followingId = followingId;
	}


	public MemberVO getMemberVO() {
		return memberVO;
	}

	public void setMemberVO(MemberVO memberVO) {
		this.memberVO = memberVO;
	}


	@Override
	public String toString() {
		return "FollowVO [followingId=" + followingId + ", memberVO=" + memberVO + "]";
	}

	

}
