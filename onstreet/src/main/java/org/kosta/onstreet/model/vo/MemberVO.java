package org.kosta.onstreet.model.vo;

import org.springframework.web.multipart.MultipartFile;

public class MemberVO {
	private String id;// 아이디
	private String password;// 패스워드
	private String nickName;// 닉네임
	private String address;// 주소
	private String phone;// 전화번호
	private String email;// 이메일
	private String name;// 이름
	private String age;// 나이
	private String removeUserDate;// 탈퇴일자
	private String profile;// 프로필 사진
	private MultipartFile profileFile;//프로필 이미지

	public MemberVO() {
		super();
		// TODO Auto-generated constructor stub
	}

	public MemberVO(String id, String password, String nickName, String address, String phone, String email,
			String name, String age, String removeUserDate, String profile) {
		super();
		this.id = id;
		this.password = password;
		this.nickName = nickName;
		this.address = address;
		this.phone = phone;
		this.email = email;
		this.name = name;
		this.age = age;
		this.removeUserDate = removeUserDate;
		this.profile = profile;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getNickName() {
		return nickName;
	}

	public void setNickName(String nickName) {
		this.nickName = nickName;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getAge() {
		return age;
	}

	public void setAge(String age) {
		this.age = age;
	}

	public String getRemoveUserDate() {
		return removeUserDate;
	}

	public void setRemoveUserDate(String removeUserDate) {
		this.removeUserDate = removeUserDate;
	}

	public String getProfile() {
		return profile;
	}

	public void setProfile(String profile) {
		this.profile = profile;
	}

	public MultipartFile getProfileFile() {
		return profileFile;
	}

	public void setProfileFile(MultipartFile profileFile) {
		this.profileFile = profileFile;
	}

	@Override
	public String toString() {
		return "MemberVO [id=" + id + ", password=" + password + ", nickName=" + nickName + ", address=" + address
				+ ", phone=" + phone + ", email=" + email + ", name=" + name + ", age=" + age + ", removeUserDate="
				+ removeUserDate + ", profile=" + profile + ", profileFile=" + profileFile + "]";
	}

	

}
