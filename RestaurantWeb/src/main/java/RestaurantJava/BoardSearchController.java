package RestaurantJava;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
public class BoardSearchController {
	private BoardDao boardDao;

	public BoardSearchController setBoardDao(BoardDao boardDao) {
		this.boardDao = boardDao;
		return this;
	}

	@PostMapping("search")
	public String search(@RequestParam("keyword") String keyword, @RequestParam("page") String page, HttpSession session) {
		int i = Integer.parseInt(page);
		try {
			List<Board> list = boardDao.searchByKeyword(keyword, i);
			int cnt = boardDao.getSearchedCnt(keyword);
			if(list == null) {
				return "BoardNull";
			}
			session.setAttribute("list", list);
			session.setAttribute("cnt", cnt);
			session.setAttribute("searched", true);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "redirect:board?page=" + page;
	}
}
