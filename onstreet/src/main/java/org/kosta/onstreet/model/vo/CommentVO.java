package org.kosta.onstreet.model.vo;

public class CommentVO {
	private String commentNo;// 댓글번호
	private String commentContent;// 댓글내용
	private String commentWriteDate;// 댓글작성일자
	private MemberVO memberVO;// 작성자
	private ShowVO showVO;// 공연일정번호

	public CommentVO() {
		super();
		// TODO Auto-generated constructor stub
	}

	public CommentVO(String commentNo, String commentContent, String commentWriteDate, MemberVO memberVO,
			ShowVO showVO) {
		super();
		this.commentNo = commentNo;
		this.commentContent = commentContent;
		this.commentWriteDate = commentWriteDate;
		this.memberVO = memberVO;
		this.showVO = showVO;
	}

	public String getCommentNo() {
		return commentNo;
	}

	public void setCommentNo(String commentNo) {
		this.commentNo = commentNo;
	}

	public String getCommentContent() {
		return commentContent;
	}

	public void setCommentContent(String commentContent) {
		this.commentContent = commentContent;
	}

	public String getCommentWriteDate() {
		return commentWriteDate;
	}

	public void setCommentWriteDate(String commentWriteDate) {
		this.commentWriteDate = commentWriteDate;
	}

	public MemberVO getMemberVO() {
		return memberVO;
	}

	public void setMemberVO(MemberVO memberVO) {
		this.memberVO = memberVO;
	}

	public ShowVO getShowVO() {
		return showVO;
	}

	public void setShowVO(ShowVO showVO) {
		this.showVO = showVO;
	}

	@Override
	public String toString() {
		return "CommentVO [commentNo=" + commentNo + ", commentContent=" + commentContent + ", commentWriteDate="
				+ commentWriteDate + ", memberVO=" + memberVO + ", showVO=" + showVO + "]";
	}

}
