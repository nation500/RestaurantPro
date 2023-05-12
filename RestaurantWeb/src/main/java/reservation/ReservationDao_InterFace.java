package reservation;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

public interface ReservationDao_InterFace {
	List<ReservationDto> selectList() throws Exception;
	void insert(ReservationDto res) throws Exception;
	void update(ReservationDto res) throws Exception;
	void delete(HttpServletRequest request) throws Exception;
	ReservationDto selectById(HttpSession session) throws Exception;
}
