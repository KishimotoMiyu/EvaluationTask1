package controller;

import java.io.IOException;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import model.dao.BookDAO;

@WebServlet("/sortbooklist")
public class BookListSortServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		BookDAO bookDao = new BookDAO();
		
		String column = request.getParameter("column");
		String sort = request.getParameter("sort");
		
		if(sort == null || sort.isEmpty()) {
			//もし直接sortbooklistのURLを入力してたら一覧画面に遷移させる
			response.sendRedirect("booklist");
		} else { 
		
			try {
				request.setAttribute("bookList", bookDao.getSortBookList(column , sort));
			}catch(Exception e) {
				e.printStackTrace();
			}
			request.getRequestDispatcher("/WEB-INF/views/book-list.jsp").forward(request, response);
		}
	}

	
}
