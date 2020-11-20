package controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class FrontController
 */
@WebServlet("/JoinController")
public class joinController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public joinController() {

		super();
		// TODO Auto-generated constructor stub


	}

	protected void doProccess(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");
		String[] getUserInfo = new String[6];
		BackController bc = new BackController();

		String[] userInfo = new String[6];
		userInfo[0]=request.getParameter("userId");
		userInfo[1] = request.getParameter("userPw");
		userInfo[2] = request.getParameter("userName");
		userInfo[3] = request.getParameter("userBirth");
		userInfo[4] = request.getParameter("userGender");
		userInfo[5] = request.getParameter("userEmail");
		
		getUserInfo = bc.join(userInfo);

		if(getUserInfo[0]!=null) {
			RequestDispatcher dispatcher = request.getRequestDispatcher("joinMember.jsp");
			request.setAttribute("userId", getUserInfo[0]);
			request.setAttribute("userName", getUserInfo[1]);
			request.setAttribute("userGender", getUserInfo[2]);
			request.setAttribute("userBirth", getUserInfo[3]);
			request.setAttribute("userEmail", getUserInfo[4]);
			dispatcher.forward(request, response);
		}	
		else {
//			RequestDispatcher dispatcher = request.getRequestDispatcher("joinFail.jsp");
//			dispatcher.forward(request, response);
			response.sendRedirect("joinFail.jsp");
		}
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doProccess(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doProccess(request, response);
	}

}
