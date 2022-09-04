

import java.io.IOException;
import java.sql.SQLException;

import JDBC.DbUtil;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

/**
 * Servlet implementation class ReplyAdd
 */
public class ReplyAdd extends HttpServlet {
	private static final long serialVersionUID = 1L;

    /**
     * Default constructor. 
     */
    public ReplyAdd() {
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		//response.getWriter().append("Served at: ").append(request.getContextPath());
		String contentString = request.getParameter("content");
		int tid = Integer.parseInt((String) request.getSession(false).getAttribute("tid"));
		try {
			DbUtil.addReply(tid, (String)request.getSession(false).getAttribute("username"), contentString);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		request.getSession(false).setAttribute("tid", Integer.toString(tid));
		response.setContentType("text/html; charset=UTF-8");
		response.setCharacterEncoding("utf-8");
		response.getWriter().print("回复成功，1秒后返回");
		response.setHeader("refresh", "1; URL=topic.jsp");
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
