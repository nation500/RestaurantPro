package reservation;

import java.util.Date;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;

@Controller
public class ReservationInsertController {
	private ReservationDao_InterFace reservationDao;
	
	public ReservationInsertController setReservationDao_InterFace(ReservationDao_InterFace reservationDao) {
		this.reservationDao = reservationDao;
		return this;
	}
	
	@PostMapping("resinsert")
	public String resinsert(ReservationDto reservationDto,HttpSession session) {
		try {
			reservationDao.insert(reservationDto);
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
		}catch(Exception e) {
			e.printStackTrace();
		}
		return "ReservationCheck";
	}
		
}