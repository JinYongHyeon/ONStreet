package org.kosta.onstreet.model.vo;

public class EventVO {
	private String eventNo; // 이벤트 번호
	private String eventTitle; // 이벤트 제목
	private String eventContent;// 이벤트 내용
	private String eventWriteDate; // 이벤트 작성일
	private String eventDate;// 이벤트 일자
	private String eventCheckDate; // 이벤트 승인일
	private String eventImage; // 이벤트 이미지
	private ArtistVO artistVO;// 작성자

	public EventVO() {
		super();
		// TODO Auto-generated constructor stub
	}

	public EventVO(String eventNo, String eventTitle, String eventContent, String eventWriteDate, String eventDate,
			String eventCheckDate, String eventImage, ArtistVO artistVO) {
		super();
		this.eventNo = eventNo;
		this.eventTitle = eventTitle;
		this.eventContent = eventContent;
		this.eventWriteDate = eventWriteDate;
		this.eventDate = eventDate;
		this.eventCheckDate = eventCheckDate;
		this.eventImage = eventImage;
		this.artistVO = artistVO;
	}

	public String getEventNo() {
		return eventNo;
	}

	public void setEventNo(String eventNo) {
		this.eventNo = eventNo;
	}

	public String getEventTitle() {
		return eventTitle;
	}

	public void setEventTitle(String eventTitle) {
		this.eventTitle = eventTitle;
	}

	public String getEventContent() {
		return eventContent;
	}

	public void setEventContent(String eventContent) {
		this.eventContent = eventContent;
	}

	public String getEventWriteDate() {
		return eventWriteDate;
	}

	public void setEventWriteDate(String eventWriteDate) {
		this.eventWriteDate = eventWriteDate;
	}

	public String getEventDate() {
		return eventDate;
	}

	public void setEventDate(String eventDate) {
		this.eventDate = eventDate;
	}

	public String getEventCheckDate() {
		return eventCheckDate;
	}

	public void setEventCheckDate(String eventCheckDate) {
		this.eventCheckDate = eventCheckDate;
	}

	public String getEventImage() {
		return eventImage;
	}

	public void setEventImage(String eventImage) {
		this.eventImage = eventImage;
	}

	public ArtistVO getArtistVO() {
		return artistVO;
	}

	public void setArtistVO(ArtistVO artistVO) {
		this.artistVO = artistVO;
	}

	@Override
	public String toString() {
		return "EventVO [eventNo=" + eventNo + ", eventTitle=" + eventTitle + ", eventContent=" + eventContent
				+ ", eventWriteDate=" + eventWriteDate + ", eventDate=" + eventDate + ", eventCheckDate="
				+ eventCheckDate + ", eventImage=" + eventImage + ", artistVO=" + artistVO + "]";
	}

}
