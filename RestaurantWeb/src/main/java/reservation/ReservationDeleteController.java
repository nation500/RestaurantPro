package reservation;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
public class ReservationDeleteController {
	private ReservationDao_InterFace reservationDao;
	
	public ReservationDeleteController setReservationDao_InterFace(ReservationDao_InterFace reservationDao) {
		this.reservationDao = reservationDao;
		return this;
	}
	
	@PostMapping("resdelete")
	public String resdelete(@RequestParam("no")Long no) {
		try {
			reservationDao.delete(no);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "redirect:ReservationList";
	}
}
