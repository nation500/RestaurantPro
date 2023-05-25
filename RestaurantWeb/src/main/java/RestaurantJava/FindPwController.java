package RestaurantJava;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;

@Controller
public class FindPwController {
	private MemberDao memberDao;

	public FindPwController setMemberDao(MemberDao memberDao) {
		this.memberDao = memberDao;
		return this;
	}

	@PostMapping("findPW")
	public String findPW(Member member, HttpSession session) {
		try {
			Member foundMem = memberDao.findPw(member.getId(), member.getName(), member.getPhone());
			String pw = foundMem.getPw();
			int stars = pw.substring(2).length();
			String yourPw = pw.substring(0, 2);
			for(int i=0; i < stars; i++) {
				yourPw += "*"; 
			}
			session.setAttribute("foundPw", yourPw);
		} catch (Exception e) {
			e.printStackTrace();
			return "memberNotFound";
		}
		return "showFoundPw";
	}
}