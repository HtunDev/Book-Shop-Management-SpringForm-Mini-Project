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
		<h1>
			<st:message code="app.title"></st:message>
		</h1>


		<div class="card">
			<div class="card-header">Book Search</div>

			<form action="#" class="card-body row">

				<div class="col-auto">
					<label class="col-form-label" for="category">Category</label>
				</div>

				<div class="col-auto">
					<select name="category" id="category" class="form-select">
						<option value="">Search Category</option>
					</select>
				</div>

				<div class="col-auto">
					<label class="col-form-label" for="keyword">Keyword</label>
				</div>

				<div class="col-auto">
					<input type="text" class="form-control" id="keyword"
						placeholder="Search Keyword" />
				</div>

				<div class="col-auto">
					<button class="btn btn-dark">Search</button>

					<a href="#" class="btn btn-info">Upload File</a>

					<c:url value="book/edit" var="bookEdit"></c:url>
					<a href="${bookEdit}" class="btn btn-success">Add New</a>

				</div>
			</form>
		</div>

		<table class="table mt-4">

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
		</table>
	</div>

</body>
</html>