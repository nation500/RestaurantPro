package RestaurantJava;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;

import com.mysql.cj.result.LongValueFactory;

@Controller
public class BoardEditController {
	private BoardDao boardDao;

	public BoardEditController setBoardDao(BoardDao boardDao) {
		this.boardDao = boardDao;
		return this;
	}

	@PostMapping("edit")
	public String edit(HttpSession session, Board board) {
		try {
			boardDao.edit(board, ((Long) session.getAttribute("num")).longValue());
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "redirect:select?contNum=" + session.getAttribute("num");
	}
}
