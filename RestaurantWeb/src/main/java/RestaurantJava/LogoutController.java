package RestaurantJava;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class LogoutController {
	@GetMapping("logout")
	public String logout(HttpSession session)/*, HttpServletRequest request, HttpServletResponse response throws Exception*/ {
		session.invalidate();
//		request.setCharacterEncoding("text/html;charset=UTF-8");
//		PrintWriter out = response.getWriter();
//		out.println("<script>alert('성공적으로 로그아웃 되었습니다')</script>");
		return "redirect:LogoutSuccess.jsp";
	}
}
