<%@page import="com.entity.user"%>
<%@ page import="java.sql.Connection"%>
<%@ page import="com.DAO.BookDAOimpl"%>
<%@ page import="com.entity.BookDtls"%>
<%@ page import="java.util.List, java.util.ArrayList"%>

<%@ page import="com.DB.DBconnect"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Online Ebook Store: Home</title>
<%@include file="allcomponent/allCSS.jsp"%>
<style> /* -------- Hero Section ---------- */
.back-img {
	background: url("img/bb.jpg") no-repeat center center/cover;
	height: 50vh;
	width: 100%;
	display: flex;
	flex-direction: column;
	justify-content: center;
	align-items: center;
	text-align: center;
}

.back-img h2 {
	font-size: 60px;
	font-weight: bold;
	letter-spacing: 2px;
	text-transform: uppercase;
	color: #fff;
}

.back-img p {
	font-size: 20px;
	font-style: italic;
	margin-top: 15px;
	color: #f0f0f0;
	width: 70%;
} /* -------- Card Hover ---------- */
.crd-ho:hover {
	background-color: #f8f8f8;
	box-shadow: 0 0 15px rgba(0, 0, 0, 0.2);
	transform: translateY(-5px);
	transition: all 0.3s ease-in-out;
} /* -------- Body BG ---------- */
body {
	background-color: #f5f5f5;
} /* -------- Section Heading ---------- */
.section-title {
	font-size: 20px; /* h5 এর জন্য সাইজ মানানসই করা হলো */
	font-weight: bold;
	text-transform: uppercase;
	text-align: center;
	margin: 40px 0 20px 0;
	color: #263238;
	letter-spacing: 1px;
	position: relative;
}

.section-title::after {
	content: "";
	display: block;
	width: 60px;
	height: 3px;
	background-color: #e53935;
	margin: 8px auto 0;
	border-radius: 2px;
} /* -------- Price ---------- */
.price-text {
	text-align: right;
	font-weight: bold;
	color: #e53935;
	margin-top: 5px;
} /* -------- View All Button ---------- */
.view-all-btn {
	margin-top: 20px;
	text-align: center;
}

.view-all-btn a {
	padding: 5px 18px;
	font-size: 14px;
	font-weight: 600;
	border-radius: 20px;
} /* -------- Footer ---------- */
footer {
	background: #263238;
	color: #fff;
	padding: 40px 0;
	margin-top: 80px;
}

footer a {
	color: #fff;
	text-decoration: none;
}

footer a:hover {
	text-decoration: underline;
}

footer .social-icons a {
	margin: 0 10px;
	font-size: 22px;
	color: #fff;
	transition: 0.3s;
}

