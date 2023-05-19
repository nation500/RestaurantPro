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
	public String select(HttpSession session, @RequestParam("page") String page) throws Exception {
		try {
			int i = Integer.parseInt(page);
			if (session.getAttribute("searched") == null) {
				List<Board> list = boardDao.getList(i);
				session.setAttribute("list", list);
				int cnt = boardDao.getListCnt();
				int Bcnt = ((cnt - 1) / 12) + 1;
				session.setAttribute("Bcnt", Bcnt);
			} else { // 검색시
				int cnt = (int) session.getAttribute("cnt");
				int Bcnt = ((cnt - 1) / 12) + 1;
				session.setAttribute("Bcnt", Bcnt);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "BoardMain";
	}
}	// 현재 searched세션 관리가 안되는건지 다시 게시판에 들어갔을 때 검색된 상태가 유지됨
