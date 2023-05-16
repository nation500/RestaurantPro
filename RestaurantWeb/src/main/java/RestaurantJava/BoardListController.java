package RestaurantJava;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
public class BoardListController {
	private BoardDao boardDao;
	
	public BoardListController setBoardDao(BoardDao boardDao) {
		this.boardDao = boardDao;
		return this;
	}
	
	@GetMapping("board")
	public String select(HttpSession session, @RequestParam("page") String page) throws Exception{
		try {
			int i = Integer.parseInt(page);
			List<Board> list = boardDao.getList(i);
			if(list == null || list.size() == 0) {
				return "BoardNull";
			}
			session.setAttribute("list", list);
			int cnt = boardDao.getListCnt();
			int Bcnt = ((cnt - 1)/12) + 1;
			session.setAttribute("Bcnt", Bcnt);
		}catch(Exception e) {
			e.printStackTrace();

		}
		return "BoardMain";
		
	}
}
