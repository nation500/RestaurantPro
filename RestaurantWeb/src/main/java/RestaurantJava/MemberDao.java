package RestaurantJava;

public interface MemberDao{
	Member selectById(String id) throws Exception;
	Member exist(String id, String pw) throws Exception;
	void insert(Member member) throws Exception;
	void update(Member member) throws Exception;
	void delete(String id) throws Exception;
}