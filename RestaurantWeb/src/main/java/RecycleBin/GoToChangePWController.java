package RecycleBin;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;

@Controller
public class GoToChangePWController {
	private MemberDao memberDao;
	
	public GoToChangePWController setMemberDao(MemberDao memberDao) {
		this.memberDao = memberDao;
		return this;
	}
	@PostMapping("gotoChangepw")
	public String changepw(HttpSession session) {
		try {
			Member member = memberDao.selectById((String)session.getAttribute("id"));
			session.setAttribute("oldpw", member.getPw());
		}catch(Exception e) {
			e.printStackTrace();
		}
		
		return null;
	}
	
}
