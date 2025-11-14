<%@ page import="java.sql.Connection"%>
<%@ page import="com.DB.DBconnect"%>
<%@ page import="com.DAO.BookDAOimpl"%>
<%@ page import="com.entity.BookDtls"%>
<%@ page import="com.entity.user"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Book Details</title>
<%@include file="allcomponent/allCSS.jsp"%>
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">

<style>
body {
	background-color: #f8f9fa;
	font-family: 'Poppins', sans-serif;
}

.details-container {
	margin-top: 50px;
	background: #fff;
	padding: 20px;
	border-radius: 12px;
	box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
	max-width: 850px;
	margin-left: auto;
	margin-right: auto;
}

.book-img {
	width: 100%;
	max-width: 200px;
	height: 280px;
	object-fit: contain;
	border-radius: 10px;
	border: 1px solid #ddd;
	background-color: #f8f9fa;
}

.book-title {
	font-size: 22px;
	font-weight: 600;
	color: #343a40;
}

.price {
	color: #e53935;
	font-size: 20px;
	font-weight: 600;
}

.icon-info i {
	color: #28a745;
	font-size: 18px;
	margin-right: 8px;
}

.icon-info p {
	font-size: 14px;
	margin-bottom: 6px;
}

.btn-cart {
	font-size: 16px;
	padding: 8px 20px;
}
</style>
</head>
<body>
	<%@include file="allcomponent/Navber.jsp"%>

	<%
	String bookIdStr = request.getParameter("bookId");
	if (bookIdStr != null) {
		int bookId = Integer.parseInt(bookIdStr);
		BookDAOimpl dao = new BookDAOimpl(DBconnect.getConn());
		BookDtls b = dao.getBookById(bookId);
		user u = (user) session.getAttribute("userobj"); // session থেকে user
		if (b != null && u != null) {
	%>

	<div class="container details-container">
		<div class="row">
			<!-- Left Side: Book Image -->
			<div class="col-md-5 text-center">
				<img src="book/<%=b.getPhotoName()%>" class="book-img mb-3"
					alt="<%=b.getBookName()%>">
			</div>

			<!-- Right Side: Book Details -->
			<div class="col-md-7">
				<h3 class="book-title"><%=b.getBookName()%></h3>
				<p>
					<strong>Author:</strong>
					<%=b.getAuthor()%></p>
				<p>
					<strong>Category:</strong>
					<%=b.getBookCategory()%></p>
				<p>
					<strong>Status:</strong>
					<%=b.getStatus()%></p>

				<hr>

				<div class="icon-info">
					<p>
						<i class="fas fa-truck"></i> Free Delivery
					</p>
					<p>
						<i class="fas fa-sync-alt"></i> Return Available
					</p>
					<p>
						<i class="fas fa-money-bill-wave"></i> Cash on Delivery
					</p>
				</div>

				<hr>

				<div class="d-flex align-items-center">
					<a
						href="<%=request.getContextPath()%>/cart?bid=<%=b.getId()%>&uid=<%=u.getUserid()%>"
						class="btn btn-danger btn-cart mr-3"> <i
						class="fas fa-shopping-cart"></i> Add to Cart
					</a> <span class="price">$<%=b.getPrice()%></span>
				</div>

				<a href="index.jsp" class="btn btn-outline-secondary mt-4">Back
					to Home</a>
			</div>
		</div>
	</div>

	<%
	} else {
	%>
	<div class="container text-center mt-5">
		<h3>Book not found or User not logged in!</h3>
		<a href="index.jsp" class="btn btn-primary mt-3">Back to Home</a>
	</div>
	<%
	}
	} else {
	%>
	<div class="container text-center mt-5">
		<h3>Invalid Request!</h3>
		<a href="index.jsp" class="btn btn-primary mt-3">Back to Home</a>
	</div>
	<%
	}
	%>

</body>
</html>
