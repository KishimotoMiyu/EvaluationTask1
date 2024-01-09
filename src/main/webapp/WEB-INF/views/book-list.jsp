<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="model.*, model.beans.BookBean" %>
<%@ page import="java.util.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>書籍管理アプリ / 商品一覧</title>
<link rel="stylesheet" href="css/book-list.css">
 <% List<BookBean> bookList = (ArrayList <BookBean>)request.getAttribute("bookList");%>
</head>
<body>
<header>
 <div class="header_inner">
 	<h1 class="site_title"><a href="booklist">書籍管理アプリ</a></h1>
 </div>
</header>
<main>
	<div class="container">
		<p class="section_title">商品一覧</p>
		<p class="message">${message}</p>
			<table>
					<thead>
						<tr>
							　<th>JANコード
								 <a href="sortbooklist?sort=asc&column=JAN_CD">
								 	<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-chevron-up" viewBox="0 0 16 16">
				  				  	<path fill-rule="evenodd" d="M7.646 4.646a.5.5 0 0 1 .708 0l6 6a.5.5 0 0 1-.708.708L8 5.707l-5.646 5.647a.5.5 0 0 1-.708-.708l6-6z"/>
				  				  	</svg>
				  				  </a>
			  					  <a href="sortbooklist?sort=desc&column=JAN_CD">
				  				  <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-chevron-down" viewBox="0 0 16 16">
				 				  	<path fill-rule="evenodd" d="M1.646 4.646a.5.5 0 0 1 .708 0L8 10.293l5.646-5.647a.5.5 0 0 1 .708.708l-6 6a.5.5 0 0 1-.708 0l-6-6a.5.5 0 0 1 0-.708z"/>
				 				 </a>
							</th>
						      <th>ISBNコード
						       <a href="sortbooklist?sort=asc&column=ISBN_CD">
								 	<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-chevron-up" viewBox="0 0 16 16">
				  				  	<path fill-rule="evenodd" d="M7.646 4.646a.5.5 0 0 1 .708 0l6 6a.5.5 0 0 1-.708.708L8 5.707l-5.646 5.647a.5.5 0 0 1-.708-.708l6-6z"/>
				  				  	</svg>
				  				  </a>
			  					  <a href="sortbooklist?sort=desc&column=ISBN_CD">
				  				  <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-chevron-down" viewBox="0 0 16 16">
				 				  	<path fill-rule="evenodd" d="M1.646 4.646a.5.5 0 0 1 .708 0L8 10.293l5.646-5.647a.5.5 0 0 1 .708.708l-6 6a.5.5 0 0 1-.708 0l-6-6a.5.5 0 0 1 0-.708z"/>
				 				 </a>
						      </th>
						      <th>書籍名称
						       <a href="sortbooklist?sort=asc&column=BOOK_NM">
								 	<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-chevron-up" viewBox="0 0 16 16">
				  				  	<path fill-rule="evenodd" d="M7.646 4.646a.5.5 0 0 1 .708 0l6 6a.5.5 0 0 1-.708.708L8 5.707l-5.646 5.647a.5.5 0 0 1-.708-.708l6-6z"/>
				  				  	</svg>
				  				  </a>
			  					  <a href="sortbooklist?sort=desc&column=BOOK_NM">
				  				  <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-chevron-down" viewBox="0 0 16 16">
				 				  	<path fill-rule="evenodd" d="M1.646 4.646a.5.5 0 0 1 .708 0L8 10.293l5.646-5.647a.5.5 0 0 1 .708.708l-6 6a.5.5 0 0 1-.708 0l-6-6a.5.5 0 0 1 0-.708z"/>
				 				 </a>
				 				 </th>
						      <th>書籍名称カナ
						      <a href="sortbooklist?sort=asc&column=BOOK_KANA">
								 	<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-chevron-up" viewBox="0 0 16 16">
				  				  	<path fill-rule="evenodd" d="M7.646 4.646a.5.5 0 0 1 .708 0l6 6a.5.5 0 0 1-.708.708L8 5.707l-5.646 5.647a.5.5 0 0 1-.708-.708l6-6z"/>
				  				  	</svg>
				  				  </a>
			  					  <a href="sortbooklist?sort=desc&column=BOOK_KANA">
				  				  <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-chevron-down" viewBox="0 0 16 16">
				 				  	<path fill-rule="evenodd" d="M1.646 4.646a.5.5 0 0 1 .708 0L8 10.293l5.646-5.647a.5.5 0 0 1 .708.708l-6 6a.5.5 0 0 1-.708 0l-6-6a.5.5 0 0 1 0-.708z"/>
				 				 </a>
						      </th>
						      <th>価格
						      <a href="sortbooklist?sort=asc&column=PRICE">
								 	<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-chevron-up" viewBox="0 0 16 16">
				  				  	<path fill-rule="evenodd" d="M7.646 4.646a.5.5 0 0 1 .708 0l6 6a.5.5 0 0 1-.708.708L8 5.707l-5.646 5.647a.5.5 0 0 1-.708-.708l6-6z"/>
				  				  	</svg>
				  				  </a>
			  					  <a href="sortbooklist?sort=desc&column=PRICE">
				  				  <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-chevron-down" viewBox="0 0 16 16">
				 				  	<path fill-rule="evenodd" d="M1.646 4.646a.5.5 0 0 1 .708 0L8 10.293l5.646-5.647a.5.5 0 0 1 .708.708l-6 6a.5.5 0 0 1-.708 0l-6-6a.5.5 0 0 1 0-.708z"/>
				 				 </a>
						      </th>
						      <th>発行日
						      <a href="sortbooklist?sort=asc&column=ISSUE_DATE">
								 	<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-chevron-up" viewBox="0 0 16 16">
				  				  	<path fill-rule="evenodd" d="M7.646 4.646a.5.5 0 0 1 .708 0l6 6a.5.5 0 0 1-.708.708L8 5.707l-5.646 5.647a.5.5 0 0 1-.708-.708l6-6z"/>
				  				  	</svg>
				  				  </a>
			  					  <a href="sortbooklist?sort=desc&column=ISSUE_DATE">
				  				  <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-chevron-down" viewBox="0 0 16 16">
				 				  	<path fill-rule="evenodd" d="M1.646 4.646a.5.5 0 0 1 .708 0L8 10.293l5.646-5.647a.5.5 0 0 1 .708.708l-6 6a.5.5 0 0 1-.708 0l-6-6a.5.5 0 0 1 0-.708z"/>
				 				 </a>
						      </th>
						      <th>登録日時
						      <a href="sortbooklist?sort=asc&column=CREATE_DATETIME">
								 	<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-chevron-up" viewBox="0 0 16 16">
				  				  	<path fill-rule="evenodd" d="M7.646 4.646a.5.5 0 0 1 .708 0l6 6a.5.5 0 0 1-.708.708L8 5.707l-5.646 5.647a.5.5 0 0 1-.708-.708l6-6z"/>
				  				  	</svg>
				  				  </a>
			  					  <a href="sortbooklist?sort=desc&column=CREATE_DATETIME">
				  				  <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-chevron-down" viewBox="0 0 16 16">
				 				  	<path fill-rule="evenodd" d="M1.646 4.646a.5.5 0 0 1 .708 0L8 10.293l5.646-5.647a.5.5 0 0 1 .708.708l-6 6a.5.5 0 0 1-.708 0l-6-6a.5.5 0 0 1 0-.708z"/>
				 				 </a>
						      </th>
						      <th>最終更新日時
						      <a href="sortbooklist?sort=asc&column=UPDATE_DATETIME">
								 	<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-chevron-up" viewBox="0 0 16 16">
				  				  	<path fill-rule="evenodd" d="M7.646 4.646a.5.5 0 0 1 .708 0l6 6a.5.5 0 0 1-.708.708L8 5.707l-5.646 5.647a.5.5 0 0 1-.708-.708l6-6z"/>
				  				  	</svg>
				  				  </a>
			  					  <a href="sortbooklist?sort=desc&column=UPDATE_DATETIME">
				  				  <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-chevron-down" viewBox="0 0 16 16">
				 				  	<path fill-rule="evenodd" d="M1.646 4.646a.5.5 0 0 1 .708 0L8 10.293l5.646-5.647a.5.5 0 0 1 .708.708l-6 6a.5.5 0 0 1-.708 0l-6-6a.5.5 0 0 1 0-.708z"/>
				 				 </a>
						      </th>
					    </tr>
					</thead>
					<tbody>
						<% if( bookList == null || bookList.isEmpty()){ %>
							<tr>
							 <td></td>
							 <td></td>
							 <td></td>
							 <td></td>
							 <td></td>
							 <td></td>
							 <td></td>
							 <td></td>
							</tr>
						<% } else { %>
							<% for (BookBean columns : bookList) { %>
								<tr>
									<td class="td"><a href="bookedit?edit=edit&janCode=<%= columns.getJanCode() %>"><%= columns.getJanCode() %></a></td>
									<td class="td"><a href="bookedit?edit=edit&janCode=<%= columns.getJanCode() %>"><%= columns.getIsbnCode() %></a></td>
									<td class="td"><a href="bookedit?edit=edit&janCode=<%= columns.getJanCode() %>"><%= columns.getBookName() %></a></td>
									<td class="td"><a href="bookedit?edit=edit&janCode=<%= columns.getJanCode() %>"><%= columns.getBookKana() %></a></td>
									<td class="td"><a href="bookedit?edit=edit&janCode=<%= columns.getJanCode() %>"><%= columns.getPrice() %></a></td>
									<td class="td"><a href="bookedit?edit=edit&janCode=<%= columns.getJanCode() %>"><%= columns.getIssueDate() %></a></td>
									<td class="td"><a href="bookedit?edit=edit&janCode=<%= columns.getJanCode() %>"><%= columns.getCreateDateTime() %></a></td>
									<td class="td"><a href="bookedit?edit=edit&janCode=<%= columns.getJanCode() %>"><%= columns.getUpdateDateTime() != null? columns.getUpdateDateTime() : "未更新"%></a></td>
								</tr>
							<% } %>
						<% } %>
					</tbody>
			</table>
	</div>
</main>
</body>
<footer>
</footer>
</html>