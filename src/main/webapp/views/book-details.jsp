<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="st" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
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
					<div class="card-header">About Book Details</div>

					<div class="card-body">
						
						<div class="row">
						
							<div class="col">
								<label>Category</label>
								<span class="form-control">${book.category.name}</span>
							</div>
							<div class="col">
								<label>Book Title</label>
								<span class="form-control">${book.title}</span>
							</div>
							<div class="col">
								<label>Author</label>
								<span class="form-control">${book.author}</span>
							</div>
						</div>
						
						<div class="row mt-3">
						
							<div class="col-4">
								<label>Price</label>
								<span class="form-control">${book.price}</span>
							</div>
							
							<div class="col">
								<label>Remark</label>
								<span class="form-control">${book.remark}</span>
							</div>
						</div>
						
						<div class="row mt-3">
							<div class="col">
								<c:url value="/book/edit" var="editUrl">
									<c:param name="id" value="${book.id}"></c:param>
								</c:url>
								<a href="${editUrl}" class="btn btn-primary">Edit Book</a>
							</div>
						</div>

					</div>
				</div>

			</div>

			<div class="col">
				<div class="col">
					<c:url value="/views/imports/left-bar.jsp" var="importJSP"></c:url>
					<c:import url="${importJSP}"></c:import>
				</div>
			</div>
		</div>

	</div>

</body>
</html>