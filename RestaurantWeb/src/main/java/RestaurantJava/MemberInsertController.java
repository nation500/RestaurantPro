package RestaurantJava;

import org.springframework.web.bind.annotation.PostMapping;

public class MemberInsertController {
	private MemberDao_Interface memberDao;
	
	public MemberInsertController setMemberDao(MemberDao_Interface memberDao) {
		this.memberDao = memberDao;
		return this;
	}
	
	@PostMapping("insert")
	public String insert(Member member) {
		try {
			memberDao.insert(member);
		}catch(Exception e) {
			e.printStackTrace();
		}
		return "LoginPage";
	}
}
