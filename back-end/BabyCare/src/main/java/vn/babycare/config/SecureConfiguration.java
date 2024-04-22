package vn.babycare.config;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.config.annotation.authentication.builders.AuthenticationManagerBuilder;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.config.annotation.web.configuration.WebSecurityConfigurerAdapter;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;


@Configuration
@EnableWebSecurity
public class SecureConfiguration extends WebSecurityConfigurerAdapter{
	@Override
	protected void configure(final HttpSecurity http) throws Exception {

		// Bat dau cau hinh
		http.csrf().disable().authorizeRequests() // Bat cac request tu browser

		// Cho phep cac request, static resources khong bi rang buoc login
		.antMatchers("/frontend/**", "/backend/**", "/FileUpload/**", "/login", "/logout").permitAll()

		// Cac requests kieu "/admin/**" phai login (xac thuc)
		 .antMatchers("/admin/**").authenticated()
		 .antMatchers("/staff/**").authenticated()//step 1+2
		// Cac request kieu /admin/** phai co role la ADMIN //step 3
		//.antMatchers("/admin/**").hasAuthority("ADMIN")

		.and()

		// Neu chua login (xac thuc) thi redirect den trang login
		// Voi "/login" la 1 request (trong LoginController)
		.formLogin().loginPage("/login").loginProcessingUrl("/login_processing_url")

		 .defaultSuccessUrl("/admin/home", true)
		// Login thành công: chuyển đén request phù hợp với role step 3
		//.successHandler(new UrlAuthenticationSuccessHandler()) // Login thanh cong: Chuyen den request phu hop voi role step 3

		// Login khong thanh cong
		.failureUrl("/login?login_error=true")

		.and()

		.logout().logoutUrl("/logout").logoutSuccessUrl("/login").invalidateHttpSession(true)
		.deleteCookies("JSESSIONID")
		
		.and().rememberMe().key("uniqueAndSecret").tokenValiditySeconds(86400);
	}
	
//	@Autowired
//	private UserDetailsServiceImpl userDetailsService;
//
//	@Autowired
//	public void configureGlobal(AuthenticationManagerBuilder auth) throws Exception {
//		auth.userDetailsService(userDetailsService).passwordEncoder(new BCryptPasswordEncoder(4));
//	}

//	public static void main(String[] args) {
//		//System.out.println(new BCryptPasswordEncoder(4).encode("456"));
//		System.out.println(new BCryptPasswordEncoder(4).encode("ly"));
//	}
}
