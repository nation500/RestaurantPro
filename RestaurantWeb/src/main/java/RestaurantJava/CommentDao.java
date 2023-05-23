package RestaurantJava;

import java.util.List;

public interface CommentDao {
	List<Comment> getComments(long i) throws Exception;
	void submit(Comment comment) throws Exception;
	void delete(long num) throws Exception;
	void edit(Comment comment, long num) throws Exception;
}
