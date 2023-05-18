package reservation;

import java.sql.Connection;
import java.sql.Date;
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
	
	public List<ReservationDto> selectById(String id) throws Exception {
	    List<ReservationDto> list = jdbcTemplate.query("select * from reservation where id = ? AND date >= CURRENT_DATE() ORDER BY date ASC", 
	        new RowMapper<ReservationDto>() {
	            @Override
	            public ReservationDto mapRow(ResultSet rs, int rowNum) throws SQLException{
	                ReservationDto reservationDto = new ReservationDto();
	                reservationDto.setNo(rs.getLong("no"));
	                reservationDto.setId(rs.getString("id"));
	                reservationDto.setName(rs.getString("name"));
	                reservationDto.setPhone(rs.getString("phone"));
	                reservationDto.setDate(rs.getDate("date"));
	                reservationDto.setTime(rs.getString("time"));
	                reservationDto.setPerson(rs.getInt("person"));
	                reservationDto.setNotice(rs.getString("notice"));
	                return reservationDto;
	            }
	        }, id);
	    return list.isEmpty() ? null : list;
	    
	   
	}
	// 모든 테이블값 출력 오늘지난 날짜 제외
	public List<ReservationDto> selectList() throws Exception	{
		Date date = null;
		
		
		List<ReservationDto> allList = JdbcTemplate.query("select * from reservation where date >= CURRENT_DATE() order by date asc",
				new RowMapper<ReservationDto>() {
				@Override
				public ReservationDto mapRow(ResultSet rs, int rowNum) throws SQLException{
					ReservationDto reservationDto = new ReservationDto();
					reservationDto.setNo(rs.getLong("no"));
					reservationDto.setId(rs.getString("id"));
					reservationDto.setName(rs.getString("name"));
					reservationDto.setPhone(rs.getString("phone"));
					reservationDto.setDate(rs.getDate("date"));
					reservationDto.setTime(rs.getString("time"));
					reservationDto.setPerson(rs.getInt("person"));
					reservationDto.setNotice(rs.getString("notice"));
					return reservationDto;
				}
		}, date); 
		return allList.isEmpty() ? null: allList;
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
		HttpServletRequest request = ((ServletRequestAttributes) RequestContextHolder.getRequestAttributes()).getRequest();
		HttpSession session = request.getSession(true);
		String no = request.getParameter("no");
		
		jdbcTemplate.update("update reservation set date=?, time=?, person=?, notice=? where no=?",
				res.getDate(), res.getTime(), res.getPerson(), res.getNotice(), no);
	}
	
	// 삭제
	public void delete(long no) throws Exception {
		jdbcTemplate.update("delete from reservation where no= ?", no);
	}


	
}
