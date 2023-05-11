package RestaurantJava;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
public class MemberDeleteController {
	private MemberDao memberDao;
	
	public MemberDeleteController setMemberDao(MemberDao memberDao) {
		this.memberDao = memberDao;
		return this;
	}
	
	@PostMapping("delete")
	public String delete(@RequestParam("pw") String pw, HttpSession session) {
		try {
			Member member = memberDao.selectById((String)session.getAttribute("id"));
			if(member == null) {
				return "WrongPW";
			}
			if(member.getPw().equals(pw)) {
				memberDao.delete(member.getId());
				session.invalidate();
				return "GoodBye";
			}else {
				return "WrongPW";
			}
		}catch(Exception e) {
			e.printStackTrace();
		}
		return "Main";
	}
}
