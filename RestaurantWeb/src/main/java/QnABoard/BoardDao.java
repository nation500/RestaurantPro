package QnABoard;

import java.util.List;

public interface BoardDao {
	List<Board> getList() throws Exception;
	List<Board> selectById(String id) throws Exception;
	void submit(Board board) throws Exception;
	void delete(Board board) throws Exception;
	void edit(Board board) throws Exception;
}
