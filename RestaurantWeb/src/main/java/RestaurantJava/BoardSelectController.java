package RestaurantJava;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
public class BoardSelectController {
	private BoardDao boardDao;
	private CommentDao commentDao;

	public BoardSelectController setBoardDao(BoardDao boardDao, CommentDao commentDao) {
		this.boardDao = boardDao;
		this.commentDao = commentDao;
		return this;
	}

	@GetMapping("select")
	public String select(@RequestParam("contNum") int contNum, HttpSession session) {
		try {
			Board board = boardDao.selectByNum(contNum);
			if (board == null) {
				return "BoardNull";
			}
			boardDao.viewUp(contNum);
			session.setAttribute("num", board.getNum());
			session.setAttribute("writerID", board.getId());
			session.setAttribute("writerName", board.getName());
			session.setAttribute("title", board.getTitle());
			session.setAttribute("date", board.getDate().toLocalDate());
			session.setAttribute("time", board.getDate().toLocalTime());
			session.setAttribute("view", board.getView());
			session.setAttribute("body", board.getBody());

			List<Comment> list = commentDao.getComments(contNum);
			session.removeAttribute("commentList");
			if (list != null) {
				session.setAttribute("commentList", list);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "BoardSelected";
	}
}
