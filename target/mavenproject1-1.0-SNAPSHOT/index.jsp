<%-- 
    Document   : index
    Created on : 04-Feb-2023, 10:52:25 am
    Author     : utsav
--%>

<%@page import="com.mycompany.mavenproject1.helper.helper"%>
<%@page import="com.mycompany.mavenproject1.entities.Category"%>
<%@page import="com.mycompany.mavenproject1.dao.CategoryDao"%>
<%@page import="com.mycompany.mavenproject1.entities.Product"%>
<%@page import="java.util.List"%>
<%@page import="com.mycompany.mavenproject1.dao.ProductDao"%>
<%@page import="com.mycompany.mavenproject1.helper.FactoryProvider"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>MyShop-Home</title>
        <%@include file="components/common_css_js.jsp" %>
    </head>
    <body>
        <%@include file="components/navbar.jsp"%>
        <div class="container-fluid">
            <div class="row mt-4 mx-2">

                <%                
//                    String cat = request.getParameter("category");
//                    // out.println(cat);
                    ProductDao dao = new ProductDao(FactoryProvider.getFactory());
//                    List<Product> list = null;
//                    if (cat.trim().equals("all")) {
//                        list = dao.getAllProducts();
//                    } else {
//                        int cid = Integer.parseInt(cat);
//                        list = dao.getAllProductsById(cid);
//                    }
                     List<Product> list = dao.getAllProducts();
                     CategoryDao cdao = new CategoryDao(FactoryProvider.getFactory());
                    List<Category> clist = cdao.getCategories();

                %>
                <!--show category-->
                <div class="col-md-2">
                    <div class="list-group ">
                        <a href="index.jsp?category=all" class="list-group-item list-group-item-action active">
                            All Products
                        </a>




                        <%                     for (Category c : clist) {

                        %>

                        <a href="index.jsp?category=<%= c.getCategoryId()%>" class="list-group-item list-group-item-action"><%=c.getCategoryTitle()%></a>

                        <%
                            }

                        %>


                    </div>

                </div>

                <!--show products-->
                <div class="col-md-10">
                    <!--row-->
                    <div cladd="row mt-4">

                        <div class="col-md-12">
                            <div class="card-columns">

                                <!--traversing product-->
                                <%                                for (Product p : list) {
                                %>

                                <div class="card">

                                    <div class="container text-center">
                                        <img src="image/products/<%= p.getpPhoto()%>" style="max-height: 270px;max-width: 100px;auto" class="card-img-top-2" alt="...">
                                    </div>

                                    <div class="card-body">

                                        <h5 class="card-title"><%=p.getpName()%></h5>
                                        <p class="card-text">
                                            <%= helper.get10Words(p.getpDesc())%>
                                        </p>

                                    </div>
                                    <div class="card-footer">
                                        <button class="btn custom-bg text-white">Add to Cart</button>
                                        <button class="btn btn-outline-primary"> &#8377; <%= p.getpPrice()%></button>

                                    </div>

                                </div>



                                <%
                                    }
                                %>



                            </div>

                        </div>

                    </div>
                </div>
            </div>
        </div>

    </body>
</html>
