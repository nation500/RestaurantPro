package RestaurantJava;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;

@Controller
public class CommentSubmitController {
	private CommentDao commentDao;
	
	public CommentSubmitController setCommentDao(CommentDao commentDao) {
		this.commentDao = commentDao;
		return this;
	}
	
	@PostMapping("subComment")
	public String subComment(Comment comment, HttpSession session){
		try {
			comment.setHq(Integer.parseInt(session.getAttribute("num").toString()));
			comment.setId(session.getAttribute("id").toString());
			comment.setName(session.getAttribute("name").toString());
			commentDao.submit(comment);
		}catch(Exception e) {
			e.printStackTrace();
		}
		return "redirect:select?contNum="+ session.getAttribute("num");
	}
}
