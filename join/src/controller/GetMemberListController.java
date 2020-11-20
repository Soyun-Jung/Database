package controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dto.MemberDTO;

/**
 * Servlet implementation class CheckMember
 */
@WebServlet("/GetMemberList")
public class GetMemberListController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public GetMemberListController() {
        super();
        // TODO Auto-generated constructor stub
    }

	protected void doProccess(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");
//		String[][] infoList = null;
		BackController bc = new BackController();
		
		ArrayList<MemberDTO> memberList = new ArrayList<MemberDTO>();
		memberList = bc.getMemberList(memberList);
		
		RequestDispatcher dispatcher = request.getRequestDispatcher("MemberList.jsp");
		request.setAttribute("List", memberList);
		dispatcher.forward(request, response);
		

	}

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
