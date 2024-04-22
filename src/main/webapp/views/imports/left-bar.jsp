<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="st" uri="http://www.springframework.org/tags"%>
<div class="card">
	<div class="card-header">Book Search</div>

	<form action="#" class="card-body">

		<div class="mb-4">
			<label class="col-form-label" for="category">Category</label> <select
				name="category" id="category" class="form-select">
				<option value="">Search Category</option>
			</select>
		</div>

		<div class="mb-4">
			<label class="form-label" for="keyword">Keyword</label>
			<input type="text" class="form-control" id="keyword" placeholder="Search Keyword" />
		</div>

		<div class="d-grid gap-2">
			<button class="btn btn-dark">Search</button>

			<a href="#" class="btn btn-info">Upload File</a>

			<c:url value="book/edit" var="bookEdit"></c:url>
			<a href="${bookEdit}" class="btn btn-success">Add New</a>

		</div>
	</form>
</div>