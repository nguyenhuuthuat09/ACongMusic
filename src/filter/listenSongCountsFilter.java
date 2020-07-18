package filter;

import java.io.IOException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.songDAO;

public class listenSongCountsFilter implements Filter {

	@Override
	public void destroy() {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void doFilter(ServletRequest arg0, ServletResponse arg1, FilterChain arg2)
			throws IOException, ServletException {
		
		HttpServletRequest req = (HttpServletRequest) arg0;
		HttpServletResponse resp = (HttpServletResponse) arg1;
		
		
		
		if (req.getParameter("id") != null && !req.getParameter("id").isEmpty()) {
			
			boolean isSongIDExist = songDAO.isSongIDExist(Integer.valueOf(req.getParameter("id")));
			
			if(isSongIDExist) {
				
				int song_id = Integer.valueOf(req.getParameter("id"));
				
				boolean result = songDAO.increaseListenCount(song_id);
				
				//System.out.println(song_id);
				//System.out.println("co qua filter");
				
				if(result) {
					//System.out.println("true");
					arg2.doFilter(req, resp);
				}
				else {
					resp.sendRedirect("home");
					return;
				}
			}
			else {
				resp.sendRedirect("home");
				return;
			}
			
			
			
			
		}
		else {
			resp.sendRedirect("home");
			return;
		}
		
		
	}

	@Override
	public void init(FilterConfig arg0) throws ServletException {
		// TODO Auto-generated method stub
		
	}

}
