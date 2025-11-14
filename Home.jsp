<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Admin: home</title>
<%@include file="allCSS.jsp"%>
<style>
.card {
    transition: all 0.3s ease;
    cursor: pointer;
    border: none;
    border-radius: 12px;
}

.card:hover {
    transform: translateY(-6px);
    box-shadow: 0 8px 18px rgba(0, 0, 0, 0.15);
}

a {
    text-decoration: none !important;
}

a:hover {
    text-decoration: none !important;
}

.icon-add {
    color: #28a745;
}

.icon-allbook {
    color: #007bff;
}

.icon-order {
    color: #fd7e14;
}

.icon-logout {
    color: #dc3545;
}

.card h4 {
    font-weight: 600;
    color: #343a40;
}

.container {
    margin-top: 60px;
}

.card:hover i {
    opacity: 0.8;
    transform: scale(1.1);
    transition: 0.3s;
}

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
<body>
    <%@include file="Navber.jsp"%>
    <c:if test="${empty userobj}">
        <c:redirect url="../login.jsp" />
    </c:if>

    <div class="container">
        <div class="row justify-content-center">
            <div class="col-md-3 mb-4">
                <a href="add_book.jsp">
                    <div class="card text-center shadow-sm">
                        <div class="card-body">
                            <i class="fas fa-plus-square fa-3x mb-3 icon-add"></i>
                            <h4>Add Books</h4>
                        </div>
                    </div>
                </a>
            </div>

            <div class="col-md-3 mb-4">
                <a href="all_book.jsp">
                    <div class="card text-center shadow-sm">
                        <div class="card-body">
                            <i class="fas fa-eye fa-3x mb-3 icon-allbook"></i>
                            <h4>All Books</h4>
                        </div>
                    </div>
                </a>
            </div>

            <div class="col-md-3 mb-4">
                <a href="order.jsp">
                    <div class="card text-center shadow-sm">
                        <div class="card-body">
                            <i class="fas fa-shopping-cart fa-3x mb-3 icon-order"></i>
                            <h4>Manage Orders</h4>
                        </div>
                    </div>
                </a>
            </div>

            <div class="col-md-3 mb-4">
                <a data-toggle="modal" data-target="#exampleModalCenter">
                    <div class="card text-center shadow-sm">
                        <div class="card-body">
                            <i class="fas fa-sign-out-alt fa-3x mb-3 icon-logout"></i>
                            <h4>Logout</h4>
                        </div>
                    </div>
                </a>
            </div>
        </div>
    </div>

    <!-- Footer -->
    <footer class="text-center">
        <div class="container">
            <h5>E-Book Management System</h5>
            <p>© 2025 All Rights Reserved | Designed by Admin Panel Team</p>
            <div class="social-icons">
                <a href="#"><i class="fab fa-facebook-f"></i></a>
                <a href="#"><i class="fab fa-twitter"></i></a>
                <a href="#"><i class="fab fa-instagram"></i></a>
                <a href="#"><i class="fab fa-linkedin-in"></i></a>
            </div>
        </div>
    </footer>
</body>
</html>