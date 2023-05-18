package reservation;

import java.util.List;

public interface ReservationDao_InterFace {
	List<ReservationDto> selectList(date date) throws Exception;
	void insert(ReservationDto res) throws Exception;
	void update(ReservationDto res) throws Exception;
	void delete(long no) throws Exception;
	List<ReservationDto> selectById(String id) throws Exception;
	
}
