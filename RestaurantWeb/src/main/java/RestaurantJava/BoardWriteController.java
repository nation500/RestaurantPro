package RestaurantJava;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;

@Controller
public class BoardWriteController {
	@PostMapping("goWrite")
	public String goWrite(HttpSession session) {
		if (session.getAttribute("id") == null) {
			return "noSession";
		} else {
			return "BoardWritePage";
		}
	}
}
//유효성 검사를 제외하면 대부분 controller에서 처리하기. 