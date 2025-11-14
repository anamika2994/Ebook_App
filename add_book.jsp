<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page isELIgnored="false"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Admin: Add Book</title>
<%@include file="allCSS.jsp"%>

<style>
/* ============================
   Footer
   ============================ */
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
    color: #e53935;
    text-decoration: underline;
}
footer .social-icons a {
    margin: 0 10px;
    font-size: 22px;
    transition: 0.3s;
}
footer .social-icons a:hover {
    transform: translateY(-3px);
}

/* Labels */
label {
    color: #000 !important;
    font-weight: 500;
}

/* Inputs & Textareas */
input.form-control,
textarea.form-control {
    color: #000 !important;
    background-color: #fff !important;
    border-radius: 10px !important;
    border: 2px solid #e9ecef !important;
    padding: 12px 15px !important;
    font-size: 16px;
    line-height: 1.5;
    height: 48px;
    box-sizing: border-box;
    transition: all 0.3s ease;
}
input.form-control:focus,
textarea.form-control:focus {
    border-color: #667eea !important;
    box-shadow: 0 0 0 0.2rem rgba(102, 126, 234, 0.25) !important;
    outline: none !important;
}

/* ============================
   Dropdowns (select) general fix
   ============================ */
select.form-control {
    color: #000 !important;
    background-color: #fff !important;
    border-radius: 10px !important;
    border: 2px solid #e9ecef !important;
    padding: 12px 15px !important;
    font-size: 16px;
    line-height: 1.5;
    height: 48px;
    box-sizing: border-box;
    appearance: none;
    -webkit-appearance: none;
    -moz-appearance: none;
    background-image: url("data:image/svg+xml;charset=US-ASCII,<svg xmlns='http://www.w3.org/2000/svg' width='10' height='5'><polygon points='0,0 10,0 5,5' style='fill:%236c757d;'/></svg>");
    background-repeat: no-repeat;
    background-position: right 15px center;
    background-size: 10px 5px;
    transition: all 0.3s ease;
}
select.form-control:focus {
    border-color: #667eea !important;
    box-shadow: 0 0 0 0.2rem rgba(102, 126, 234, 0.25) !important;
    outline: none !important;
}
select.form-control option {
    color: #000 !important;
    background-color: #fff !important;
}
select.form-control:invalid {
    color: #6c757d !important;
}

/* File input */
input.form-control-file {
    padding: 5px 0;
}

/* Buttons */
.btn-block {
    width: 100%;
    padding: 10px 0;
    font-size: 16px;
}

/* Card hover */
.card {
    border-radius: 12px;
    box-shadow: 0 5px 15px rgba(0,0,0,0.1);
    transition: all 0.3s ease;
}
.card:hover {
    transform: translateY(-3px);
    box-shadow: 0 8px 25px rgba(0,0,0,0.15);
}

/* Responsive */
@media (max-width: 768px) {
    .col-md-4 { margin-bottom: 20px; }
    input.form-control, select.form-control, textarea.form-control { font-size: 14px; height: 45px; }
    .btn-block { font-size: 14px; padding: 8px 0; }
}
</style>
</head>

<body style="background-color: #f0f2f2;">
    <%@include file="Navber.jsp"%>

    <c:if test="${empty userobj}">
        <c:redirect url="../login.jsp" />
    </c:if>

    <div class="container">
        <div class="row justify-content-center">
            <div class="col-md-4">
                <div class="card">
                    <div class="card-body">
                        <h4 class="text-center mb-4">Add Books</h4>

                        <c:if test="${not empty succMsg}">
                            <p class="text-center text-success">${succMsg}</p>
                            <c:remove var="succMsg" scope="session" />
                        </c:if>

                        <c:if test="${not empty failedMsg}">
                            <p class="text-center text-danger">${failedMsg}</p>
                            <c:remove var="failedMsg" scope="session" />
                        </c:if>

                        <form action="../add_book" method="post" enctype="multipart/form-data">
                            <div class="form-group">
                                <label>Book Name*</label>
                                <input name="bname" type="text" class="form-control" required>
                            </div>

                            <div class="form-group">
                                <label>Author Name*</label>
                                <input name="author" type="text" class="form-control" required>
                            </div>

                            <div class="form-group">
                                <label>Price*</label>
                                <input name="price" type="number" class="form-control" required>
                            </div>

                            <div class="form-group">
                                <label>Book Categories*</label>
                                <select name="btype" class="form-control" required>
                                    <option value="" disabled selected>Select Category</option>
                                    <option value="Fiction">Fiction</option>
                                    <option value="Non-Fiction">Non-Fiction</option>
                                    <option value="Educational">Educational</option>
                                    <option value="Professional">Professional</option>
                                    <option value="Children">Children</option>
                                    <option value="Comics">Comics</option>
                                </select>
                            </div>

                            <div class="form-group">
                                <label>Book Status*</label>
                                <select name="bstatus" class="form-control" required>
                                    <option value="" disabled selected>Select Status</option>
                                    <option value="Active">Active</option>
                                    <option value="Inactive">Inactive</option>
                                </select>
                            </div>

                            <div class="form-group">
                                <label>Upload Photo*</label>
                                <input name="bimg" type="file" class="form-control-file" required accept="image/*">
                            </div>

                            <div class="form-group">
                                <label>Upload PDF File</label>
                                <input name="bpdf" type="file" class="form-control-file" accept=".pdf">
                                <small class="form-text text-muted">Optional: Upload PDF version of the book for users to read online</small>
                            </div>

                            <button type="submit" class="btn btn-primary btn-block">Add Book</button>
                        </form>

                    </div>
                </div>
            </div>
        </div>
    </div>

    <!-- Footer -->
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
