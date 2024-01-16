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
	 <% int i = 0; %>
	</head>
	<body>
		<header>
			<div id="header_inner">
				 <div class="header_left">
				 	<h1 class="site_title"><a href="booklist">書籍管理アプリ</a></h1>
				 </div>
				 <div class="header_right">
				  	 <nav>
						   <ul>
							   <li><a href="bookregister">新規登録</a></li>
						   </ul>
				 	 </nav>
				 </div>
			</div>
		</header>
			<main>
				<div class="container">
					<p id="section_title">商品一覧</p>
					 <span>※項目欄横のマークで昇順もしくは降順に並び替えが可能です。</span>
					<p id="message">${message}</p>
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
									      <th>
									      	削除
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
										 <td></td>
										</tr>
									<% } else { %>
										<% for (BookBean columns : bookList) { %>
											<tr>
												<td class="td"><a href="bookedit?edit=edit&janCode=<%= columns.getJanCode() %>"><%= columns.getJanCode() %></a></td>
												<td class="td"><a href="bookedit?edit=edit&janCode=<%= columns.getJanCode() %>"><%= columns.getIsbnCode() %></a></td>
												<td class="td"><a href="bookedit?edit=edit&janCode=<%= columns.getJanCode() %>"><%= columns.getBookName() %></a></td>
												<td class="td"><a href="bookedit?edit=edit&janCode=<%= columns.getJanCode() %>"><%= columns.getBookKana() %></a></td>
												<td class="td"><a href="bookedit?edit=edit&janCode=<%= columns.getJanCode() %>"><%= columns.getPrice() %>円</a></td>
												<td class="td"><a href="bookedit?edit=edit&janCode=<%= columns.getJanCode() %>"><%= columns.getIssueDate() %></a></td>
												<td class="td"><a href="bookedit?edit=edit&janCode=<%= columns.getJanCode() %>"><%= columns.getCreateDateTime() %></a></td>
												<td class="td"><a href="bookedit?edit=edit&janCode=<%= columns.getJanCode() %>"><%= columns.getUpdateDateTime() != null? columns.getUpdateDateTime() : "未更新"%></a></td>
												<td class="delete_icon" id='modalOpen<%= i %>'><svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-trash3" viewBox="0 0 16 16">
			  									<path d="M6.5 1h3a.5.5 0 0 1 .5.5v1H6v-1a.5.5 0 0 1 .5-.5ZM11 2.5v-1A1.5 1.5 0 0 0 9.5 0h-3A1.5 1.5 0 0 0 5 1.5v1H2.506a.58.58 0 0 0-.01 0H1.5a.5.5 0 0 0 0 1h.538l.853 10.66A2 2 0 0 0 4.885 16h6.23a2 2 0 0 0 1.994-1.84l.853-10.66h.538a.5.5 0 0 0 0-1h-.995a.59.59 0 0 0-.01 0H11Zm1.958 1-.846 10.58a1 1 0 0 1-.997.92h-6.23a1 1 0 0 1-.997-.92L3.042 3.5h9.916Zm-7.487 1a.5.5 0 0 1 .528.47l.5 8.5a.5.5 0 0 1-.998.06L5 5.03a.5.5 0 0 1 .47-.53Zm5.058 0a.5.5 0 0 1 .47.53l-.5 8.5a.5.5 0 1 1-.998-.06l.5-8.5a.5.5 0 0 1 .528-.47ZM8 4.5a.5.5 0 0 1 .5.5v8.5a.5.5 0 0 1-1 0V5a.5.5 0 0 1 .5-.5Z"/>
												</svg>
												</td>
												<div id="easyModal<%= i %>" class="modal">
																		    <div class="modal-content">
																		      <div class="modal-body">
																		         <p>この書籍を削除してもよろしいですか？</p>
																				        <div class="delete_btn">
																					        <label class="modalClose">キャンセル</label>
																					        <form action="bookdelete" method="get">
																					        		<input type="hidden" name="delete" value="delete>">
																						      		<input type="hidden" name="janCode" value="<%= columns.getJanCode() %>">
																						            <input type="hidden" name="bookName" value="<%= columns.getBookName() %>">
																					            <input class="delete" type="submit" value="削除する">
																					        </form>
																				        </div>
																		      </div>
																		    </div>
																	   </diV>
																		<% i += 1 ;  %>		
											</tr>
										<% } %>
									<% } %>
								</tbody>
						</table>
				</div>
				 <div id="count" data-repeat-count=<%= i %>></div>  
			</main>
			<footer>
				<span>
				 	<p>&copy; kishimoto</p>
				</span>
			</footer>
			<script>
			
			  var countrepeat = document.getElementById("count").getAttribute("data-repeat-count");
			    

				for( let j = 0 ; j < countrepeat ; j++ ){

					const buttonOpen = document.getElementById("modalOpen" + j);
					const modal = document.getElementById("easyModal" + j);
					const buttonClose = document.getElementsByClassName('modalClose')[j];
				
					// ボタンがクリックされた時
					buttonOpen.addEventListener('click', modalOpen);
					function modalOpen() {
					  modal.style.display = 'block';
					}
				
					// バツ印がクリックされた時
					buttonClose.addEventListener('click', modalClose);
					function modalClose() {
					  modal.style.display = 'none';
					}
				
					// モーダルコンテンツ以外がクリックされた時
					addEventListener('click', outsideClose);
					function outsideClose(e) {
					  if (e.target == modal) {
					    modal.style.display = 'none';
					  }

					}} 
				
			</script>
	</body>
</html>