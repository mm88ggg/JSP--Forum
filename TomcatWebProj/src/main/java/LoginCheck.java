import java.io.IOException;
import java.sql.SQLException;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import jakarta.websocket.Session;
import JDBC.DbUtil;

/**
 * Servlet implementation class LoginCheck
 */
public class LoginCheck extends HttpServlet {
	private static final long serialVersionUID = 1L;

    /**
     * Default constructor. 
     */
    public LoginCheck() {
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String username = request.getParameter("username");
		String password = request.getParameter("password");
		String pwd = null;
		try {
			pwd = DbUtil.searchUser(username);
		} catch (SQLException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		}
		if (pwd != null && pwd.equals(password)) {
			HttpSession session = request.getSession(true);
			session.setAttribute("username", username);
			session.setAttribute("password", password);
			session.setAttribute("userip", request.getRemoteAddr());
			session.setAttribute("status", "true");
			response.sendRedirect("main.jsp"); // TODO
		} else {
			response.setContentType("text/html; charset=UTF-8");
			response.setCharacterEncoding("utf-8");
			response.getWriter().print("输入账号或密码不正确，1秒后返回登陆页面。");
			response.setHeader("refresh", "1; URL=login.jsp");
		}
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
