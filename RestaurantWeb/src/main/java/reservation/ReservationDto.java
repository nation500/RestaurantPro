package reservation;

import java.sql.Date;

public class ReservationDto {	
	private long no;
	private String id;
	private String name;
	private String phone;
	private Date date;
	private String time;
	private int person;
	private int price;
	private String notice;
	
	//세션에 저장할 값 추가 선언
	private String sessionDate;
	private String sessionTime;
	private int sessionPerson;
	private String sessionNotice;
	
	
	
	
	public long getNo() {
		return no;
	}
	public void setNo(long no) {
		this.no = no;
	}
	public String getSessionDate() {
		return sessionDate;
	}
	public void setSessionDate(String sessionDate) {
		this.sessionDate = sessionDate;
	}
	public String getSessionTime() {
		return sessionTime;
	}
	public void setSessionTime(String sessionTime) {
		this.sessionTime = sessionTime;
	}
	public int getSessionPerson() {
		return sessionPerson;
	}
	public void setSessionPerson(int sessionPerson) {
		this.sessionPerson = sessionPerson;
	}
	public String getSessionNotice() {
		return sessionNotice;
	}
	public void setSessionNotice(String sessionNotice) {
		this.sessionNotice = sessionNotice;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	public Date getDate() {
		return date;
	}
	public void setDate(Date date) {
		this.date = date;
	}
	public String getTime() {
		return time;
	}
	public void setTime(String time) {
		this.time = time;
	}
	public int getPerson() {
		return person;
	}
	public void setPerson(int person) {
		this.person = person;
	}
	public int getPrice() {
		return price;
	}
	public void setPrice(int price) {
		this.price = price;
	}
	public String getNotice() {
		return notice;
	}
	public void setNotice(String notice) {
		this.notice = notice;
	}
	
	
	
}
