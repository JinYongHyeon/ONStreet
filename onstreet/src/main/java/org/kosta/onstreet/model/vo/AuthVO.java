package org.kosta.onstreet.model.vo;

public class AuthVO {
	private String authName;// 권한명
	private MemberVO memberVO;// 권한 아이디

	public AuthVO() {
		super();
		// TODO Auto-generated constructor stub
	}

	public AuthVO(String authName, MemberVO memberVO) {
		super();
		this.authName = authName;
		this.memberVO = memberVO;
	}

	public String getAuthName() {
		return authName;
	}

	public void setAuthName(String authName) {
		this.authName = authName;
	}

	public MemberVO getMemberVO() {
		return memberVO;
	}

	public void setMemberVO(MemberVO memberVO) {
		this.memberVO = memberVO;
	}

	@Override
	public String toString() {
		return "AuthVO [authName=" + authName + ", memberVO=" + memberVO + "]";
	}

}
