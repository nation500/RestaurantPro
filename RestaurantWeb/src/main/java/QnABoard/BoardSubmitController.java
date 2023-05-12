package QnABoard;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;

@Controller
public class BoardSubmitController {
	private BoardDao boardDao;
	
	public BoardSubmitController setBoardDao(BoardDao boardDao) {
		this.boardDao = boardDao;
		return this;
	}
	
	@PostMapping("submitBoard")
	public String submitBoard(Board board)throws Exception{
		try {
			boardDao.submit(board);
		}catch(Exception e) {
			e.printStackTrace();
		}
		return "BoardPage";
	}
}
