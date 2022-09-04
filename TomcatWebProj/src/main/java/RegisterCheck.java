

import java.io.IOException;
import java.sql.SQLException;

import JDBC.DbUtil;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;


/**
 * Servlet implementation class RegisterCheck
 */
public class RegisterCheck extends HttpServlet {
	private static final long serialVersionUID = 1L;

    /**
     * Default constructor. 
     */
    public RegisterCheck() {
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.setContentType("text/html; charset=UTF-8");
		response.setCharacterEncoding("utf-8");
		//response.getWriter().append("Served at: ").append(request.getContextPath());
		try {
			if (DbUtil.searchUser(request.getParameter("username")) != null) {
				response.getWriter().print("注册失败！用户名已存在，1秒后返回注册页面。");
				response.setHeader("refresh", "1; URL=register.jsp");
				return;
			}
			DbUtil.addUser(request.getParameter("username"), request.getParameter("password"), request.getParameter("email"), 
					request.getParameter("telephone"), request.getParameter("birthday"));
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		response.getWriter().print("注册成功！即将返回登录页面");
		response.setHeader("refresh", "2; URL=login.jsp");
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
