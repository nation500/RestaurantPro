package RestaurantJava;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;

@Configuration
public class ControllerConfig implements WebMvcConfigurer {
	@Autowired
	private MemberDao memberDao;
	@Autowired
	private BoardDao boardDao;

	@Bean
	public LoginController loginController() {
		LoginController loginController = new LoginController();
		return loginController.setMemberDao(memberDao);
	}

	@Bean
	public LogoutController logoutController() {
		LogoutController logoutController = new LogoutController();
		return logoutController;
	}

	@Bean
	public MemberInsertController memberInsertController() {
		MemberInsertController memberInsertController = new MemberInsertController();
		return memberInsertController.setMemberDao(memberDao);
	}

	@Bean
	public MemberDeleteController memberDeleteController() {
		MemberDeleteController memberDeleteController = new MemberDeleteController();
		return memberDeleteController.setMemberDao(memberDao);
	}

	@Bean
	public MemberUpdateController memberUpdateController() {
		MemberUpdateController memberUpdateController = new MemberUpdateController();
		return memberUpdateController.setMemberDao(memberDao);
	}

	@Bean
	public BoardListController boardListController() {
		BoardListController boardListController = new BoardListController();
		return boardListController.setBoardDao(boardDao);
	}

	@Bean
	public BoardSubmitController boardSubmitController() {
		BoardSubmitController boardSubmitController = new BoardSubmitController();
		return boardSubmitController.setBoardDao(boardDao);
	}
	@Bean
	public BoardWriteController boardWriteController() {
		BoardWriteController boardWriteController = new BoardWriteController();
		return boardWriteController;
	}
	@Bean
	public BoardDeleteController boardDeleteController() {
		BoardDeleteController boardDeleteController = new BoardDeleteController();
		return boardDeleteController.setBoardDao(boardDao);
	}
	@Bean
	public BoardEditController boardEditController() {
		BoardEditController boardEditController = new BoardEditController();
		return boardEditController.setBoardDao(boardDao);
	}
	@Bean
	public BoardSelectController boardSelectController() {
		BoardSelectController boardSelectController = new BoardSelectController();
		return boardSelectController.setBoardDao(boardDao);
	}
	@Bean
	public BoardSearchController boardSearchController() {
		BoardSearchController boardSearchController = new BoardSearchController();
		return boardSearchController.setBoardDao(boardDao);
	}
}
