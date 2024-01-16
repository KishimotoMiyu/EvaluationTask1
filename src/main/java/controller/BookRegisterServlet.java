package controller;

import java.io.IOException;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import model.dao.BookDAO;


@WebServlet("/bookregister")
public class BookRegisterServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		//編集画面へ遷移
			request.getRequestDispatcher("/WEB-INF/views/book-register.jsp").forward(request, response);
			
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		
		BookDAO bookDao = new BookDAO();
		
		//受け取る
		int register = -1;
		String janCode = (String)request.getParameter("janCode");
		String isbnCode = (String)request.getParameter("isbnCode");
		String bookName = (String)request.getParameter("bookName");
		String bookKana = (String)request.getParameter("bookKana");
		int price = Integer.parseInt(request.getParameter("price"));
		String issueDate = (String)request.getParameter("issueDate");
		
		try{
			//変更する
			register = bookDao.insertBook(janCode, isbnCode, bookName, bookKana, price, issueDate);
			request.setAttribute("bookList", bookDao.getBookList());
		}catch(Exception e) {
			e.printStackTrace();
		}

		if( register == 1 ){
			request.setAttribute("message", "書籍名称 「" + bookName + "」の情報更新が完了しました");
		} else {
			request.setAttribute("message","更新できませんでした");
		}
		
		request.getRequestDispatcher("/WEB-INF/views/book-list.jsp").forward(request, response);
	}
}
