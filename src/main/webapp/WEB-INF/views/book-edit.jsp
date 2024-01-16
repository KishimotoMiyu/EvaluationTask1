<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="model.*, model.beans.BookBean" %>
<%@ page import="java.util.*" %>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="css/book-edit.css">
<meta charset="UTF-8">
<title>書籍管理アプリ / 更新画面</title>
 <% BookBean book = (BookBean)request.getAttribute("bookEdit"); %>
 <% String beforeJanCode = (String)request.getAttribute("beforeJanCode"); %>
 <% HashMap<String, String> errorMessages = (HashMap<String, String>)request.getAttribute("editErrorMSG"); %>
</head>
<body>
	<header>
 	<div class="header_inner">
 	<h1 class="site_title"><a href="booklist">書籍管理アプリ</a></h1>
 </div>
</header>
	<main>
			
			<div class="container">
			
				<form action="bookedit" method="post">	      
					<label>JANコード</label><input class="no_spin" type="number" name="janCode" value="<%= book.getJanCode() %>" min="0" step="1" required>
					<span>※13桁以内で入力してください</span><br>
					<% if( errorMessages != null) { %>
						<% if(errorMessages.containsKey("janCode")) { %>
							<p class="error_message"><%= errorMessages.get("janCode") %></p>
							<% errorMessages.remove("janCode"); %>
						<% } %>
					<% } %>
					
					<% if( errorMessages != null) { %>
						<% if(errorMessages.containsKey("primaryJanCode")) { %>
							<p class="error_message"><%= errorMessages.get("primaryJanCode") %></p>
							<% errorMessages.remove("primaryJanCode"); %>
						<% } %>
					<% } %>
					
					<label>ISBNコード</label><input type="number" class="no_spin" name="isbnCode" value="<%= book.getIsbnCode() %>" min="0" step="1" required>
					<span>※13桁以内で入力してください</span><br>
					<% if( errorMessages != null) { %>
						<% if(errorMessages.containsKey("isbnCode")) { %>
							<p class="error_message"><%= errorMessages.get("isbnCode") %></p>
							<% errorMessages.remove("isbnCode"); %>
						<% } %>
					<% } %>
					
					<label>書籍名称</label><input type="text" name="bookName" value="<%= book.getBookName() %>"  required><br> 
					<% if( errorMessages != null) { %>
						<% if(errorMessages.containsKey("bookName")) { %>
							<p class="error_message"><%= errorMessages.get("bookName") %></p>
							<% errorMessages.remove("bookName"); %>
						<% } %>
					<% } %>
					
					<label>書籍名称カナ</label><input type="text" name="bookKana" value="<%= book.getBookKana() %>"  required><br> 
					<% if( errorMessages != null) { %>
						<% if(errorMessages.containsKey("bookKana")) { %>
							<p class="error_message"><%= errorMessages.get("bookKana") %></p>
							<% errorMessages.remove("bookKana"); %>
						<% } %>
					<% } %>
					
					<label>価格</label><input type="number" class="no_spin" name="price" value="<%= book.getPrice() %>" min="0" max="2147483647" step="1" required><br>
					<% if( errorMessages != null) { %>
						<% if(errorMessages.containsKey("price")) { %>
							<p class="error_message"><%= errorMessages.get("price") %></p>
							<% errorMessages.remove("price"); %>
						<% } %>
					<% } %>
					
					<label>発行日</label><input type="date" name="issueDate" value="<%= book.getIssueDate() %>"  required><br>
					<label>登録日時</label><input type="datetime-local" name="createDateTime" value="<%= book.getCreateDateTime()%>"  required><br> 
					<input type="hidden" name="beforeJanCode" value="${beforeJanCode}" required>
					<input id="submit" type="submit" value="送信"><br>
					<p class="back"><a href="booklist">一覧へ戻る</a></p>
				</form>
				
			</div>
		</main>
</body>
<footer>
</footer>
</html>
