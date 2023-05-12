package reservation;

import java.beans.PropertyVetoException;

import javax.sql.DataSource;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;

import com.mchange.v2.c3p0.ComboPooledDataSource;
@Configuration
public class ReservationConfig {
	@Bean(destroyMethod = "close")
	public DataSource dataSource() {
		ComboPooledDataSource dataSource = new ComboPooledDataSource();
		try {
			dataSource.setDriverClass("com.mysql.cj.jdbc.Driver");
		} catch (PropertyVetoException e) {
			// TODO: handle exception
			throw new RuntimeException();
		}
		dataSource.setJdbcUrl("jdbc:mysql://localhost:3306/webproject");
		dataSource.setUser("root");
		dataSource.setPassword("java");
		return dataSource;
		
	}
	@Bean
	public ReservationDao_InterFace reservationDao() {
		return new ReservationDaoImpl(dataSource());
	}

	
	
}
