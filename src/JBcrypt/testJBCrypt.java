package JBcrypt;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet(urlPatterns = "/test-brcryt")
public class testJBCrypt extends HttpServlet {
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		BCrypt bcrypt = new BCrypt();
		
		System.out.println(bcrypt.hashpw("123456", bcrypt.gensalt()));
	}
	

}
