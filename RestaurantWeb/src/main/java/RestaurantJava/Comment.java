package RestaurantJava;

import java.time.LocalDateTime;

public class Comment {
	private long num;
	private long hq;
	private String id;
	private String name;
	private String body;
	private LocalDateTime date;
	
	public long getHq() {
		return hq;
	}
	public void setHq(long hq) {
		this.hq = hq;
	}
	public long getNum() {
		return num;
	}
	public void setNum(long num) {
		this.num = num;
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
	public String getBody() {
		return body;
	}
	public void setBody(String body) {
		this.body = body;
	}
	public LocalDateTime getDate() {
		return date;
	}
	public void setDate(LocalDateTime date) {
		this.date = date;
	}
	
	
}
