<%-- 
    Document   : register
    Created on : 04-Feb-2023, 1:43:29 pm
    Author     : utsav
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>New User</title>

        <%@include file="components/common_css_js.jsp" %>
    </head>
    <body>
        <%@include file="components/navbar.jsp"%>

        <div class="container-fluid"><!--removal of scrolling bar from register page  -->
            <div class="row mt-4"><!--margin top -->
                <div class="col-md-4 offset-md-4">
                    <div class = "card">
                        <%@include file="components/message.jsp" %>
                        <div class="card-body">
                            <div class="container text-center">
                                <img src="https://th.bing.com/th/id/OIP.5WuEGSSscpk16FjLWVNftwAAAA?pid=ImgDet&rs=1" width="70px" height="70px" alt="login"/>
                            </div>
                            <h3 class="text-center my-3">Signup Here!!!</h3>
                            <form action="RegisterServlet" method="post">
                                <div class="mb-3">
                                    <label for="exampleFormControlInput1" class="form-label">User Name</label>
                                    <input name ="user_name" type="text" class="form-control" id="exampleFormControlInput1" placeholder="enter here">
                                </div>
                                <div class="mb-3">
                                    <label for="exampleFormControlInput1" class="form-label">User Email</label>
                                    <input name="user_email" type="email" class="form-control" id="exampleFormControlInput1" placeholder="name@example.com">
                                </div>
                                <div class="mb-3">
                                    <label for="exampleFormControlInput1" class="form-label">User Password</label>
                                    <input name="user_password" type="number" class="form-control" id="exampleFormControlInput1" placeholder="pin">
                                </div>
                                <div class="mb-3">
                                    <label for="exampleFormControlInput1" class="form-label">User Phone</label>
                                    <input name="user_password" type="tel" class="form-control" id="exampleFormControlInput1" placeholder="Phone Number">
                                </div>
                                <div class="mb-3">
                                    <label for="exampleFormControlInput1" class="form-label">User Address</label><br>
                                    <textarea name="user_address" style="height:100px;" class="form-control" placeholder="Enter Your Address"></textarea>
                                </div>

                                <div class="container text-center">
                                    <button class="btn btn-outline-success">Register</button>
                                    <button class="btn btn-outline-warning">Reset</button>
                                </div>
                            </form>

                        </div>

                    </div>

                </div>

            </div>
        </div>
    </body>
</html>
