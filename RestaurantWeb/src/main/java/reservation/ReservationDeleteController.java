package reservation;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;

@Controller
public class ReservationDeleteController {
	private ReservationDao_InterFace reservationDao;
	
	public ReservationDeleteController setReservationDao_InterFace(ReservationDao_InterFace reservationDao) {
		this.reservationDao = reservationDao;
		return this;
	}
	
	@PostMapping("resdelete")
	public String resdelete(HttpSession session) {
		try {
			reservationDao.selectById((HttpSession) session.getAttribute("no"));
		} catch (Exception e) {
			// TODO: handle exception
		}
		return null;
	}
}
