package controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.TeacherInfoBean;
import service.Service;


@WebServlet("/controlDB")
public class Controller extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public Controller() {
        super();
        // TODO Auto-generated constructor stub
    }

	protected void doProccess(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		TeacherInfoBean tib = new TeacherInfoBean();
		response.setContentType("text/html; charset=UTF-8");
		String ID = request.getParameter("sID");
		String PW = request.getParameter("sPW");
		System.out.println(ID);
		System.out.println(PW);
		String[] techerInfo;
		
		//service 패키지의 inputService를 import
		Service sv = new Service();
		
		
		//input 결과를 담기 위한 boolean타입의 inputResult 선언
		boolean a = sv.controllDB(ID, PW, tib);
		
		if(a) {
			RequestDispatcher dispatcher = request.getRequestDispatcher("loginSuccess.jsp");
			request.setAttribute("name", tib.getTeName());
			request.setAttribute("subject", tib.getTeSub());
			request.setAttribute("level", tib.getTeLevel());
			request.setAttribute("grade", tib.getTeGrade());
			request.setAttribute("class", tib.getTeClass());
			request.setAttribute("num", tib.getClNum());
			
			dispatcher.forward(request, response);
		
		}else {
			RequestDispatcher dispatcher = request.getRequestDispatcher("loginFail.jsp");
			dispatcher.forward(request, response);		
		}
		
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


