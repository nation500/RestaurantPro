package reservation;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class ReservationViewController {
	private ReservationDao_InterFace reservationDao;
	public ReservationViewController setReservationDao_InterFace(ReservationDao_InterFace reservationDao) {
		this.reservationDao = reservationDao;
		return this;
	}
	
	@GetMapping("resview")
	public String view(Model model, HttpSession session) throws Exception{
		
		model.addAttribute("", reservationDao.selectById(session));
		return "ReservationCheck";
	}
}
