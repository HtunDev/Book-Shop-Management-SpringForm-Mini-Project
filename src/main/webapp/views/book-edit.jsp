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
					<div class="card-header">${ book.id eq 0 ? 'Add New' : 'Edit'}
						Book</div>

					<form:form action="/book" cssClass="card-body"
						modelAttribute="book">

						<form:hidden path="id" />

						<div class="row">

							<div class="col">
								<label for="">Category</label>
								<form:select path="category" cssClass="form-select">
									<option value="">Select One</option>
									<form:options items="${categories}" itemValue="id" itemLabel="name" />
								</form:select>
								<form:errors path="category" cssClass="text-danger"></form:errors>
							</div>
							<div class="col">
								<label>Book Title</label>
								<form:input path="title" type="text" cssClass="form-control" placeholder="Enter Book Title" />
								<form:errors path="title" cssClass="text-danger"></form:errors>
								
							</div>
							<div class="col">
								<label>Author</label>
								<form:input path="author" type="text" cssClass="form-control" placeholder="Enter Book's Author" />
								<form:errors path="author" cssClass="text-danger"></form:errors>
							</div>
						</div>

						<div class="row mt-3">

							<div class="col-4">
								<label>Price</label>
								<form:input path="price" type="number" cssClass="form-control" placeholder="Enter Book's Price" />
								<form:errors path="price" cssClass="text-danger"></form:errors>
							</div>

							<div class="col">
								<label>Remark</label>
								<form:input path="remark" type="text" cssClass="form-control" placeholder="Enter Remark" />
							</div>
						</div>

						<div class="row mt-3">
							<div class="col">
								<button class="btn btn-primary">Save Book</button>
							</div>
						</div>

					</form:form>
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