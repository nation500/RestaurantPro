package RestaurantJava;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
public class BoardSelectController {
	private BoardDao boardDao;
	
	public BoardSelectController setBoardDao(BoardDao boardDao) {
		this.boardDao = boardDao;
		return this;
	}
	
	@GetMapping("select")
	public String select(@RequestParam("contNum") int contNum, HttpSession session) {
		try {
			Board board = boardDao.selectByNum(contNum);
			if(board == null) {
				return "BoardNull";
			}
			boardDao.viewUp(contNum);
			session.setAttribute("num", board.getNum());
			session.setAttribute("writerID", board.getId());
			session.setAttribute("title", board.getTitle());
			session.setAttribute("writerName", board.getName());
			session.setAttribute("date", board.getDate());
			session.setAttribute("view", board.getView());
			session.setAttribute("body", board.getBody());
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "BoardSelected";
	}
}
