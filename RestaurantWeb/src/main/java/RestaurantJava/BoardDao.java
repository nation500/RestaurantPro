package RestaurantJava;

import java.util.List;

public interface BoardDao {
	List<Board> getList(int i) throws Exception;
	List<Board> selectById(String id) throws Exception;
	void submit(Board board) throws Exception;
	void delete(Board board) throws Exception;
	void edit(Board board) throws Exception;
	int getListCnt() throws Exception;
}
