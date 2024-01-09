<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="model.*, model.beans.BookBean" %>
<%@ page import="java.util.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>商品一覧</title>
 <% List<BookBean> bookList = (ArrayList <BookBean>)request.getAttribute("bookList"); %>
</head>
<body>
		<p>商品一覧</p>
		<p>${message}</p>
		<table>
				<thead>
					<tr>
					　<th>JANコード</th>
				      <th>ISBNコード</th>
				      <th>書籍名称</th>
				      <th>書籍名称カナ</th>
				      <th>価格</th>
				      <th>発行日</th>
				      <th>登録日時</th>
				      <th>最終更新日時</th>
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

</body>
</html>