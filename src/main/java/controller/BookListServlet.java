package controller;

import java.io.IOException;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import model.dao.BookDAO;

@WebServlet("/booklist")
public class BookListServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		BookDAO bookDao = new BookDAO();
		
		try {
			request.setAttribute("bookList", bookDao.getBookList());
		}catch(Exception e) {
			e.printStackTrace();
		}
		request.getRequestDispatcher("/WEB-INF/views/book-list.jsp").forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		
		BookDAO bookDao = new BookDAO();
		int update = (Integer)request.getAttribute("update");
		
		try {
			request.setAttribute("bookList", bookDao.getBookList());
		}catch(Exception e) {
			e.printStackTrace();
		}
		
		if( update == 1 ){
			String bookName = (String)request.getAttribute("bookName");
			request.setAttribute("message", "書籍名称 「" + bookName + "」の情報更新が完了しました");
		} else {
			request.setAttribute("message","更新できませんでした");
		}
		request.getRequestDispatcher("/WEB-INF/views/book-list.jsp").forward(request, response);
	}
}
