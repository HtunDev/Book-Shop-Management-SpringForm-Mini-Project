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
	</div>

</body>
</html>