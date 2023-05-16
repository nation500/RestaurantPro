package RecycleBin;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

import RestaurantJava.BoardDao;

@Controller
public class ShowBoardController {
	private BoardDao boardDao;
	
	public ShowBoardController setBoardDao(BoardDao boardDao) {
		this.boardDao = boardDao;
		return this;
	}
	
	@GetMapping("showBoard")
	public String showBoard(HttpSession session)throws Exception{
		int cnt = boardDao.getListCnt();
		int Bcnt = ((cnt - 1)/12) + 1;
		session.setAttribute("Bcnt", Bcnt);
	return "BoardMain";
	}
}
