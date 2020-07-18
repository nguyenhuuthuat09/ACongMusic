package filter;

import java.io.IOException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.userDAO;
import model.userProfile;

public class authentication implements Filter {

	@Override
	public void destroy() {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)
			throws IOException, ServletException {
		
		HttpServletRequest req = (HttpServletRequest) request;
		HttpServletResponse resp = (HttpServletResponse) response;
		
		HttpSession session = req.getSession();
		
		if (session.getAttribute("user") == null) {
			session.setAttribute("message", "Bạn chưa đăng nhập!");
			String contextPath = req.getContextPath();
			
			resp.sendRedirect(contextPath + "/login.jsp");
		}
		else {
			
			// nếu người dùng đăng nhập rồi sau đó trên hệ thống mới xóa người dùng này thì session vẫn còn
			// do đó người dùng vẫn đăng nhập được
			// nên cần xóa session của người dùng
			
			userProfile profile = (userProfile) session.getAttribute("user");
			boolean isUsernameExist = userDAO.isUsernameExist(profile.getUsername());
			
			if(!isUsernameExist) {
				session.invalidate();
				
				String contextPath = req.getContextPath();
				
				HttpSession sessionError = req.getSession();
				sessionError.setAttribute("message", "Tài khoản của bạn đã bị xóa do vi phạm Điều khoản dịch vụ!");
				resp.sendRedirect(contextPath + "/login.jsp");
				return;
			}
			else {
				chain.doFilter(request, response);
			}
			
		}
		
	}

	@Override
	public void init(FilterConfig filterConfig) throws ServletException {
		// TODO Auto-generated method stub
		
	}

}
