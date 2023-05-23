package reservation;

import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;

@Controller
public class ReservationTodayListController {
	private ReservationDao_InterFace reservationDao;
	
	public ReservationTodayListController setReservationDao_InterFace(ReservationDao_InterFace reservationDao) {
		this.reservationDao = reservationDao;
		return this;
	}
	
	@PostMapping("todaylist")
	public String todaylist (Model model) throws Exception{
		try {
			List<ReservationDto> reservationDtotodayList = reservationDao.todaylist();
			model.addAttribute("reservationtodaylist",reservationDtotodayList);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "ReservationTodayList";
	}
	
}
