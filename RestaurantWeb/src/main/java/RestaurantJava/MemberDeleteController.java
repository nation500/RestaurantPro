package RestaurantJava;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;

@Controller
public class MemberDeleteController {
	private MemberDao_Interface memberDao;
	
	public MemberDeleteController setMemberDao(MemberDao_Interface memberDao) {
		this.memberDao = memberDao;
		return this;
	}
	
	@PostMapping("delete")
	public String delete(Member member) {
		try {
			memberDao.delete(member.getId());
		}catch(Exception e) {
			e.printStackTrace();
		}
		return "Main";
	}
}
