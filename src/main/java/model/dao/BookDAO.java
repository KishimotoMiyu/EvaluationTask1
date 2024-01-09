package model.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

import model.DBConnection;
import model.beans.BookBean;


public class BookDAO {
	
	// 一覧表示
	public List<BookBean> getBookList() throws ClassNotFoundException, SQLException {
		List<BookBean> list = new ArrayList <BookBean> ();
		String sql ="SELECT * FROM BOOK";
		try(Connection con = DBConnection.getConnection();
				PreparedStatement stmt = con.prepareStatement(sql)){
			ResultSet res = stmt.executeQuery();
			while(res.next()) {
				BookBean book = new BookBean();
				book.setJanCode(res.getString("JAN_CD"));
				book.setIsbnCode(res.getString("ISBN_CD"));
				book.setBookName(res.getString("BOOK_NM"));
				book.setBookKana(res.getString("BOOK_KANA"));
				book.setPrice(res.getInt("PRICE"));
				book.setIssueDate(res.getDate("ISSUE_DATE"));
				book.setCreateDateTime(res.getTimestamp("CREATE_DATETIME"));
				book.setUpdateDateTime(res.getTimestamp("UPDATE_DATETIME"));
				list.add(book);
			}
		} catch (SQLException e) {
			System.err.println("SQLエラーが発生しました。エラーメッセージ: " + e.getMessage() + 
                               ", SQLステート: " + e.getSQLState() + 
                               ", エラーコード: " + e.getErrorCode());
		} catch (Exception e) {
			System.err.println("予期せぬ例外が発生しました。エラーの種類: " + e.getClass().getName() + 
                               ", メッセージ: " + e.getMessage() + 
                               ", スタックトレース: " + Arrays.toString(e.getStackTrace()));
		}
		return list;
	}
	
	// ソート一覧表示
		public List<BookBean> getSortBookList(String column , String sort) throws ClassNotFoundException, SQLException {
			List<BookBean> list = new ArrayList <BookBean> ();
			
			
			String sql ="";
			
			if(column.equals("JAN_CD")) {
				
				if(sort.equals("asc")) {
					sql = "SELECT * FROM BOOK ORDER BY JAN_CD asc";
				}else if(sort.equals("desc")) {
					sql = "SELECT * FROM BOOK ORDER BY JAN_CD desc";
				}
				
			}else if(column.equals("ISBN_CD")) {
				
				if(sort.equals("asc")) {
					sql = "SELECT * FROM BOOK ORDER BY ISBN_CD asc";
				}else if(sort.equals("desc")) {
					sql = "SELECT * FROM BOOK ORDER BY ISBN_CD desc";
				}
				
			}else if(column.equals("BOOK_NM")) {
				
				if(sort.equals("asc")) {
					sql = "SELECT * FROM BOOK ORDER BY BOOK_NM asc";
				}else if(sort.equals("desc")) {
					sql = "SELECT * FROM BOOK ORDER BY BOOK_NM desc";
				}
				
			}else if(column.equals("BOOK_KANA")) {
				
				if(sort.equals("asc")) {
					sql = "SELECT * FROM BOOK ORDER BY BOOK_KANA asc";
				}else if(sort.equals("desc")) {
					sql = "SELECT * FROM BOOK ORDER BY BOOK_KANA desc";
				}
				
			}else if(column.equals("PRICE")) {
				
				if(sort.equals("asc")) {
					sql = "SELECT * FROM BOOK ORDER BY PRICE asc";
				}else if(sort.equals("desc")) {
					sql = "SELECT * FROM BOOK ORDER BY PRICE desc";
				}
				
			}else if(column.equals("ISSUE_DATE")) {
				
				if(sort.equals("asc")) {
					sql = "SELECT * FROM BOOK ORDER BY ISSUE_DATE asc";
				}else if(sort.equals("desc")) {
					sql = "SELECT * FROM BOOK ORDER BY ISSUE_DATE desc";
				}
				
			}else if(column.equals("CREATE_DATETIME")) {
				
				if(sort.equals("asc")) {
					sql = "SELECT * FROM BOOK ORDER BY CREATE_DATETIME asc";
				}else if(sort.equals("desc")) {
					sql = "SELECT * FROM BOOK ORDER BY CREATE_DATETIME desc";
				}
				
			}else if(column.equals("UPDATE_DATETIME")) {
				
				if(sort.equals("asc")) {
					sql = "SELECT * FROM BOOK ORDER BY UPDATE_DATETIME asc";
				}else if(sort.equals("desc")) {
					sql = "SELECT * FROM BOOK ORDER BY UPDATE_DATETIME desc";
				}
				
			}
			
			System.out.println(sql);
			
			
			try(Connection con = DBConnection.getConnection();
					PreparedStatement stmt = con.prepareStatement(sql)){
				// stmt.setString(1, column);
				
				ResultSet res = stmt.executeQuery();
				while(res.next()) {
					
					BookBean book = new BookBean();
					book.setJanCode(res.getString("JAN_CD"));
					book.setIsbnCode(res.getString("ISBN_CD"));
					book.setBookName(res.getString("BOOK_NM"));
					book.setBookKana(res.getString("BOOK_KANA"));
					book.setPrice(res.getInt("PRICE"));
					book.setIssueDate(res.getDate("ISSUE_DATE"));
					book.setCreateDateTime(res.getTimestamp("CREATE_DATETIME"));
					book.setUpdateDateTime(res.getTimestamp("UPDATE_DATETIME"));
					list.add(book);
				}
			} catch (SQLException e) {
				System.err.println("SQLエラーが発生しました。エラーメッセージ: " + e.getMessage() + 
	                               ", SQLステート: " + e.getSQLState() + 
	                               ", エラーコード: " + e.getErrorCode());
			} catch (Exception e) {
				System.err.println("予期せぬ例外が発生しました。エラーの種類: " + e.getClass().getName() + 
	                               ", メッセージ: " + e.getMessage() + 
	                               ", スタックトレース: " + Arrays.toString(e.getStackTrace()));
			}
			return list;
		}
	
