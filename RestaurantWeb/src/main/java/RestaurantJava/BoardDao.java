package RestaurantJava;

import java.util.List;

public interface BoardDao {
	List<Board> getList(long i) throws Exception;
	List<Board> selectById(String id) throws Exception;
	List<Board> searchByKeyword(String keyword, long i) throws Exception;
	int getSearchedCnt(String keyword) throws Exception;
	Board selectByNum(long num) throws Exception;
	void submit(Board board) throws Exception;
	void delete(long num) throws Exception;
	void edit(Board board, long num) throws Exception;
	int getListCnt() throws Exception;
	void viewUp(long num) throws Exception;
}
