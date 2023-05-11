package QnABoard;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Timestamp;
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
	public List<Board> getList() throws Exception {
		List<Board> list = jdbcTemplate.query("select * from board", new RowMapper<Board>(){

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
				PreparedStatement pstmt = conn.prepareStatement("insert into board values(?,?,?,?,?,?,?,?)");
				pstmt.setLong(1, board.getNum());
				pstmt.setString(2, board.getId());
				pstmt.setString(3, board.getName());
				pstmt.setString(4, board.getTitle());
				pstmt.setString(5, board.getBody());
				pstmt.setString(6, board.getPw());
				pstmt.setTimestamp(7, Timestamp.valueOf(board.getDate()));
				pstmt.setLong(8, board.getView());
				return pstmt;
			}
		});
		
	}

	@Override
	public void delete(Board board) throws Exception {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void edit(Board board) throws Exception {
		// TODO Auto-generated method stub
		
	}

}
