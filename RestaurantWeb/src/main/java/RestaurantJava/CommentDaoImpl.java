package RestaurantJava;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.time.LocalDateTime;
import java.util.List;

import javax.sql.DataSource;

import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.PreparedStatementCreator;
import org.springframework.jdbc.core.RowMapper;

public class CommentDaoImpl implements CommentDao{
	private JdbcTemplate jdbcTemplate;
	
	public CommentDaoImpl(DataSource dataSource) {
		this.jdbcTemplate = new JdbcTemplate(dataSource);
	}
	
	@Override
	public List<Comment> getComments(long i) throws Exception {
		List<Comment> list = jdbcTemplate.query("select * from comment where hq = ? order by date DESC" , new RowMapper<Comment>() {

			@Override
			public Comment mapRow(ResultSet rs, int rowNum) throws SQLException {
				Comment comment = new Comment();
				comment.setNum(rs.getLong("num"));
				comment.setHq(rs.getLong("hq"));
				comment.setId(rs.getString("id"));
				comment.setName(rs.getString("name"));
				comment.setBody(rs.getString("body"));
				comment.setDate(rs.getTimestamp("date").toLocalDateTime());
				return comment;
			}}, i);
		return list.isEmpty() ? null:list;
	}

	@Override
	public void submit(Comment comment) throws Exception {
		jdbcTemplate.update(new PreparedStatementCreator() {
			
			@Override
			public PreparedStatement createPreparedStatement(Connection conn) throws SQLException {
				PreparedStatement pstmt = conn.prepareStatement("insert into comment (hq, id, name, body, date) values(?,?,?,?,?)");
				pstmt.setLong(1, comment.getHq());
				pstmt.setString(2, comment.getId());
				pstmt.setString(3, comment.getName().substring(0, 1) + "****");
				pstmt.setString(4, comment.getBody());
				pstmt.setTimestamp(5, Timestamp.valueOf(LocalDateTime.now()));
				return pstmt;
			}
		});
	}

	@Override
	public void delete(long num) throws Exception {
		jdbcTemplate.update("delete from comment where num = ?", num);
		
	}

	@Override
	public void edit(Comment comment, long num) throws Exception {
		jdbcTemplate.update("update comment set body=? where num=?", comment.getBody(), num);
		
	}

}
