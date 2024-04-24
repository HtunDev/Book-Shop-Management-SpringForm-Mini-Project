<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="st" uri="http://www.springframework.org/tags"%>
<div class="card">
	<div class="card-header">Book Search</div>

	<c:url value="/book" var="searchUrl"></c:url>
	<form action="${searchUrl}" class="card-body">

		<div class="mb-4">
			<label class="form-label" for="category">Category</label> 
			<select id="category" name="category" class="form-select">
				<option value="">Search Category</option>
				<c:forEach var="c" items="${categories}">
					<c:choose>
						<c:when test="${c.id eq params.category}">
							<option value="${c.id}" selected="selected">${c.name}</option>
						</c:when>
						
						<c:otherwise>
							<option value="${c.id}">${c.name}</option>
						</c:otherwise>
					</c:choose>
				</c:forEach>
			</select>
		</div>

		<div class="mb-4">
			<label class="form-label" for="keyword">Keyword</label> 
			<input type="text" class="form-control" id="keyword" name="keyword"
				value="${params.keyword}" placeholder="Search Keyword" />
		</div>

		<div class="d-grid gap-2">
			<button class="btn btn-secondary">Search</button>

			<a href="#" class="btn btn-primary">Upload File</a>

			<c:url value="/book/edit" var="bookEdit"></c:url>
			<a href="${bookEdit}" class="btn btn-success">Add New</a>

		</div>
	</form>
</div>