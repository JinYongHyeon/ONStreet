package org.kosta.onstreet.model.vo;

public class LikeVO {
	private String showNo; // 게시물 번호
	private MemberVO memberVO; // 자신 아이디
	public LikeVO() {
		super();
		// TODO Auto-generated constructor stub
	}
	public LikeVO(String showNo, MemberVO memberVO) {
		super();
		this.showNo = showNo;
		this.memberVO = memberVO;
	}
	public String getshowNo() {
		return showNo;
	}
	public void setshowNo(String showNo) {
		this.showNo = showNo;
	}
	public MemberVO getMemberVO() {
		return memberVO;
	}
	public void setMemberVO(MemberVO memberVO) {
		this.memberVO = memberVO;
	}
	@Override
	public String toString() {
		return "LikeVO [showNo=" + showNo + ", memberVO=" + memberVO + "]";
	}
	
	
}
