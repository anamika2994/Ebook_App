<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.DAO.BookDAOimpl"%>
<%@ page import="com.DB.DBconnect"%>
<%@ page import="java.util.*"%>
<%@ page import="com.entity.BookDtls"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page isELIgnored="false"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Admin:All book</title>
<%@include file="allCSS.jsp"%>
<style>
.table thead {
    background-color: #263238 !important;
    color: white !important;
}

footer {
    background: #263238;
    color: #fff;
    padding: 40px 0;
    margin-top: 80px;
    text-align: center;
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
        <h1 class="text-center my-4">ALL BOOKS</h1>
        
        <c:if test="${not empty succMsg}">
            <div class="alert alert-success text-center">${succMsg}</div>
            <c:remove var="succMsg" scope="session" />
        </c:if>

        <c:if test="${not empty failedMsg}">
            <div class="alert alert-danger text-center">${failedMsg}</div>
            <c:remove var="failedMsg" scope="session" />
        </c:if>

        <div class="table-responsive">
            <table class="table table-striped table-bordered">
                <thead class="thead-dark">
                    <tr>
                        <th scope="col">ID</th>
                        <th scope="col">IMAGE</th>
                        <th scope="col">BOOK NAME</th>
                        <th scope="col">AUTHOR</th>
                        <th scope="col">PRICE</th>
                        <th scope="col">CATEGORY</th>
                        <th scope="col">STATUS</th>
                        <th scope="col">ACTION</th>
                    </tr>
                </thead>
                <tbody>
                    <%
                    BookDAOimpl dao = new BookDAOimpl(DBconnect.getConn());
                    List<BookDtls> list = dao.getAllBooks();
                    int rowNum = 1;

                    for (BookDtls b : list) {
                    %>
                    <tr>
                        <td><%=rowNum%></td>
                        <td>
                            <img src="../book/<%=b.getPhotoName()%>"
                                style="width: 50px; height: 50px; object-fit: cover;" 
                                class="rounded" />
                        </td>
                        <td><%=b.getBookName()%></td>
                        <td><%=b.getAuthor()%></td>
                        <td>৳<%=b.getPrice()%></td>
                        <td><%=b.getBookCategory()%></td>
                        <td>
                            <span class="badge badge-<%=b.getStatus().equals("Active") ? "success" : "danger"%>">
                                <%=b.getStatus()%>
                            </span>
                        </td>
                        <td>
                            <a href="edit_books.jsp?id=<%=b.getId()%>"
                                class="btn btn-sm btn-primary">
                                <i class="fa-regular fa-pen-to-square"></i> Edit
                            </a>
                            <a href="../delete?id=<%=b.getId()%>" 
                                class="btn btn-sm btn-danger"
                                onclick="return confirm('Are you sure you want to delete this book?')">
                                <i class="fa-solid fa-trash"></i> Delete
                            </a>
                        </td>
                    </tr>
                    <%
                    rowNum++;
                    }
                    %>
                </tbody>
            </table>
        </div>
    </div>

    <footer>
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