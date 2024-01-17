package controller;

import java.io.IOException;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import model.dao.BookDAO;

@WebServlet("/booksearch")
public class BookSearchServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String search = request.getParameter("search");
		String searchName = request.getParameter("searchName");
		BookDAO bookDao = new BookDAO();
		
		if(search == null ||search.isEmpty()) { //もし直接booksearchのURLを入力してたら一覧画面に遷移させる
			response.sendRedirect("booklist");
			return;
			
		} else if(searchName == null || searchName.isEmpty()){ //検索バーがnullの場合
			
			try {
				request.setAttribute("message", "検索フォームに入力がありませんでした");
				request.setAttribute("bookList", bookDao.getBookList());
			}catch(Exception e) {
				e.printStackTrace();
			}
			
			request.getRequestDispatcher("/WEB-INF/views/book-list.jsp").forward(request, response);
			
		} else if(searchName.length() > 500){ //検索バーに入力した文字数が500文字を超える場合
			
			try {
				request.setAttribute("search", searchName);
				request.setAttribute("message", "500文字以内で検索してください");
				request.setAttribute("bookList", bookDao.getBookList());
			}catch(Exception e) {
				e.printStackTrace();
			}
			
			request.getRequestDispatcher("/WEB-INF/views/book-list.jsp").forward(request, response);
			
		} else {
			
			String[] word =  searchName.replaceAll("　", " ").split(" ",0); //スペースを半角に置換して半角ごとに配列へ
				 if(word.length > 0){//配列の長さが0以上なら
					 try {
							request.setAttribute("bookList", bookDao.getSearchBookList(word)); //配列を渡す
						}catch(Exception e) {
							e.printStackTrace();
						}
					 	request.setAttribute("search", searchName);
						request.setAttribute("message", "「" + searchName + "」"  + "の検索結果");
				} else {
					
					try {
						request.setAttribute("message", "検索フォームに入力がありませんでした");
						request.setAttribute("bookList", bookDao.getBookList());
					}catch(Exception e) {
						e.printStackTrace();
					}
					
				}
			request.getRequestDispatcher("/WEB-INF/views/book-list.jsp").forward(request, response);
			
		}
	}
}
