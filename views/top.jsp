<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ 	taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<link href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
<link rel="stylesheet" type="text/css" href="<c:url value="/resources/css/style.css" />">
<script src="https://kit.fontawesome.com/8835088005.js"></script>
<title>トップページ</title>
</head>
<body>
<c:choose >
    <c:when test="${empty userModel.userName}"><%@ include file = "./layouts/header.jsp" %></c:when>
    <c:when test="${not empty userModel.userName}"><%@ include file = "./layouts/header2.jsp" %></c:when>
</c:choose>
<div id="carouselExampleIndicators" class="carousel slide" data-ride="carousel">
  <ol class="carousel-indicators">
    <li data-target="#carouselExampleIndicators" data-slide-to="0" class="active"></li>
    <li data-target="#carouselExampleIndicators" data-slide-to="1"></li>
    <li data-target="#carouselExampleIndicators" data-slide-to="2"></li>
  </ol>
  <div class="carousel-inner">
    <div class="carousel-item active">
      <a href="/school/item?item=4">
      	<img src="<c:url value="resources/img/4.jpg"/>" class="d-block w-100" height="350" alt="...">
      </a>
    </div>
    <div class="carousel-item">
      <a href="/school/item?item=5">
      	<img src="<c:url value="resources/img/5.jpg"/>" class="d-block w-100" height="350" alt="...">
      </a>
    </div>
    <div class="carousel-item">
      <a href="/school/item?item=3">
      	<img src="<c:url value="resources/img/3.jpg"/>" class="d-block w-100" height="350" alt="...">
      </a>
    </div>
  </div>
  <a class="carousel-control-prev" href="#carouselExampleIndicators" role="button" data-slide="prev">
    <span class="carousel-control-prev-icon" aria-hidden="true"></span>
    <span class="sr-only">Previous</span>
  </a>
  <a class="carousel-control-next" href="#carouselExampleIndicators" role="button" data-slide="next">
    <span class="carousel-control-next-icon" aria-hidden="true"></span>
    <span class="sr-only">Next</span>
  </a>
</div>
<div class="container">

<div class="searchbox">
	<form:form modelAttribute="itemModel" class="form-inline m-3">
	  <div class="form-group  mx-auto">
		<form:input path="itemName" size="50" class="form-control"/>
		<button type="submit" class="btn btn-primary">検索</button>
		<form:errors path="*" element="div" cssClass="error" />
	  </div>
	</form:form>
</div>

<div class="d-flex flex-wrap">
<c:forEach var="item" items="${itemList}">
<c:if test="${item.status != 2}">
	<div class="item">
		<img src="<c:url value="resources/img/"/>${item.itemFileName}" alt="${item.itemName}"  width="200" height="250"/>
		<p class="text-center"><a href="/school/item?item=${item.itemCode}"><c:out value="${item.itemName}"></c:out></a></p>
	</div>
</c:if>
</c:forEach>
</div>


</div>


<%@ include file="./layouts/footer.jsp"%>
