package reservation;

import java.util.Date;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;

@Controller
public class ReservationUpdateController {
	private ReservationDao_InterFace reservationDao;
	
	public ReservationUpdateController setReservationDao_InterFace(ReservationDao_InterFace reservationDao) {
		this.reservationDao = reservationDao;
		return this;
	}

	@PostMapping("resupdate")
	public String resUpdate(ReservationDto reservationDto,HttpSession session) {
		try {
			reservationDao.update(reservationDto);
			Date date = reservationDto.getDate();
			String time = reservationDto.getTime();
			int person = reservationDto.getPerson();
			int price = reservationDto.getPrice();
			String notice = reservationDto.getNotice();
			
			session.setAttribute("date", date);
			session.setAttribute("time", time);
			session.setAttribute("person", person);
			session.setAttribute("price", price);
			session.setAttribute("notice", notice);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "ReservationCheck";
	}
	
	
}
