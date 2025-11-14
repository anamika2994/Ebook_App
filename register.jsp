<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page isELIgnored="false" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Ebook:register</title>
<%@include file="allcomponent/allCSS.jsp"%>
</head>
<body style="background-color: #f0f1f2;">
	<%@include file="allcomponent/Navber.jsp"%>
	<div class="container p-2">
		<div class="row">
			<div class="col-md-4 offset-md-4">
				<div class="card">
					<div class="card-body">

						<c:if test="${not empty succMsg }">
							<p class="text-center text-success">${succMsg }</p>
							<c:remove var="succMsg" scope="session" />
						</c:if>

						<c:if test="${not empty failedMsg }">
							<p class="text-center text-danger">${failedMsg }</p>
							<c:remove var="failedMsg" scope="session" />
						</c:if>
						<h4 class="text-center">Registration Now</h4>

						<form action="register" method="post">

							<!-- Full Name -->
							<div class="form-group">
								<label for="fname">Enter Full Name</label> <input type="text"
									class="form-control" id="fname" name="fname" required
									placeholder="Enter your full name">
							</div>

							<!-- Email -->
							<div class="form-group">
								<label for="email">Email Address</label> <input type="email"
									class="form-control" id="email" name="email" required
									placeholder="Enter your email">
							</div>

							<!-- Phone -->
							<div class="form-group">
								<label for="phno">Phone No</label> <input type="tel"
									class="form-control" id="phno" name="phno" required
									placeholder="Enter phone number">
							</div>

							<!-- Password -->
							<div class="form-group">
								<label for="password">Password</label> <input type="password"
									class="form-control" id="password" name="password" required
									placeholder="Enter your password">
							</div>

							<!-- Checkbox -->
							<div class="form-check">
								<input type="checkbox" class="form-check-input" id="check"
									name="check" > <label class="form-check-label"
									for="check"> I agree to the terms and conditions </label>
							</div>

							<!-- Submit Button -->
							<button type="submit" class="btn btn-primary mt-3">Submit</button>
						</form>

					</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>