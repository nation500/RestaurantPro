package RestaurantJava;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;
@Controller
public class BoardSearchController {
	private BoardDao boardDao;

	public BoardSearchController setBoardDao(BoardDao boardDao) {
		this.boardDao = boardDao;
		return this;
	}

	@GetMapping("search")
	public String search(@RequestParam("keyword") String keyword, @RequestParam("page") String page, HttpSession session) {
		int i = Integer.parseInt(page);
		try {
			List<Board> list = boardDao.searchByKeyword(keyword, i);
			int cnt = boardDao.getSearchedCnt(keyword);
			int Bcnt = ((cnt - 1) / 12) + 1;
			if(list == null) {
				return "BoardNull";
			}
			session.setAttribute("Bcnt", Bcnt);
			session.setAttribute("list", list);
			session.setAttribute("cnt", cnt);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "BoardMain";
	}
}