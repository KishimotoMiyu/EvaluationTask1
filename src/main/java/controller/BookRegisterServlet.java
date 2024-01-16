package controller;

import java.io.IOException;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.util.Date;
import java.util.HashMap;

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
		String priceStr = (String)request.getParameter("price");
		String issueDate = (String)request.getParameter("issueDate");
		int price = 0;
		
		HashMap<String, String> errorMessages = new HashMap<>();
		
		if( janCode.length() > 13 ) {
			errorMessages.put("janCode", "13桁を超えています");
		}
		
		boolean primaryCheck = bookDao.primaryCheck(janCode);
		if( !primaryCheck ) {
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
			
			request.setAttribute("janCode" , janCode);
			request.setAttribute("isbnCode" , isbnCode);
			request.setAttribute("bookName" , bookName);
			request.setAttribute("bookKana" , bookKana);
			request.setAttribute("price" , price);
			request.setAttribute("issueDate" ,convertToDate(issueDate));		
			request.setAttribute("registerErrorMSG", errorMessages);
			request.getRequestDispatcher("/WEB-INF/views/book-register.jsp").forward(request, response);
			return;
		}
		
		
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
