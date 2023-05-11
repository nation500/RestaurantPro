package RestaurantJava;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;

@Controller
public class MemberInsertController {
	private MemberDao memberDao;
	
	public MemberInsertController setMemberDao(MemberDao memberDao) {
		this.memberDao = memberDao;
		return this;
	}
	
	@PostMapping("insert")
	public String insert(Member member) throws Exception{
		try {
			memberDao.insert(member);
		}catch(Exception e) {
			e.printStackTrace();
		}
		return "LoginPage";
	}
}
