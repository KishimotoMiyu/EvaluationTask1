<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="model.*, model.beans.BookBean" %>
<%@ page import="java.util.*" %>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="css/book-edit.css">
<meta charset="UTF-8">
<title>書籍管理アプリ / 新規登録画面</title>
 <%// BookBean book = (BookBean)request.getAttribute("bookEdit"); %>
 <% HashMap<String, String> errorMessages = (HashMap<String, String>)request.getAttribute("registerErrorMSG"); %>
</head>
<body>
	<header>
		<div id="header_inner">
			 <div class="header_left">
			 	<h1 class="site_title"><a href="booklist">書籍管理アプリ</a></h1>
			 </div>
			 <div class="header_right">
			  	 <nav>
					    <ul id="header_ul">
						   <li><a href="booklist">書籍一覧</a></li>
						   <li><a href="bookregister">新規登録</a></li>
					   </ul
			 	 </nav>
			 </div>
		</div>
	</header>
	<main>
			<div class="container">
				<form action="bookregister" method="post">	 
				<p id="section_title">書籍新規登録</p>       
					<label>JANコード</label><input class="no_spin" type="number" name="janCode" value="${janCode}" min="0" step="1" required>
					<span class="caption">※13桁以内で入力してください</span><br>
					<% if( errorMessages != null) { %>
						<% if(errorMessages.containsKey("janCode")) { %>
							<span class="error_message"><%= errorMessages.get("janCode") %></span><br>
							<% errorMessages.remove("janCode"); %>
						<% } %>
					<% } %>
					
					<% if( errorMessages != null) { %>
						<% if(errorMessages.containsKey("primaryJanCode")) { %>
							<span class="error_message"><%= errorMessages.get("primaryJanCode") %></span><br>
							<% errorMessages.remove("primaryJanCode"); %>
						<% } %>
					<% } %>
					
					<label>ISBNコード</label><input type="number" class="no_spin" name="isbnCode" value="${isbnCode}" min="0" step="1" required>
					<span class="caption">※13桁以内で入力してください</span><br>
						<% if( errorMessages != null) { %>
						<% if(errorMessages.containsKey("isbnCode")) { %>
							<span class="error_message"><%= errorMessages.get("isbnCode") %></span><br>
							<% errorMessages.remove("isbnCode"); %>
						<% } %>
					<% } %>
					
					<label>書籍名称</label><input type="text" name="bookName" value="${bookName}"  required><br> 
					<% if( errorMessages != null) { %>
						<% if(errorMessages.containsKey("bookName")) { %>
							<span class="error_message"><%= errorMessages.get("bookName") %></span><br>
							<% errorMessages.remove("bookName"); %>
						<% } %>
					<% } %>
					
					<label>書籍名称カナ</label><input type="text" name="bookKana" value="${bookKana}"  required><br> 
					<% if( errorMessages != null) { %>
						<% if(errorMessages.containsKey("bookKana")) { %>
							<span class="error_message"><%= errorMessages.get("bookKana") %></span><br>
							<% errorMessages.remove("bookKana"); %>
						<% } %>
					<% } %>
					
					<label>価格</label><input type="number" class="no_spin" name="price" value="${price}" min="0" max="2147483647" step="1" required><br>
					<% if( errorMessages != null) { %>
						<% if(errorMessages.containsKey("price")) { %>
							<span class="error_message"><%= errorMessages.get("price") %></span><br>
							<% errorMessages.remove("price"); %>
						<% } %>
					<% } %>
					
					<label>発行日</label><input type="date" name="issueDate" value="${issueDate}"  required><br>
					<input id="submit" type="submit" value="送信"><br>
					<p class="back"><a href="booklist">一覧へ戻る</a></p>
				</form>
			</div>
		</main>
</body>
<footer>
<span>
 <p>&copy; kishimoto</p>
</span>
</footer>
</html>
