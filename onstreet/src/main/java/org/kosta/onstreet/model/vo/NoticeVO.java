package org.kosta.onstreet.model.vo;

public class NoticeVO {
	private String noticeNo;// 공지 번호
	private String noticeTitle;// 공지 제목
	private String noticeContent;// 공지 내용
	private String noticeWriteDate;// 공지 작성일
	private MemberVO memberVO;// 작성자

	public NoticeVO() {
		super();
		// TODO Auto-generated constructor stub
	}

	public NoticeVO(String noticeNo, String noticeTitle, String noticeContent, String noticeWriteDate,
			MemberVO memberVO) {
		super();
		this.noticeNo = noticeNo;
		this.noticeTitle = noticeTitle;
		this.noticeContent = noticeContent;
		this.noticeWriteDate = noticeWriteDate;
		this.memberVO = memberVO;
	}

	public String getNoticeNo() {
		return noticeNo;
	}

	public void setNoticeNo(String noticeNo) {
		this.noticeNo = noticeNo;
	}

	public String getNoticeTitle() {
		return noticeTitle;
	}

	public void setNoticeTitle(String noticeTitle) {
		this.noticeTitle = noticeTitle;
	}

	public String getNoticeContent() {
		return noticeContent;
	}

	public void setNoticeContent(String noticeContent) {
		this.noticeContent = noticeContent;
	}

	public String getNoticeWriteDate() {
		return noticeWriteDate;
	}

	public void setNoticeWriteDate(String noticeWriteDate) {
		this.noticeWriteDate = noticeWriteDate;
	}

	public MemberVO getMemberVO() {
		return memberVO;
	}

	public void setMemberVO(MemberVO memberVO) {
		this.memberVO = memberVO;
	}

	@Override
	public String toString() {
		return "NoticeVO [noticeNo=" + noticeNo + ", noticeTitle=" + noticeTitle + ", noticeContent=" + noticeContent
				+ ", noticeWriteDate=" + noticeWriteDate + ", memberVO=" + memberVO + "]";
	}

}
