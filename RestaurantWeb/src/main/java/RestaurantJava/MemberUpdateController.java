package RestaurantJava;

import javax.servlet.http.HttpSession;

import org.springframework.web.bind.annotation.PostMapping;

public class MemberUpdateController {
	private MemberDao_Interface memberDao;
	
	public MemberUpdateController setMemberDao(MemberDao_Interface memberDao) {
		this.memberDao = memberDao;
		return this;
	}
	
	@PostMapping
	public String update(Member member, HttpSession session) {
		try {
			Member newMem = (Member) session.getAttribute("member");
			newMem.setPw(member.getPw());
			memberDao.update(newMem);
		}catch(Exception e) {
			e.printStackTrace();
		}
		return ""; // 
	}
}
