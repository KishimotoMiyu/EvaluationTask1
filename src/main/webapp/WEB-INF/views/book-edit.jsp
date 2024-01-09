<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="model.*, model.beans.BookBean" %>
<%@ page import="java.util.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>更新画面</title>
 <% BookBean book = (BookBean)request.getAttribute("bookEdit"); %>
</head>
<body>
	<main>
			<a href="booklist">一覧へ戻る</a>
			<div>
				<form action="bookedit" method="post">
				<th>JANコード</th>	      
					<label>JANコード：</label><input type="text" name="janCode" value="<%= book.getJanCode() %>" required><br>
					<label>ISBNコード：</label><input type="text" name="isbnCode" value="<%= book.getIsbnCode() %>"  required><br>
					<label>書籍名称：</label><input type="text" name="bookName" value="<%= book.getBookName() %>"  required><br> 
					<label>書籍名称カナ：</label><input type="text" name="bookKana" value="<%= book.getBookKana() %>"  required><br> 
					<label>価格：</label><input type="number" name="price" value="<%= book.getPrice() %>"  required><br>
					<label>発行日：</label><input type="date" name="issueDate" value="<%= book.getIssueDate() %>"  required><br>
					<label>登録日時：</label><input type="datetime-local" name="createDateTime" value="<%= book.getCreateDateTime()%>"  required><br> 
					<input type="hidden" name="beforeJanCode" value="<%= book.getJanCode() %>" required>
					<input type="submit" value="送信">
				</form>
			</div>
		</main
</body>
</html>
