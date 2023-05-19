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

public class BoardDaoImpl implements BoardDao {
	private JdbcTemplate jdbcTemplate;

	public BoardDaoImpl(DataSource dataSource) {
		this.jdbcTemplate = new JdbcTemplate(dataSource);
	}

	@Override
	public List<Board> getList(long i) throws Exception {
		List<Board> list = jdbcTemplate.query(
				"select * from board order by num DESC, date DESC LIMIT " + (i - 1) * 12 + ", 12",
				new RowMapper<Board>() {

					@Override
					public Board mapRow(ResultSet rs, int rowNum) throws SQLException {
						Board board = new Board();
						board.setNum(rs.getLong("num"));
						board.setId(rs.getString("id"));
						board.setName(rs.getString("name"));
						board.setTitle(rs.getString("title"));
						board.setBody(rs.getString("body"));
						board.setDate(rs.getTimestamp("date").toLocalDateTime());
						board.setView(rs.getLong("view"));
						return board;
					}
				});
		return list;
	}

	@Override
	public List<Board> selectById(String id) throws Exception {
		List<Board> list = jdbcTemplate.query("select * from board where id = ?", new RowMapper<Board>() {

			@Override
			public Board mapRow(ResultSet rs, int rowNum) throws SQLException {
				Board board = new Board();
				board.setNum(rs.getLong("num"));
				board.setId(rs.getString("id"));
				board.setName(rs.getString("name"));
				board.setTitle(rs.getString("title"));
				board.setBody(rs.getString("body"));
				board.setDate(rs.getTimestamp("date").toLocalDateTime());
				board.setView(rs.getLong("view"));
				return board;
			}
		}, id);
		return list.isEmpty() ? null : list;
	}

	@Override
	public void submit(Board board) throws Exception {
		jdbcTemplate.update(new PreparedStatementCreator() {

			@Override
			public PreparedStatement createPreparedStatement(Connection conn) throws SQLException {
				PreparedStatement pstmt = conn
						.prepareStatement("insert into board (id, name, title, body, date, view) values(?,?,?,?,?,?)");
				pstmt.setString(1, board.getId());
				pstmt.setString(2, board.getName().substring(0, 1) + "****");
				pstmt.setString(3, board.getTitle());
				pstmt.setString(4, board.getBody());
				pstmt.setTimestamp(5, Timestamp.valueOf(LocalDateTime.now()));
				pstmt.setLong(6, 0);
				return pstmt;
			}
		});

	}

	@Override
	public void delete(long num) throws Exception {
		jdbcTemplate.update("delete from board where num=?", num);
	}

	@Override
	public void edit(Board board, long num) throws Exception {
		jdbcTemplate.update("update board set title=?, body=? where num=?", board.getTitle(), board.getBody(), num);

	}

	@Override
	public int getListCnt() throws Exception {
		String query = "select count(*) from board";
		int rowCount = jdbcTemplate.queryForObject(query, Integer.class);
		return rowCount;
	}

	@Override
	public Board selectByNum(long num) throws Exception {
		Board board = jdbcTemplate.queryForObject("select * from board where num=?", new RowMapper<Board>() {

			@Override
			public Board mapRow(ResultSet rs, int rowNum) throws SQLException {
				Board board = new Board();
				board.setNum(rs.getLong("num"));
				board.setId(rs.getString("id"));
				board.setName(rs.getString("name"));
				board.setTitle(rs.getString("title"));
				board.setBody(rs.getString("body"));
				board.setDate(rs.getTimestamp("date").toLocalDateTime());
				board.setView(rs.getLong("view") + 1);
				return board;
			}
		}, num);
		return board;
	}

	@Override
	public void viewUp(long num) throws Exception {
		jdbcTemplate.update("update board set view=view+1 where num = ?", num);
	}

	@Override
	public List<Board> searchByKeyword(String keyword, long i) throws Exception {
		List<Board> list = jdbcTemplate.query(
				"select * from board where title like concat('%', ? , '%') or body like concat('%', ?, '%') order by num DESC, date DESC LIMIT ?, 12",
				new Object[] { keyword, keyword, (i - 1) * 12 }, new RowMapper<Board>() {
					@Override
					public Board mapRow(ResultSet rs, int rowNum) throws SQLException {
						Board board = new Board();
						board.setNum(rs.getLong("num"));
						board.setId(rs.getString("id"));
						board.setName(rs.getString("name"));
						board.setTitle(rs.getString("title"));
						board.setBody(rs.getString("body"));
						board.setDate(rs.getTimestamp("date").toLocalDateTime());
						board.setView(rs.getLong("view"));
						return board;
					}
				});
		return list.isEmpty() ? null : list;
	}

	@Override
	public int getSearchedCnt(String keyword) throws Exception {
		String query = "select count(*) from board where title like concat('%', ? , '%') or body like concat('%', ?, '%')";
		int rowCount = jdbcTemplate.queryForObject(query, Integer.class, keyword, keyword);
		return rowCount;
	}

}
