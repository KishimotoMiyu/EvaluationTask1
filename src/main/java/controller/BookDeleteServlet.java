package controller;

import java.io.IOException;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import model.dao.BookDAO;


@WebServlet("/bookdelete")
public class BookDeleteServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		BookDAO bookDao = new BookDAO();
		
		//受け取る
		String delete =  request.getParameter("delete");
		String janCode = request.getParameter("janCode");
		String bookName = request.getParameter("bookName");
		int deleteNo = -1;
		
		if(delete == null || delete.isEmpty()) {
			//もし直接bookeditのURLを入力してたら一覧画面に遷移させる
			response.sendRedirect("booklist");
		} else { 
			
			try{
				//編集したい本の情報を渡す
				deleteNo = bookDao.deleteBook(janCode);
				request.setAttribute("bookList", bookDao.getBookList());
			}catch(Exception e) {
				e.printStackTrace();
			}
			
			if( deleteNo == 1 ){
				request.setAttribute("message", "書籍名称 「" + bookName + "」の削除が完了しました");
			} else {
				request.setAttribute("message","削除できませんでした");
			}
			
			request.getRequestDispatcher("/WEB-INF/views/book-list.jsp").forward(request, response);
		}	
		
	}
}
