package reservation;

import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;

@Controller
public class ReservationAllViewController {
		private ReservationDao_InterFace reservationDao;
		
		public ReservationAllViewController setReservationDao_InterFace(ReservationDao_InterFace reservationDao) {
			this.reservationDao = reservationDao;
			return this;
		}
		
		@PostMapping("alllist")
		public String allList (Model model) throws Exception{
			try {
				List<ReservationDto> reservationallview = reservationDao.alllist();
				model.addAttribute("reservationallview",reservationallview);
			} catch (Exception e) {
				e.printStackTrace();
			}
			return "ReservationAllview";
		}
		
	}
