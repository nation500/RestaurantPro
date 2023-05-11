package RestaurantJava;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;

@Controller
public class LoginController {
	private MemberDao memberDao;
	
	public LoginController setMemberDao(MemberDao memberDao) {
		this.memberDao = memberDao;
		return this;
	}
	
	@PostMapping("login")
	public String login(Member member, HttpSession session) {
		try {
			if(memberDao.exist(member.getId(), member.getPw()) != null) {
				Member mem = memberDao.exist(member.getId(), member.getPw());
				String phone = mem.getPhone();
				String phone1 = phone.substring(0 , 3);
				String phone2 = phone.substring(3 , 7);
				String phone3 = phone.substring(7 , 11);
				session.setAttribute("id", mem.getId());
				session.setAttribute("name", mem.getName());
				session.setAttribute("phone1", phone1);
				session.setAttribute("phone2", phone2);
				session.setAttribute("phone3", phone3);
				return "Main";
			}
		}catch(Exception e) {}
		return "LoginPage";
	}
}
