package RestaurantJava;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

import javax.sql.DataSource;

import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.PreparedStatementCreator;
import org.springframework.jdbc.core.RowMapper;

public class MemberDaoImpl implements MemberDao{
	private JdbcTemplate jdbcTemplate;
	
	public MemberDaoImpl(DataSource dataSource) {
		this.jdbcTemplate = new JdbcTemplate(dataSource);
	}
	
	@Override
	public Member selectById(String id) throws Exception {
		List<Member> list = jdbcTemplate.query("select * from member where id = ?", new RowMapper<Member>() {

			@Override
			public Member mapRow(ResultSet rs, int rowNum) throws SQLException {
				Member member = new Member();
				member.setId(rs.getString("id"));
				member.setPw(rs.getString("pw"));
				member.setName(rs.getString("name"));
				member.setPhone(rs.getString("phone"));
				return member;
			}}, id);
		return list.isEmpty() ? null : list.get(0);
	}

	@Override
	public Member exist(String id, String pw) throws Exception {
		List<Member> list = jdbcTemplate.query("select * from member where id = ? and pw = ?", new RowMapper<Member>() {

			@Override
			public Member mapRow(ResultSet rs, int rowNum) throws SQLException {
				Member member = new Member();
				member.setId(rs.getString("id"));
				member.setPw(rs.getString("pw"));
				member.setName(rs.getString("name"));
				member.setPhone(rs.getString("phone"));
				return member;
			}}, id, pw);
		return list.isEmpty() ? null : list.get(0);
	}

	@Override
	public void insert(Member member) throws Exception {
		jdbcTemplate.update(new PreparedStatementCreator() {
			
			@Override
			public PreparedStatement createPreparedStatement(Connection conn) throws SQLException {
				PreparedStatement pstmt = conn.prepareStatement("insert into member values(?,?,?,?)");
				pstmt.setString(1, member.getId());
				pstmt.setString(2, member.getPw());
				pstmt.setString(3, member.getName());
				pstmt.setString(4, member.getPhone());
				return pstmt;
			}
		});
		
	}

	@Override
	public void update(Member member) throws Exception {
		jdbcTemplate.update("update member set pw=?, phone=? where id=?", member.getPw(), member.getPhone(), member.getId());
		
	}

	@Override
	public void delete(String id) throws Exception {
		jdbcTemplate.update("delete from member where id = ?", id);
	}

	@Override
	public List<String> getIds() throws Exception {
		List<String> ids = jdbcTemplate.queryForList("select id from member", String.class);
		return ids;
	}
	
}
