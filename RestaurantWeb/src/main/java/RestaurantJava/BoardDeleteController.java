package RestaurantJava;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;

@Controller
public class BoardDeleteController {
	private BoardDao boardDao;

	public BoardDeleteController setBoardDao(BoardDao boardDao) {
		this.boardDao = boardDao;
		return this;
	}

	@PostMapping("deleteBoard")
	public String deleteBoard(HttpSession session) {
		try {
			boardDao.delete(((Long) session.getAttribute("num")).longValue());
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "redirect:board?page=1";
	}
}
