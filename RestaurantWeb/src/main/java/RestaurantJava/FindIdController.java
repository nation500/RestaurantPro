package RestaurantJava;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;

@Controller
public class FindIdController {
	private MemberDao memberDao;
	
	public FindIdController setMemberDao(MemberDao memberDao) {
		this.memberDao = memberDao;
		return this;
	}
	
	@PostMapping("findID")
	public String findID(Member member, HttpSession session) {
		try {
			Member foundMem = memberDao.findId(member.getName(), member.getPhone());
			session.setAttribute("foundId", foundMem.getId());
		} catch (Exception e) {
			e.printStackTrace();
			return "memberNotFound";
		} 
		return "showFoundId";
	}
}
