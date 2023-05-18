package reservation;

import java.sql.Date;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;

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
	
	public long getNo() {
		return no;
	}
	public void setNo(long no) {
		this.no = no;
	}
	public String getId() {
		return id;
	}
	//세션에서 가져온 값으로 셋팅
	public void setId(String id) {
		HttpServletRequest request = ((ServletRequestAttributes) RequestContextHolder.getRequestAttributes()).getRequest();
		HttpSession session = request.getSession(); 
		this.id = (String)session.getAttribute("id");
		
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		HttpServletRequest request = ((ServletRequestAttributes) RequestContextHolder.getRequestAttributes()).getRequest();
		HttpSession session = request.getSession(); 
		this.name = (String)session.getAttribute("name");
	}
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone; 
				//phone.substring(0, 3) + "-" + phone.substring(3, 7) + "-" + phone.substring(7, 11);
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
