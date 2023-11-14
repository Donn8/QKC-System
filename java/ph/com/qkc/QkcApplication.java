package ph.com.qkc;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.data.jpa.repository.config.EnableJpaRepositories;

@SpringBootApplication
@ComponentScan("ph.com.qkc.*")
@EnableJpaRepositories("ph.com.qkc.repository")
public class QkcApplication {

	public static void main(String[] args) {
		SpringApplication.run(QkcApplication.class, args);
	}

}
