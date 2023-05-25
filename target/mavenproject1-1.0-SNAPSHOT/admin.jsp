<%@page import="java.util.List"%>
<%@page import="com.mycompany.mavenproject1.entities.Category"%>
<%@page import="com.mycompany.mavenproject1.helper.FactoryProvider"%>
<%@page import="com.mycompany.mavenproject1.dao.CategoryDao"%>
<%@page import="com.mycompany.mavenproject1.entities.User"%>
<%
    User user = (User) session.getAttribute("current-user");
    if (user == null) {
        session.setAttribute("message", "You are not logged in !! login page");
        response.sendRedirect("login.jsp");
        return;
    } else {
        if (user.getUserType().equals("normal")) {
            session.setAttribute("message", "You are not admin! Do not access this page");
            response.sendRedirect("login.jsp");
            return;
        }
    }


%>


<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <%@include file="components/common_css_js.jsp" %>

    </head>
    <body>
        <%@include file="components/navbar.jsp"%>
        <div class="container admin">

            <div class="container-fluid mt-4">
                <%@include file="components/message.jsp" %>
            </div>



            <div class="row mt-4">
                <!-- first col -->
                <div class="col-md-4 ">
                    <!-- first box -->
                    <div class="card">
                        <div class="card-body text-center">
                            <div>
                                <img src="image/profile.png" width="100px" height="100px" alt="user"/><br>
                            </div>
                            <h1>2342</h1>
                            <h1 class="text-uppercase text-muted">Users</h1>
                        </div>
                    </div> 



                </div>
                <!-- second col -->
                <div class="col-md-4 ">
                    <!-- second box -->
                    <div class="card">
                        <div class="card-body text-center">
                            <div>
                                <img src="image/menu.png" width="100px" height="100px" alt="alt"/><br>
                            </div>
                            <h1>2342</h1>
                            <h1 class="text-uppercase text-muted">Categories</h1>
                        </div>
                    </div> 



                </div>
                <!-- third col -->
                <div class="col-md-4 ">
                    <!-- third box -->
                    <div class="card">
                        <div class="card-body text-center">
                            <div>
                                <img src="image/delivery-box.png" width="100px" height="100px" alt="alt"/><br>
                                
                            </div>
                            <h1>2342</h1>
                            <h1 class="text-uppercase text-muted">Products</h1>
                        </div>
                    </div> 



                </div>





            </div>
            <!-- second col -->
            <div class="row mt-4">
                <!-- second row first column -->
                <div class="col-md-6">
                    <div class="card" data-toggle="modal" data-target="#add-category-modal">
                        <div class="card-body text-center">
                            <div>
                                <img src="image/app.png" width="100px" height="100px" alt="alt"/><br>
                            </div>
                            <P>Click here to add new category</P>
                            <h1 class="text-uppercase text-muted">Add Category</h1>
                        </div>
                    </div> 
                </div>
                <!-- second row ..second column -->
                <div class="col-md-6">
                    <div class="card" data-toggle="modal" data-target="#add-product-modal">
                        <div class="card-body text-center">
                            <div>
                                <img src="image/add-to-cart.png" width="100px" height="100px" alt="alt"/><br>
                            </div>
                            <p>Click here to add new products</p>
                            <h1 class="text-uppercase text-muted">Products</h1>
                        </div>
                    </div> 
                </div>

            </div>



        </div>

        <!--add category modal-->




        <!-- Modal -->
        <div class="modal fade" id="add-category-modal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
            <div class="modal-dialog model-lg" role="document">
                <div class="modal-content">
                    <div class="modal-header custom-bg text-white">
                        <h5 class="modal-title" id="exampleModalLabel">Fill Category Details</h5>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                    <div class="modal-body">
                        <form action="ProductOperationServlet" method="post">

                            <input type="hidden" name="operation" value="addcategory">


                            <div class="form-group">
                                <input type="text" class="form-control" name="cartTitle" placeholder="Enter category title" required />
                            </div>

                            <div class="form-group">
                                <textarea style="height: 100px" class="form-control" placeholder="Enter category description" name="cartdescription" required=""></textarea>
                            </div>

                            <div class="container text-center">
                                <button class="btn btn-outline-success">Add Category</button> 
                                <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                            </div>
                        </form>




                    </div>

                </div>

            </div>
        </div>
        <!--end add category model--> 
        <!----------------------------------------------------------------------------------------------------------------------------------------->



        <!--add product modal-->

       

        <!-- Modal -->
        <div class="modal fade" id="add-product-modal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
            <div class="modal-dialog modal-lg" role="document">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" id="exampleModalLabel">Product Details</h5>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                    <div class="modal-body">
                        <!--form started-->
                        
                        <form action="ProductOperationServlet" method="post" enctype="multipart/form-data">
                            
                            <input type="hidden" name="operation" value="addproduct"/>
                           
                            <!--product title-->
                            
                            <div class ="form-group">
                                <input type="text" class="form-control" placeholder="Enter title of product" name="pName" required=""/>
                            </div>
                            
                            <!--product description-->
                            
                            <div class="form-group">
                                <textarea style="height: 100px" class="form-control" placeholder="Enter product description" name="pDesc"></textarea>
                            </div>
                            
                            
                            <!--product description-->
                            <div class ="form-group">
                                <input type="number" class="form-control" placeholder="Enter price of the product" name="pPrice" required=""/>
                            </div>
                            
                            <!--product discount-->
                            <div class ="form-group">
                                <input type="number" class="form-control" placeholder="Enter product discount" name="pDiscount" required=""/>
                            </div>
                            
                            <!--product quantity-->
                            <div class ="form-group">
                                <input type="number" class="form-control" placeholder="Enter product quantity" name="pQuantity" required=""/>
                            </div>
                            
                            <!--product category-->
                            <%
                               CategoryDao cdao = new CategoryDao(FactoryProvider.getFactory());
                              List<Category>list = cdao.getCategories();
                            %>
                            
                            
                            
                            
                            <div class ="form-group">
                                <select name="catId" class="form-control" id="">
                                    
                                    
                                    <%
                                       for(Category c: list){
                                    %>
                                    
                                    <option value="<%= c.getCategoryId()%>"><%=c.getCategoryTitle()%></option>
                                    
                                    <% } %>
                                    
                                </select>
                            </div>
                            
                            
                            <!--product file-->
                            
                            <div class="form-group">
                                <label for="">Select Picture of Product</label><br>
                                <input type="file" id="pPic" name ="pPic" required />
                            </div>
                            
                            <!--submit button-->
                            
                            <div class="container text-center">
                                <button class="btn btn-outline-success">Add Products</button>
                            </div>
                            
                            
                        </form>
                        
                        
                        <!--end of form-->
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                        
                    </div>
                </div>
            </div>
        </div>



        <!--end product modal-->
    </body>
</html>
