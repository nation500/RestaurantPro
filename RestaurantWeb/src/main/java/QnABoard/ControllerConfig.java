package QnABoard;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;

@Configuration
public class ControllerConfig implements WebMvcConfigurer {
	@Autowired
	private BoardDao boardDao;
	
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
}
