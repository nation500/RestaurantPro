package RestaurantJava;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;

@Controller
public class CommentDeleteController {
	private CommentDao commentDao;

	public CommentDeleteController setCommentDao(CommentDao commentDao) {
		this.commentDao = commentDao;
		return this;
	}

	@PostMapping("delComment")
	public String delComment(Comment comment, HttpSession session) throws Exception {
		long i = comment.getNum();
		commentDao.delete(i);
		return "redirect:select?contNum=" + session.getAttribute("num");
	}
}