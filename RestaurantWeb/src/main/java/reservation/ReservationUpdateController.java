package reservation;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;

@Controller
public class ReservationUpdateController {
	private ReservationDao_InterFace reservationDao;
	
	public ReservationUpdateController setReservationDao_InterFace(ReservationDao_InterFace reservationDao) {
		this.reservationDao = reservationDao;
		return this;
	}

	@PostMapping("resUpdate")
	public String resUpdate(ReservationDao_InterFace reservationDao) {
		try {
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}
	
	
}
