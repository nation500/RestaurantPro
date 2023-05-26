package reservation;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;

@Configuration
public class ReservationControllerConfig {
	@Autowired
	private ReservationDao_InterFace reservationDao;
	
	@Bean
	public ReservationInsertController reservationInsertController() {
		ReservationInsertController reservationInsertController = new ReservationInsertController();
		return reservationInsertController.setReservationDao_InterFace(reservationDao);
				}
	@Bean
	public ReservationUpdateController reservationUpdateController() {
		ReservationUpdateController reservationUpdateController = new ReservationUpdateController();
		return reservationUpdateController.setReservationDao_InterFace(reservationDao);
	}
	
	@Bean
	public ReservationDeleteController reservationDeleteController() {
		ReservationDeleteController reservationDeleteController = new ReservationDeleteController();
		return reservationDeleteController.setReservationDao_InterFace(reservationDao);
	}
	
	@Bean
	public ReservationViewController reservationViewController() {
		ReservationViewController reservationViewController = new ReservationViewController();
		return reservationViewController.setReservationDao_InterFace(reservationDao);
	}
	
	@Bean
	public ReservationAllViewController reservationAllViewController() {
		ReservationAllViewController reservationAllViewController = new ReservationAllViewController();
		return reservationAllViewController.setReservationDao_InterFace(reservationDao);
	}
	
	@Bean
	public ReservationTodayListController reservationTodayListController() {
		ReservationTodayListController reservationTodayListController = new ReservationTodayListController();
		return reservationTodayListController.setReservationDao_InterFace(reservationDao);
	}
	
}
