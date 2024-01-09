package controller;

import java.io.IOException;
import java.sql.Timestamp;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import model.dao.BookDAO;


@WebServlet("/bookedit")
public class BookEditServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		BookDAO bookDao = new BookDAO();
		
		//受け取る
		String edit =  request.getParameter("edit");
		String janCode = request.getParameter("janCode");
		if(edit == null || edit.isEmpty()) {
			//もし直接/bookeditのURLを入力してたら一覧画面に遷移させる
			response.sendRedirect("booklist");
		} else { 
			
			try{
				//編集したい本の情報を渡す
				request.setAttribute("bookEdit" , bookDao.getEditBook(janCode));
			}catch(Exception e) {
				e.printStackTrace();
			}
			
			//編集画面へ遷移
			request.getRequestDispatcher("/WEB-INF/views/book-edit.jsp").forward(request, response);
			
		}	
		
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		
		BookDAO bookDao = new BookDAO();
		
		//受け取る
		int update = -1;
		String janCode = (String)request.getParameter("janCode");
		String isbnCode = (String)request.getParameter("isbnCode");
		String bookName = (String)request.getParameter("bookName");
		String bookKana = (String)request.getParameter("bookKana");
		// String priceStr = (String)request.getParameter("");
		int price = Integer.parseInt(request.getParameter("price"));
		String issueDate = (String)request.getParameter("issueDate");
		String createDateTimeStr = (String)request.getParameter("createDateTime");
		Timestamp createDateTime = convertToTimestamp(createDateTimeStr);
		String beforeJanCode = (String)request.getParameter("beforeJanCode");
		
		try{
			//変更する
			update = bookDao.UpdateBook(janCode, isbnCode, bookName, bookKana, price, issueDate, createDateTime ,beforeJanCode);
		}catch(Exception e) {
			e.printStackTrace();
		}
		
		request.setAttribute("update", update);
		request.getRequestDispatcher("/booklist").forward(request, response);
	}
	
	private Timestamp convertToTimestamp(String dateString) {
        try {

            SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd'T'HH:mm");
            Date parsedDate = dateFormat.parse(dateString);
            return new Timestamp(parsedDate.getTime());
        } catch (ParseException e) {
            e.printStackTrace();
            return null; // 例外が発生した場合はエラーハンドリングが必要
        }
    }

}
