package RestaurantJava;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;

@Controller
public class LoginController {
	private MemberDao_Interface memberDao;
	
	public LoginController setMemberDao(MemberDao_Interface memberDao) {
		this.memberDao = memberDao;
		return this;
	}
	
	@PostMapping("login")
	public String login(Member member, HttpSession session) {
		try {
			if(memberDao.exist(member.getId(), member.getPw()) != null) {
				Member mem = memberDao.exist(member.getId(), member.getPw());
				session.setAttribute("member", mem);
				return "Main";
			}
		}catch(Exception e) {}
		return "LoginPage";
	}
}