footer .social-icons a:hover {
	color: #e53935;
}
</style>
</head>
<body style="background-color: #${product.color};">

	<%
	user u = (user) session.getAttribute("userobj");
	%>
	<%@include file="allcomponent/Navber.jsp"%>
	<div class="container-fluid back-img">
		<h2>Welcome To Ebook Store</h2>
		<p>The more that you read, the more things you will know. The more
			that you learn, the more places you’ll go.</p>
	</div>
	<!-- ================== 📘 Fiction Section ================== -->
	<h1 class="section-title">ALL BOOKS</h1>
	<div class="container">

		<h5 class="section-title">Fiction Books</h5>
		<div class="row">

			<%
			try {
				BookDAOimpl dao = new BookDAOimpl(DBconnect.getConn());
				List<BookDtls> list = dao.getFictionBook();
				for (BookDtls b : list) {
			%>
			<div class="col-md-3 mb-4">
				<div class="crd-ho">
					<div class="card-body text-center">
						<img alt="" src="book/<%=b.getPhotoName()%>"
							style="width: 150px; height: 200px;" class="img-thumbnail">

						<p><%=b.getBookName()%></p>
						<p><%=b.getAuthor()%></p>
						<p>
							Categories:
							<%=b.getBookCategory()%></p>
						<div class="row">
							<%
							if (u == null) {
							%>
							<a href="login.jsp" class="btn btn-danger btn-sm ml-2">Add
								Cart</a>
							<%
							} else {
							%>
							<a href="cart?bid=<%=b.getId() %>&&uid=<%=u.getUserid()%>" class="btn btn-danger btn-sm ml-2">Add
								Cart</a>
							<%
							}
							%>
							<a href="details_book.jsp?bookId=<%=b.getId()%>" class="btn
							btn-success btn-sm ml-2">View Details</a> <a href=""
								class="btn btn-danger btn-sm ml-1"><i
								class="fa-solid fa-dollar-sign"></i><%=b.getPrice()%></a>
						</div>
					</div>
				</div>
			</div>
			<%
			}
			} catch (Exception e) {
			out.println("Error: " + e.getMessage());
			}
			%>

		</div>
		<div class="view-all-btn">
			<a href="all_fictionbook.jsp"
				class="btn btn-danger text-white btn-sm">VIEW ALL</a>
		</div>
	</div>


	<!-- Non-Fiction Books -->
	<h5 class="section-title">Non-Fiction Books</h5>
	<div class="row">
		<%
		try {
			BookDAOimpl dao = new BookDAOimpl(DBconnect.getConn());
			List<BookDtls> nonFictionList = dao.getNonFictionBook();
			for (BookDtls b : nonFictionList) {
		%>
		<div class="col-md-3 mb-4">
			<div class="crd-ho">
				<div class="card-body text-center">
					<img alt="" src="book/<%=b.getPhotoName()%>"
						style="width: 150px; height: 200px;" class="img-thumbnail">
					<p><%=b.getBookName()%></p>
					<p><%=b.getAuthor()%></p>
					<p>
						Categories:
						<%=b.getBookCategory()%></p>
					<div class="row">
						<%
						if (u == null) {
						%>
						<a href="login.jsp" class="btn btn-danger btn-sm ml-2">Add
							Cart</a>
						<%
						} else {
						%>
						<a href="cart?bid=<%=b.getId() %>&&uid=<%=u.getUserid()%>" class="btn btn-danger btn-sm ml-2">Add
							Cart</a>
						<%
						}
						%>
						<a href="details_book.jsp?bookId=<%=b.getId()%>" class="btn
						btn-success btn-sm ml-2">View Details</a> <a href=""
							class="btn btn-danger btn-sm ml-1"><i
							class="fa-solid fa-dollar-sign"></i><%=b.getPrice()%></a>
					</div>
				</div>
			</div>
		</div>
		<%
		}
		} catch (Exception e) {
		out.println("Error: " + e.getMessage());
		}
		%>
	</div>
	<div class="view-all-btn">
		<a href="all_nonfictionbook.jsp"
			class="btn btn-danger text-white btn-sm">VIEW ALL</a>
	</div>

	<!-- Educational Books -->
	<h5 class="section-title">Educational Books</h5>
	<div class="row">
		<%
		try {
			BookDAOimpl dao = new BookDAOimpl(DBconnect.getConn());
			List<BookDtls> eduList = dao.getEducationalBook();
			for (BookDtls b : eduList) {
		%>
		<div class="col-md-3 mb-4">
			<div class="crd-ho">
				<div class="card-body text-center">
					<img alt="" src="book/<%=b.getPhotoName()%>"
						style="width: 150px; height: 200px;" class="img-thumbnail">
					<p><%=b.getBookName()%></p>
					<p><%=b.getAuthor()%></p>
					<p>
						Categories:
						<%=b.getBookCategory()%></p>
					<div class="row">
						<%
						if (u == null) {
						%>
						<a href="login.jsp" class="btn btn-danger btn-sm ml-2">Add
							Cart</a>
						<%
						} else {
						%>
						<a href="cart?bid=<%=b.getId() %>&&uid=<%=u.getUserid()%>" class="btn btn-danger btn-sm ml-2">Add
							Cart</a>
						<%
						}
						%>
						<a href="details_book.jsp?bookId=<%=b.getId()%>" class="btn
						btn-success btn-sm ml-2">View Details</a> <a href=""
							class="btn btn-danger btn-sm ml-1"><i
							class="fa-solid fa-dollar-sign"></i><%=b.getPrice()%></a>
					</div>
				</div>
			</div>
		</div>
		<%
		}
		} catch (Exception e) {
		out.println("Error: " + e.getMessage());
		}
		%>
	</div>
	<div class="view-all-btn">
		<a href="all_Educationalbook.jsp"
			class="btn btn-danger text-white btn-sm">VIEW ALL</a>
	</div>

	<!-- Professional Books -->
	<h5 class="section-title">Professional Books</h5>
	<div class="row">
		<%
		try {
			BookDAOimpl dao = new BookDAOimpl(DBconnect.getConn());
			List<BookDtls> proList = dao.getProfessionalBook();
			for (BookDtls b : proList) {
		%>
		<div class="col-md-3 mb-4">
			<div class="crd-ho">
				<div class="card-body text-center">
					<img alt="" src="book/<%=b.getPhotoName()%>"
						style="width: 150px; height: 200px;" class="img-thumbnail">
					<p><%=b.getBookName()%></p>
					<p><%=b.getAuthor()%></p>
					<p>
						Categories:
						<%=b.getBookCategory()%></p>
					<div class="row">
						<%
						if (u == null) {
						%>
						<a href="login.jsp" class="btn btn-danger btn-sm ml-2">Add
							Cart</a>
						<%
						} else {
						%>
						<a href="cart?bid=<%=b.getId() %>&&uid=<%=u.getUserid()%>" class="btn btn-danger btn-sm ml-2">Add
							Cart</a>
						<%
						}
						%>
						<a href="details_book.jsp?bookId=<%=b.getId()%>" class="btn
						btn-success btn-sm ml-2">View Details</a> <a href=""
							class="btn btn-danger btn-sm ml-1"><i
							class="fa-solid fa-dollar-sign"></i><%=b.getPrice()%></a>
					</div>
				</div>
			</div>
		</div>
		<%
		}
		} catch (Exception e) {
		out.println("Error: " + e.getMessage());
		}
		%>
	</div>
	<div class="view-all-btn">
		<a href="all_profesionalbook.jsp"
			class="btn btn-danger text-white btn-sm">VIEW ALL</a>
	</div>

	<!-- Children Books -->
	<h5 class="section-title">Children Books</h5>
	<div class="row">
		<%
		try {
			BookDAOimpl dao = new BookDAOimpl(DBconnect.getConn());
			List<BookDtls> childrenList = dao.getChildrenBook();
			for (BookDtls b : childrenList) {
		%>
		<div class="col-md-3 mb-4">
			<div class="crd-ho">
				<div class="card-body text-center">
					<img alt="" src="book/<%=b.getPhotoName()%>"
						style="width: 150px; height: 200px;" class="img-thumbnail">
					<p><%=b.getBookName()%></p>
					<p><%=b.getAuthor()%></p>
					<p>
						Categories:
						<%=b.getBookCategory()%></p>
					<div class="row">
						<%
						if (u == null) {
						%>
						<a href="login.jsp" class="btn btn-danger btn-sm ml-2">Add
							Cart</a>
						<%
						} else {
						%>
						<a href="cart?bid=<%=b.getId() %>&&uid=<%=u.getUserid()%>" class="btn btn-danger btn-sm ml-2">Add
							Cart</a>
						<%
						}
						%>
						<a href="details_book.jsp?bookId=<%=b.getId()%>" class="btn
						btn-success btn-sm ml-2">View Details</a> <a href=""
							class="btn btn-danger btn-sm ml-1"><i
							class="fa-solid fa-dollar-sign"></i><%=b.getPrice()%></a>
					</div>
				</div>
			</div>
		</div>
		<%
		}
		} catch (Exception e) {
		out.println("Error: " + e.getMessage());
		}
		%>
	</div>
	<div class="view-all-btn">
		<a href="all_childbook.jsp" class="btn btn-danger text-white btn-sm">VIEW
			ALL</a>
	</div>

	<!-- Comics Books -->
	<h5 class="section-title">Comics Books</h5>
	<div class="row">
		<%
		try {
			BookDAOimpl dao = new BookDAOimpl(DBconnect.getConn());
			List<BookDtls> comicsList = dao.getComicsBook();
			for (BookDtls b : comicsList) {
		%>
		<div class="col-md-3 mb-4">
			<div class="crd-ho">
				<div class="card-body text-center">
					<img alt="" src="book/<%=b.getPhotoName()%>"
						style="width: 150px; height: 200px;" class="img-thumbnail">
					<p><%=b.getBookName()%></p>
					<p><%=b.getAuthor()%></p>
					<p>
						Categories:
						<%=b.getBookCategory()%></p>
					<div class="row">
						<%
						if (u == null) {
						%>
						<a href="login.jsp" class="btn btn-danger btn-sm ml-2">Add
							Cart</a>
						<%
						} else {
						%>
						<a href="cart?bid=<%=b.getId() %>&&uid=<%=u.getUserid()%>" class="btn btn-danger btn-sm ml-2">Add
							Cart</a>
						<%
						}
						%>
						<a href="details_book.jsp?bookId=<%=b.getId()%>"
							class="btn btn-success btn-sm ml-2">View Details</a> <a href=""
							class="btn btn-danger btn-sm ml-1"><i
							class="fa-solid fa-dollar-sign"></i><%=b.getPrice()%></a>
					</div>
				</div>
			</div>
		</div>
		<%
		}
		} catch (Exception e) {
		out.println("Error: " + e.getMessage());
		}
		%>
	</div>

	<div class="view-all-btn">
		<a href="all_comiesbook.jsp" class="btn btn-danger text-white btn-sm">VIEW
			ALL</a>
	</div>



	<!-- 🦶 Footer -->
	<footer>
		<div class="container text-center">
			<h4>Online Ebook Store</h4>
			<p>Your one-stop destination for all types of books.</p>
			<div class="social-icons mb-3">
				<a href="#"><i class="fab fa-facebook"></i></a> <a href="#"><i
					class="fab fa-twitter"></i></a> <a href="#"><i
					class="fab fa-instagram"></i></a>
			</div>
			<div class="footer-links mb-3">
				<a href="#">About Us</a> | <a href="#">Contact</a> | <a href="#">Terms
					& Conditions</a>
			</div>
			<p>&copy; 2025 Online Ebook Store. All Rights Reserved.</p>
		</div>
	</footer>
</body>
</html>