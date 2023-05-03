package RestaurantJava;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;


@Configuration
public class ControllerConfig implements WebMvcConfigurer {
	@Autowired
	private MemberDao_Interface MemberDao;

	@Bean
	public LoginController loginController() {
		LoginController loginController = new LoginController();
		return loginController.setMemberDao(MemberDao);
	}

	@Bean
	public MemberInsertController memberInsertController() {
		MemberInsertController memberInsertController = new MemberInsertController();
		return memberInsertController.setMemberDao(MemberDao);
	}

	@Bean
	public MemberDeleteController memberDeleteController() {
		MemberDeleteController memberDeleteController = new MemberDeleteController();
		return memberDeleteController.setMemberDao(MemberDao);
	}

	@Bean
	public MemberUpdateController memberUpdateController() {
		MemberUpdateController memberUpdateController = new MemberUpdateController();
		return memberUpdateController.setMemberDao(MemberDao);
	}
}
