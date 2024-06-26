package vn.babycare.config;

import java.io.IOException;
import java.util.Collection;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.security.core.Authentication;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.web.DefaultRedirectStrategy;
import org.springframework.security.web.RedirectStrategy;
import org.springframework.security.web.WebAttributes;
import org.springframework.security.web.authentication.AuthenticationSuccessHandler;

public class UrlAuthenticationSuccessHandler implements AuthenticationSuccessHandler {
	private RedirectStrategy redirectStrategy = new DefaultRedirectStrategy();

	@Override 
	public void onAuthenticationSuccess(HttpServletRequest request, HttpServletResponse response,
			Authentication authentication) throws IOException, ServletException {

		handle(request, response, authentication);
		clearAuthenticationAttributes(request);
	}

	protected void handle(HttpServletRequest request, HttpServletResponse response, Authentication authentication)
			throws IOException {
		String targetUrl = determineTargetUrl(authentication); 
		if (response.isCommitted()) {
			return;
		}
		redirectStrategy.sendRedirect(request, response, targetUrl); 
	}


	protected String determineTargetUrl(final Authentication authentication) throws IllegalStateException {

		Map<String, String> roleTargetUrlMap = new HashMap<String, String>(); // key: Role - value: URL
		//roleTargetUrlMap.put("CUSTOMER", "/index");
		roleTargetUrlMap.put("ADMIN", "/admin/home");
		roleTargetUrlMap.put("STAFF", "/staff/order-list");
		roleTargetUrlMap.put("CUSTOMER", "/index");

		final Collection<? extends GrantedAuthority> authorities = authentication.getAuthorities(); // Lay danh sach cac
																									// roles
		for (final GrantedAuthority grantedAuthority : authorities) { 
			String authorityName = grantedAuthority.getAuthority(); // role name

			if (roleTargetUrlMap.containsKey(authorityName)) {
				return roleTargetUrlMap.get(authorityName); 
			}
		}
		throw new IllegalStateException();
	}

	protected void clearAuthenticationAttributes(HttpServletRequest request) {
		HttpSession session = request.getSession(false);
		if (session == null) {
			return;
		}
		session.removeAttribute(WebAttributes.AUTHENTICATION_EXCEPTION);
	}
}
