package RestaurantJava;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;

import com.mysql.cj.Session;

@Controller
public class BoardSubmitController {
	private BoardDao boardDao;
	
	public BoardSubmitController setBoardDao(BoardDao boardDao) {
		this.boardDao = boardDao;
		return this;
	}
	
	@PostMapping("submitBoard")
	public String submitBoard(Board board){
		try {
			boardDao.submit(board);
		}catch(Exception e) {
			e.printStackTrace();
		}
		return "WriteAfter"; //submit 이후 리스트 처리가 안 되고있음. 컨트롤러 하나 따로 만들기(해결)
	}
}
