package QnABoard;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.time.LocalDate;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.List;

import javax.sql.DataSource;

import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.PreparedStatementCreator;
import org.springframework.jdbc.core.RowMapper;

public class BoardDaoImpl implements BoardDao{
	private JdbcTemplate jdbcTemplate;
	
	public BoardDaoImpl(DataSource dataSource) {
		this.jdbcTemplate = new JdbcTemplate(dataSource);
	}
	
	@Override
	public List<Board> getList(int i) throws Exception {
		List<Board> list = jdbcTemplate.query("select * from board order by num DESC, date DESC LIMIT" + (i - 1) * 12 + ", 12", new RowMapper<Board>(){

			@Override
			public Board mapRow(ResultSet rs, int rowNum) throws SQLException {
				Board board = new Board();
				board.setNum(rs.getLong("num"));
				board.setId(rs.getString("id"));
				board.setName(rs.getString("name"));
				board.setTitle(rs.getString("title"));
				board.setBody(rs.getString("body"));
				board.setPw(rs.getString("pw"));
				board.setDate(rs.getTimestamp("date").toLocalDateTime());
				board.setView(rs.getLong("view"));
				return board;
			}});
		return list;
	}

	@Override
	public List<Board> selectById(String id) throws Exception {
		List<Board> list = jdbcTemplate.query("select * from board where id = ?", new RowMapper<Board>(){

			@Override
			public Board mapRow(ResultSet rs, int rowNum) throws SQLException {
				Board board = new Board();
				board.setNum(rs.getLong("num"));
				board.setId(rs.getString("id"));
				board.setName(rs.getString("name"));
				board.setTitle(rs.getString("title"));
				board.setBody(rs.getString("body"));
				board.setPw(rs.getString("pw"));
				board.setDate(rs.getTimestamp("date").toLocalDateTime());
				board.setView(rs.getLong("view"));
				return board;
			}}, id);
		return list.isEmpty() ? null : list;
	}

	@Override
	public void submit(Board board) throws Exception {
		jdbcTemplate.update(new PreparedStatementCreator() {
			
			@Override
			public PreparedStatement createPreparedStatement(Connection conn) throws SQLException {
				PreparedStatement pstmt = conn.prepareStatement("insert into board (id, name, title, body, pw, date, view) values(?,?,?,?,?,?,?)");
				pstmt.setString(1, board.getId());
				pstmt.setString(2, board.getName());
				pstmt.setString(3, board.getTitle());
				pstmt.setString(4, board.getBody());
				pstmt.setString(5, board.getPw());
				pstmt.setTimestamp(6, Timestamp.valueOf(LocalDateTime.now()));
				pstmt.setLong(7, 0);
				return pstmt;
			}
		});
		
	}

	@Override
	public void delete(Board board) throws Exception {
//		jdbcTemplate.update("delete from board where") delete와 edit 식별을 뭘로할까.
	}

	@Override
	public void edit(Board board) throws Exception {
//		jdbcTemplate.update("update member set title=?, body=? where", )
		
	}

	@Override
	public int getListCnt() throws Exception {
		String query = "select count(*) from board";
		int rowCount = jdbcTemplate.queryForObject(query, Integer.class);
		return rowCount;
	}

}
