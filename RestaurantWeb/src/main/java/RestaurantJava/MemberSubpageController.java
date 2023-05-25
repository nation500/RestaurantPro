package RestaurantJava;

import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
public class MemberSubpageController {
	private MemberDao memberDao;
	
	public MemberSubpageController setMemberDao(MemberDao memberDao) {
		this.memberDao = memberDao;
		return this;
	}
	
	@PostMapping("idCheck")
	@ResponseBody
	public String goSubpage(@RequestBody String userId) throws Exception{
		boolean isDup = false;
		List<String> list = memberDao.getIds();
		for(int i = 0; i < list.size(); i++) {
			if(list.get(i).equals(userId)) {
				isDup = true;
				break;
			}
		}
		return isDup ? "Dup" : "noDup";
	}
}
