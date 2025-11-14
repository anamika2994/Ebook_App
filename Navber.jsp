<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page isELIgnored="false"%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<div class="container-fluid"
	style="height: 10px; background-color: #263238"></div>
<div class="container-fluid p-3">
	<div class="row align-items-center">
		<!-- Title -->
		<div class="col-md-3 d-flex align-items-center">
			<h3 class="m-0 ebook-title">
				<i class="fa-solid fa-book"></i> Online Ebook Store
			</h3>
		</div>
		<!-- Search Bar -->
		<div class="col-md-6 d-flex justify-content-center">
			<form class="form-inline my-2 my-lg-0 d-flex" action="search" method="get">
				<input class="form-control mr-2" type="search" name="query"
					placeholder="Search books..." aria-label="Search"
					style="width: 320px; border-radius: 20px; padding: 8px 15px;">
				<button class="btn btn-primary" type="submit"
					style="border-radius: 20px; padding: 8px 20px;">Search</button>
			</form>
		</div>

		<!-- Login & Register -->
		<c:if test="${not empty userobj}">
			<div class="col-md-3">
				<a href="cart.jsp"><i class="fas fa-cart-plus fa-2x"></i></a> <a
					href="" class="btn btn-success"><i
					class="fas fa-user-plus"></i> ${userobj.name}</a> <a href="logout"
					class="btn btn-primary text-white"><i
					class="fas fa-sign-in-alt"></i> Logout</a>
			</div>
		</c:if>

		<!-- ✅ Added new Dashboard section -->
		<c:if test="${not empty userobj}">
			<div class="col-md-3">
				<a href="user_dashboard.jsp" class="btn btn-info mr-2"> <i
					class="fas fa-tachometer-alt"></i> Dashboard
				</a>
				<!-- বাকি code unchanged -->
			</div>
		</c:if>
		<!-- ✅ End added section -->

		<c:if test="${empty userobj}">
			<div class="col-md-3">
				<a href="login.jsp" class="btn btn-success"><i
					class="fas fa-sign-in-alt"></i> Login</a><a href="register.jsp"
					class="btn btn-primary text-white"><i class="fas fa-user-plus"></i>
					Register</a>
			</div>
		</c:if>
	</div>
</div>

<nav class="navbar navbar-expand-lg navbar-dark bg-custom">
	<button class="navbar-toggler" type="button" data-toggle="collapse"
		data-target="#navbarSupportedContent"
		aria-controls="navbarSupportedContent" aria-expanded="false"
		aria-label="Toggle navigation">
		<span class="navbar-toggler-icon"></span>
	</button>
	<div class="collapse navbar-collapse" id="navbarSupportedContent">
		<ul class="navbar-nav mr-auto">
			<!-- Home button -->
			<li class="nav-item active"><a class="nav-link home-btn"
				href="index.jsp"> <i class="fa-solid fa-house-chimney"></i> Home
			</a></li>
			<li class="nav-item"><a class="nav-link"
				href="all_fictionbook.jsp"><i class="fa-solid fa-book-open"></i>
					Fiction</a></li>
			<li class="nav-item"><a class="nav-link"
				href="all_nonfictionbook.jsp"><i class="fa-solid fa-book-open"></i>
					Non-Fiction</a></li>
			<li class="nav-item"><a class="nav-link"
				href="all_Educationalbook.jsp"><i class="fa-solid fa-book-open"></i>
					Educational</a></li>

			<li class="nav-item"><a class="nav-link"
				href="all_profesionalbook.jsp"><i class="fa-solid fa-book-open"></i>
					Professional</a></li>
			<li class="nav-item"><a class="nav-link"
				href="all_childbook.jsp"><i class="fa-solid fa-book-open"></i>
					Children</a></li>
			<li class="nav-item"><a class="nav-link"
				href="all_comiesbook.jsp"><i class="fa-solid fa-book-open"></i>
					comies</a></li>

		</ul>
		<form class="form-inline my-2 my-lg-0">
			<li class="nav-item"><a class="nav-link" href="setting.jsp">
					<i class="fas fa-cog"></i> Settings
			</a></li>
			<li class="nav-item"><a class="nav-link" href="contact.jsp">
					<i class="fas fa-phone"></i> Contact Us
			</a></li>

		</form>
	</div>
</nav>
<style>
.home-btn {
	border-bottom: 3px solid #ffc107;
	font-weight: bold;
}

.home-btn:hover {
	color: #ffc107 !important;
} /* Online Ebook Store name style */
.ebook-title {
	font-family: 'Georgia', serif;
	font-weight: bold;
	font-size: 28px;
	color: #000000;
	text-shadow: none;
	margin-left: 10px;
	white-space: nowrap;
	transition: 0.3s;
}

.ebook-title:hover {
	color: #444444; /* hover-এ light black */
	transform: scale(1.05);
}
</style>
