package reservation;

import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.SessionAttribute;

@Controller
public class ReservationViewController {
	private ReservationDao_InterFace reservationDao;
	
	public ReservationViewController setReservationDao_InterFace(ReservationDao_InterFace reservationDao) {
		this.reservationDao = reservationDao;
		return this;
	}
	
	@PostMapping("resview")
	public String view(Model model, @SessionAttribute("id")String id,
			@SessionAttribute("name") String name, @SessionAttribute("phone")String phone) throws Exception{
		try {
			List<ReservationDto> reservationDtoList = reservationDao.selectById(id);
			model.addAttribute("reservationList", reservationDtoList);
		}catch (Exception e) {
			e.printStackTrace();
		}
		
		return "ReservationList";
	}
}
