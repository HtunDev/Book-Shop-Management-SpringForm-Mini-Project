<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="st" uri="http://www.springframework.org/tags"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title><st:message code="app.title"></st:message></title>
<c:url var="bootstrapCss" value="/resources/css/bootstrap.min.css"></c:url>
<c:url var="bootstrapJs" value="/resources/css/bootstrap.bundle.min.js"></c:url>

<script type="text/javascript" src="${bootstrapJs}"></script>
<link rel="stylesheet" href="${bootstrapCss}" />

</head>
<body>

	<div class="container">

		<h1 class="mt-4 mb-4">
			<st:message code="app.title"></st:message>
		</h1>

		<div class="row">

			<div class="col-9">

				<div class="card">
					<div class="card-header">Book Lists</div>

					<div class="card-body">

						<table class="table table-striped">

							<thead>

								<tr>
									<th>Id</th>
									<th>Title</th>
									<th>Author</th>
									<th>Category</th>
									<th>Price</th>
									<th>Remark</th>
								</tr>

							</thead>

							<tbody>

								<c:forEach var="book" items="${bookLists}">
									<tr>
										<td>${book.id}</td>
										<td><c:url value="/book/edit" var="editLink">
												<c:param name="id" value="${book.id}"></c:param>
											</c:url> <a href="${editLink}">${book.title}</a></td>
										<td>${book.author}</td>
										<td>${book.category.name}</td>
										<td>${book.price}</td>
										<td>${book.remark}</td>
									</tr>
								</c:forEach>

							</tbody>

						</table>
					</div>
				</div>
			</div>

			<div class="col">
				<c:url value="/views/imports/left-bar.jsp" var="importJSP"></c:url>
				<c:import url="${importJSP}"></c:import>
			</div>

		</div>

	</div>

</body>
</html>