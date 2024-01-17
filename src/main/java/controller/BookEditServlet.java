package controller;

import java.io.IOException;
import java.sql.Timestamp;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.util.Date;
import java.util.HashMap;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import model.beans.BookBean;
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
			//もし直接bookeditのURLを入力してたら一覧画面に遷移させる
			response.sendRedirect("booklist");
		} else { 
			
			try{
				//編集したい本の情報を渡す
				BookBean book = bookDao.getEditBook(janCode);
				request.setAttribute("beforeJanCode" , book.getJanCode());
				request.setAttribute("bookEdit" , book );
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
		String priceStr = (String)request.getParameter("price");
		String issueDate = (String)request.getParameter("issueDate");
		String createDateTimeStr = (String)request.getParameter("createDateTime");
		Timestamp createDateTime = convertToTimestamp(createDateTimeStr);
		String beforeJanCode = (String)request.getParameter("beforeJanCode");
		int price = 0;
		
		
		HashMap<String, String> errorMessages = new HashMap<>();
		
			if( janCode.length() > 13 ) {
				errorMessages.put("janCode", "13桁を超えています");
			}
			
			boolean primaryCheck = bookDao.primaryCheck(janCode);
			if( !primaryCheck && !janCode.equals(beforeJanCode)) {
				errorMessages.put("primaryJanCode", "既に存在しているJANコードです");
			}
			
			if( isbnCode.length() > 13 ) {
				errorMessages.put("isbnCode", "13桁を超えています");
			}
		
			if( priceStr.length() > 9 ) {
				errorMessages.put("price", "9桁以内で記述してください");
			} else {
				price = Integer.parseInt(request.getParameter("price"));
			}
			
			if( bookName.length() > 500 ) {
				errorMessages.put("bookName", "500文字以内で入力してください");
			}
			
			if( bookKana.length() > 500 ) {
				errorMessages.put("bookKana", "500文字以内で入力してください");
			}
			
			
			
			if(!errorMessages.isEmpty()) {
				BookBean book = new BookBean();
				book.setJanCode(janCode);
				book.setIsbnCode(isbnCode);
				book.setBookName(bookName);
				book.setBookKana(bookKana);
				book.setPrice(price);
				book.setIssueDate(convertToDate(issueDate));
				book.setCreateDateTime(convertToTimestamp(createDateTimeStr));
				request.setAttribute("beforeJanCode", beforeJanCode);
				request.setAttribute("editErrorMSG", errorMessages);
				request.setAttribute("bookEdit", book);
				request.getRequestDispatcher("/WEB-INF/views/book-edit.jsp").forward(request, response);
				return;
			}

		try{
			//変更する
			update = bookDao.UpdateBook(janCode, isbnCode, bookName, bookKana, price, issueDate, createDateTime ,beforeJanCode);
			request.setAttribute("bookList", bookDao.getBookList());
		}catch(Exception e) {
			e.printStackTrace();
		}

		if( update == 1 ){
			request.setAttribute("message", "書籍名称 「" + bookName + "」の情報更新が完了しました");
		} else {
			request.setAttribute("message","更新できませんでした");
		}
		
		request.getRequestDispatcher("/WEB-INF/views/book-list.jsp").forward(request, response);
		
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
	
	//日付をStringからDateへ
	private Date convertToDate(String dateString) {
		
        try {
            DateTimeFormatter dateFormat = DateTimeFormatter.ofPattern("yyyy-MM-dd");
            LocalDate ld = LocalDate.parse(dateString , dateFormat);
            Date parsedDate = java.sql.Date.valueOf(ld);
            return parsedDate;
        } catch (Exception e) {
            e.printStackTrace();
            return null;
        }
     
    }

}
