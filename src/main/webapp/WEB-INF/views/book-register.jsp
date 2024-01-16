<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="model.*, model.beans.BookBean" %>
<%@ page import="java.util.*" %>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="css/book-edit.css">
<meta charset="UTF-8">
<title>書籍管理アプリ / 更新画面</title>
</head>
<body>
	<header>
 	<div class="header_inner">
 	<h1 class="site_title"><a href="booklist">書籍管理アプリ</a></h1>
 </div>
</header>
	<main>
			<div class="container">
				<form action="bookregister" method="post">	      
					<label>JANコード</label><input class="no_spin" type="number" name="janCode" value="${JanCode}" min="0" step="1" required>
					<span>※13桁以内で入力してください</span><br>
					<label>ISBNコード</label><input type="number" class="no_spin" name="isbnCode" value="${IsbnCode}" min="0" step="1" required>
					<span>※13桁以内で入力してください</span><br>
					<label>書籍名称</label><input type="text" name="bookName" value="${BookName}"  required><br> 
					<label>書籍名称カナ</label><input type="text" name="bookKana" value="${BookKana}"  required><br> 
					<label>価格</label><input type="number" class="no_spin" name="price" value="${Price}" min="0" step="1" required><br>
					<label>発行日</label><input type="date" name="issueDate" value="${IssueDate}"  required><br>
					<input id="submit" type="submit" value="送信"><br>
					<p class="back"><a href="booklist">一覧へ戻る</a></p>
				</form>
			</div>
		</main>
</body>
<footer>
</footer>
</html>
