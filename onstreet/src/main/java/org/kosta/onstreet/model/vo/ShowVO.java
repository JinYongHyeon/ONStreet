package org.kosta.onstreet.model.vo;

public class ShowVO {
	private String showNo;// 공연일정번호
	private String showTitle;// 공연일정 제목
	private String showWriteDate;// 공연일정 작성일
	private String showContent;// 공연일정 내용
	private String showDate;// 공연날짜
	private ArtistVO artistVO;// 작성자

	public ShowVO() {
		super();
		// TODO Auto-generated constructor stub
	}

	public ShowVO(String showNo, String showTitle, String showWriteDate, String showContent, String showDate,
			ArtistVO artistVO) {
		super();
		this.showNo = showNo;
		this.showTitle = showTitle;
		this.showWriteDate = showWriteDate;
		this.showContent = showContent;
		this.showDate = showDate;
		this.artistVO = artistVO;
	}

	public String getShowNo() {
		return showNo;
	}

	public void setShowNo(String showNo) {
		this.showNo = showNo;
	}

	public String getShowTitle() {
		return showTitle;
	}

	public void setShowTitle(String showTitle) {
		this.showTitle = showTitle;
	}

	public String getShowWriteDate() {
		return showWriteDate;
	}

	public void setShowWriteDate(String showWriteDate) {
		this.showWriteDate = showWriteDate;
	}

	public String getShowContent() {
		return showContent;
	}

	public void setShowContent(String showContent) {
		this.showContent = showContent;
	}

	public String getShowDate() {
		return showDate;
	}

	public void setShowDate(String showDate) {
		this.showDate = showDate;
	}

	public ArtistVO getArtistVO() {
		return artistVO;
	}

	public void setArtistVO(ArtistVO artistVO) {
		this.artistVO = artistVO;
	}

	@Override
	public String toString() {
		return "ShowVO [showNo=" + showNo + ", showTitle=" + showTitle + ", showWriteDate=" + showWriteDate
				+ ", showContent=" + showContent + ", showDate=" + showDate + ", artistVO=" + artistVO + "]";
	}

}
