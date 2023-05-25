package RestaurantJava;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;

@Controller
public class CommentEditController {
	private CommentDao commentDao;

	public CommentEditController setCommentDao(CommentDao commentDao) {
		this.commentDao = commentDao;
		return this;
	}

	@PostMapping("editComment")
	public String editComment(Comment comment) throws Exception{
		return null;

	}
}
