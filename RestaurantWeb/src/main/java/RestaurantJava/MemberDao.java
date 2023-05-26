package RestaurantJava;

import java.util.List;

public interface MemberDao{
	Member selectById(String id) throws Exception;
	Member exist(String id, String pw) throws Exception;
	Member findId(String name, String phone) throws Exception;
	Member findPw(String id, String name, String phone) throws Exception;
	List<String> getIds() throws Exception;
	void insert(Member member) throws Exception;
	void update(Member member) throws Exception;
	void delete(String id) throws Exception;
}