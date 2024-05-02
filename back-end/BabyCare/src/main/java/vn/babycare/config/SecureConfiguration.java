package vn.babycare.config;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.config.annotation.authentication.builders.AuthenticationManagerBuilder;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.config.annotation.web.configuration.WebSecurityConfigurerAdapter;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;

import vn.babycare.service.UserDetailsServiceImp;

@Configuration
@EnableWebSecurity
public class SecureConfiguration extends WebSecurityConfigurerAdapter{
	@Override
	protected void configure(final HttpSecurity http) throws Exception {

		http.csrf().disable().authorizeRequests()
		.antMatchers("/frontend/**", "/backend/**", "/FileUpload/**", "/login", "/logout").permitAll()
		.antMatchers("/admin/**").hasAuthority("ADMIN")
		.antMatchers("/staff/**").hasAuthority("STAFF")
		.and()

		.formLogin().loginPage("/login").loginProcessingUrl("/login_processing_url")


		.successHandler(new UrlAuthenticationSuccessHandler()) 

		.failureUrl("/login?login_error=true")

		.and()

		.logout().logoutUrl("/logout").logoutSuccessUrl("/login").invalidateHttpSession(true)
		.deleteCookies("JSESSIONID")
		
		.and().rememberMe().key("uniqueAndSecret").tokenValiditySeconds(86400);
	}
	
	@Autowired
	private UserDetailsServiceImp userDetailsService;

	@Autowired
	public void configureGlobal(AuthenticationManagerBuilder auth) throws Exception {
		auth.userDetailsService(userDetailsService).passwordEncoder(new BCryptPasswordEncoder(4));
	}

//	public static void main(String[] args) {
//		System.out.println(new BCryptPasswordEncoder(4).encode("456"));
//		System.out.println(new BCryptPasswordEncoder(4).encode("123"));
//	}
}
