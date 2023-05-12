package reservation;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.sql.DataSource;

import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.PreparedStatementCreator;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;

public class ReservationDaoImpl implements ReservationDao_InterFace{
	private JdbcTemplate jdbcTemplate;
	
	
	public ReservationDaoImpl(DataSource dataSource) {
		this.jdbcTemplate = new JdbcTemplate(dataSource);
	}
	
	public ReservationDto selectById(HttpSession session) throws Exception {
		String user_id = (String) session.getAttribute("id");
		String name = (String) session.getAttribute("name");
		String phone = (String) session.getAttribute("phone");
		
		List<ReservationDto> list = jdbcTemplate.query("select * from reservation where id= ?", new RowMapper<ReservationDto>() {
			
			@Override
			public ReservationDto mapRow(ResultSet rs, int rowNum) throws SQLException{
				ReservationDto reservationDto = new ReservationDto();
				reservationDto.setNo(rs.getLong("no"));
				reservationDto.setId(user_id);
				reservationDto.setName(name);
				reservationDto.setPhone(phone);
				reservationDto.setDate(rs.getDate("date"));
				reservationDto.setTime(rs.getString("time"));
				reservationDto.setPerson(rs.getInt("person"));
				reservationDto.setNotice(rs.getString("notice"));
				
				reservationDto.setSessionDate((String)session.getAttribute("date"));
				reservationDto.setSessionTime((String)session.getAttribute("time"));
				reservationDto.setSessionPerson((Integer)session.getAttribute("person"));
				reservationDto.setSessionNotice((String)session.getAttribute("notice"));
				
				return reservationDto;
		}}, user_id);
		return list.isEmpty() ? null : list.get(0);
	}

	public void insert(ReservationDto res) throws Exception {
		HttpServletRequest request = ((ServletRequestAttributes) RequestContextHolder.getRequestAttributes()).getRequest();
		HttpSession session = request.getSession(true);
		String id = (String)session.getAttribute("id");
		String name = (String)session.getAttribute("name");
		String phone = (String)session.getAttribute("phone");
		res.setId(id);
		res.setName(name);
		res.setPhone(phone);
		
		jdbcTemplate.update(new PreparedStatementCreator() {
			
			@Override
			public PreparedStatement createPreparedStatement(Connection conn) throws SQLException {
				PreparedStatement pstmt = conn.prepareStatement("insert into reservation(id,name,phone,date,time,person,price,notice) values(?,?,?,?,?,?,?,?)");
				pstmt.setString(1, res.getId());
				pstmt.setString(2, res.getName());
				pstmt.setString(3, res.getPhone());
				pstmt.setDate(4, res.getDate());
				pstmt.setString(5, res.getTime());
				pstmt.setInt(6, res.getPerson());
				pstmt.setInt(7, res.getPrice());
				pstmt.setString(8, res.getNotice());
				return pstmt;
				
			}
		});
	}

	public void update(ReservationDto res) throws Exception {
		//세션에서 id 가져오기
		HttpServletRequest request = ((ServletRequestAttributes)RequestContextHolder.getRequestAttributes()).getRequest();
		HttpSession session = request.getSession(true);
		String id = (String) session.getAttribute("id");
		
		jdbcTemplate.update("update reservation set date=?, time=?, person=?, notice=? where id=?",
				res.getDate(), res.getTime(), res.getPerson(), res.getNotice(), id);
	}

	public void delete(HttpServletRequest request) throws Exception {
		HttpSession session = request.getSession();
		int no = (int)session.getAttribute("no");
		jdbcTemplate.update("delete from reservation where no= ?", no);
	}

	public List<ReservationDto> selectList() throws Exception {
		// TODO Auto-generated method stub
		return null;
	}
	
	
	
	
}