	// 更新用情報取得
		public BookBean getEditBook(String janCode) throws ClassNotFoundException, SQLException {
			BookBean book = new BookBean();
			String sql ="SELECT * FROM BOOK WHERE JAN_CD = ?";
			try(Connection con = DBConnection.getConnection();
					PreparedStatement stmt = con.prepareStatement(sql)){
				stmt.setString(1, janCode);
				ResultSet res = stmt.executeQuery();
				while(res.next()) {
					book.setJanCode(res.getString("JAN_CD"));
					book.setIsbnCode(res.getString("ISBN_CD"));
					book.setBookName(res.getString("BOOK_NM"));
					book.setBookKana(res.getString("BOOK_KANA"));
					book.setPrice(res.getInt("PRICE"));
					book.setIssueDate(res.getDate("ISSUE_DATE"));
					book.setCreateDateTime(res.getTimestamp("CREATE_DATETIME"));
					book.setUpdateDateTime(res.getTimestamp("UPDATE_DATETIME"));
				}
			} catch (SQLException e) {
				System.err.println("SQLエラーが発生しました。エラーメッセージ: " + e.getMessage() + 
	                               ", SQLステート: " + e.getSQLState() + 
	                               ", エラーコード: " + e.getErrorCode());
			} catch (Exception e) {
				System.err.println("予期せぬ例外が発生しました。エラーの種類: " + e.getClass().getName() + 
	                               ", メッセージ: " + e.getMessage() + 
	                               ", スタックトレース: " + Arrays.toString(e.getStackTrace()));
			}
			return book;
		}
	
	//更新用のメソッド
	public int UpdateBook(String janCode, String isbnCode, String bookName, String bookKana, int price, String issueDate,
			Timestamp createDateTime , String beforeJanCode) throws ClassNotFoundException, SQLException {
		String sql = "UPDATE BOOK SET JAN_CD = ? , ISBN_CD = ? , BOOK_NM = ? , BOOK_KANA = ? , PRICE = ? , ISSUE_DATE = ? , CREATE_DATETIME = ? , UPDATE_DATETIME = CURRENT_TIMESTAMP  WHERE JAN_CD = ?";
		
		int row = 0;
		
		try (Connection con = DBConnection.getConnection();
				PreparedStatement pstmt = con.prepareStatement(sql)) {
			pstmt.setString(1, janCode);
			pstmt.setString(2, isbnCode);
			pstmt.setString(3, bookName);
			pstmt.setString(4, bookKana);
			pstmt.setInt(5, price);
			pstmt.setDate(6, java.sql.Date.valueOf(issueDate));
			pstmt.setTimestamp(7, createDateTime);
			pstmt.setString(8, beforeJanCode);
			// カレントを使用するため不要　pstmt.setTimestamp(8, updateDateTime);
			row = pstmt.executeUpdate();
		} catch (SQLException e) {
			System.err.println("SQLエラーが発生しました。エラーメッセージ: " + e.getMessage() + 
                    ", SQLステート: " + e.getSQLState() + 
                    ", エラーコード: " + e.getErrorCode());
		} catch (Exception e) {
				System.err.println("予期せぬ例外が発生しました。エラーの種類: " + e.getClass().getName() + 
                    ", メッセージ: " + e.getMessage() + 
                    ", スタックトレース: " + Arrays.toString(e.getStackTrace()));
		}
		return row;
		
	}
	
}

