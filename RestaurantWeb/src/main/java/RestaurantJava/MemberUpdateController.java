package RestaurantJava;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
public class MemberUpdateController {
	private MemberDao memberDao;

	public MemberUpdateController setMemberDao(MemberDao memberDao) {
		this.memberDao = memberDao;
		return this;
	}

	@PostMapping("changepw")
	public String update(@RequestParam("oldpw") String oldpw, @RequestParam("pw") String pw, @RequestParam("repw") String repw, HttpSession session) {
		try {
			Member member = memberDao.selectById((String)session.getAttribute("id"));
			String pass = member.getPw();
			if(oldpw.equals(pass) && pw.equals(repw) && !pass.equals(pw)) { //변경성공
				member.setPw(pw);
				memberDao.update(member);
				return "ChangePwSuccess"; 
			}else if(!oldpw.equals(pass)) { // 비밀번호가 틀림
				return "WrongPW";
			}else if(!pw.equals(repw)) { // 재입력한 비밀번호가 틀림
				return "ChangePwNotEqual";
			}else if(oldpw.equals(pw)) { // 변경전과 후의 비밀번호가 같음
				return "DuplicatePw";
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "";
	}
}
