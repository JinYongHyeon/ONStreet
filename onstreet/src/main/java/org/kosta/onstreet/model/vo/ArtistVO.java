package org.kosta.onstreet.model.vo;

public class ArtistVO {
	private String sns;// SNS
	private String account;// 계좌번호
	private String artistInfo;// 소개글
	private String checkDate;// 아티스트 승인일
	private MemberVO memberVO;// 아티스트 기본정보

	public ArtistVO() {
		super();
		// TODO Auto-generated constructor stub
	}

	public ArtistVO(String sns, String account, String artistInfo, String checkDate, MemberVO memberVO) {
		super();
		this.sns = sns;
		this.account = account;
		this.artistInfo = artistInfo;
		this.checkDate = checkDate;
		this.memberVO = memberVO;
	}

	public String getSns() {
		return sns;
	}

	public void setSns(String sns) {
		this.sns = sns;
	}

	public String getAccount() {
		return account;
	}

	public void setAccount(String account) {
		this.account = account;
	}

	public String getArtistInfo() {
		return artistInfo;
	}

	public void setArtistInfo(String artistInfo) {
		this.artistInfo = artistInfo;
	}

	public String getCheckDate() {
		return checkDate;
	}

	public void setCheckDate(String checkDate) {
		this.checkDate = checkDate;
	}

	public MemberVO getMemberVO() {
		return memberVO;
	}

	public void setMemberVO(MemberVO memberVO) {
		this.memberVO = memberVO;
	}

	@Override
	public String toString() {
		return "ArtistVO [sns=" + sns + ", account=" + account + ", artistInfo=" + artistInfo + ", checkDate="
				+ checkDate + ", memberVO=" + memberVO + "]";
	}

}
