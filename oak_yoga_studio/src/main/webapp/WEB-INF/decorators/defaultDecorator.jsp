<%-- 
    Document   : defaaultDecorator
    Created on : Oct 19, 2014, 6:47:43 AM
    Author     : Somayeh
--%>
<%@taglib  prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

    <head>

        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <meta name="description" content="">
        <meta name="author" content="">

        <title>Oak Yoga Studio</title>

        <!-- Bootstrap Core CSS -->
        <link href="/oak_yoga_studio/resources/bootstrap/css/bootstrap.min.css" rel="stylesheet">

        <!-- Custom CSS -->
        <link href="/oak_yoga_studio/resources/bootstrap/css/shop-item.css" rel="stylesheet">

        <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
        <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
        <!--[if lt IE 9]>
            <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
            <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
        <![endif]-->

    </head>

    <body>

        <!-- Navigation -->
        <nav class="navbar navbar-inverse navbar-fixed-top" role="navigation">
            <div class="container">
                <!-- Brand and toggle get grouped for better mobile display -->
<!--                <div class="navbar-header">
                    <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1">
                        <span class="sr-only">Toggle navigation</span>
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                    </button>
                 navbar-brand is hidden on larger screens, but visible when the menu is collapsed 
                <a class="navbar-brand" href="oak_yoga_studio/home">Oak Yoga Studio</a>
                </div>-->
                <!-- Collect the nav links, forms, and other content for toggling -->
                <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
                    <ul class="nav navbar-nav">
                        <li>
                            <a href="/oak_yoga_studio/welcome">Home</a>
                        </li>
                        <li>
                            <a href="/oak_yoga_studio/viewCourses">Courses</a>
                        </li>
                        <li>
                        <li>
                            <a href="/oak_yoga_studio/products">Products</a>
                        </li>
                        <li>
                            <a href="/oak_yoga_studio/about">About</a>
                        </li>
                        <li>
                            <a href="/oak_yoga_studio/contact">Contact</a>
                        </li>
                    </ul>
                </div>
                <!-- /.navbar-collapse -->
            </div>
            <!-- /.container -->
        </nav>

        <!-- Page Content -->
        <div class="container">
<c:if test="${not empty loggedUser }">
    Welcome,<br/>
    ${loggedUser.firstName} ${loggedUser.lastName}
    <a href="/oak_yoga_studio/j_spring_security_logout">Logout</a>
</c:if>
    <div class="search">
    <form action="searchProduct" method="POST">  
                <input type="text" name="productName" placeholder="search Product by name"/>              
                <input type="submit" value="Search Product"/>
            </form>
    </div>
            <div class="row">

                <div class="col-md-3">
                    <p class="lead">Oak Yoga Studio</p>
                    <div class="list-group">
                        <sec:authorize access="hasRole('ROLE_ANONYMOUS')">
                            <li><a href="${pageContext.request.contextPath}/addCredential" class="list-group-item active">Sign Up</a></li>
                            
                            <li><a href="login" class="list-group-item">Login</a></li>

                        </sec:authorize>
                            
                        <sec:authorize access="hasRole('ROLE_CUSTOMER')">

                            <li><a href="${pageContext.request.contextPath}/editProfile" class="list-group-item">Profile</a></li>
                            <li><a href="${pageContext.request.contextPath}/viewCourses" class="list-group-item">Register for a Course</a></li>
                            <li><a href="${pageContext.request.contextPath}/enrolled" class="list-group-item">View Enrollment History</a></li>
                            <li><a href="${pageContext.request.contextPath}/requestWaiver" class="list-group-item">Request waiver</a></li>
                            <li><a href="${pageContext.request.contextPath}/viewWaivers" class="list-group-item">View Waivers</a></li>
                            <li><a href="${pageContext.request.contextPath}/requestWithdraw" class="list-group-item">Withdraw</a></li>
                            <li><a href="${pageContext.request.contextPath}/searchProduct" class="list-group-item">Search Product</a></li>
                            <li><a href="${pageContext.request.contextPath}/viewCart" class="list-group-item">Shopping Cart</a></li>
                            

                            </sec:authorize>


                        <sec:authorize access="hasRole('ROLE_ADMIN')" >
<!--                            <li><a href="${pageContext.request.contextPath}/admin" class="list-group-item">Admin Home Page</a></li>-->
                            <li><a href="${pageContext.request.contextPath}/viewCourses" class="list-group-item">View Courses</a></li>
                            <li><a href="${pageContext.request.contextPath}/addCourse" class="list-group-item">Add Course</a></li>
                            <li><a href="${pageContext.request.contextPath}/sectionList" class="list-group-item">view Sections</a></li> 
                            <li><a href="${pageContext.request.contextPath}/newSection" class="list-group-item">Add Section</a></li>
                            <li><a href="${pageContext.request.contextPath}/viewCustomers" class="list-group-item">View Customers</a></li>
                            <li><a href="${pageContext.request.contextPath}/viewFaculties" class="list-group-item">View Faculties</a></li>
                            <li><a href="${pageContext.request.contextPath}/addFacultyCredential" class="list-group-item">Add Faculty</a></li>
                            <li><a href="${pageContext.request.contextPath}/products" class="list-group-item">View Products</a></li>
                            <li><a href="${pageContext.request.contextPath}/addProduct" class="list-group-item">Add Product</a></li>
                            </sec:authorize>

                        <sec:authorize access="hasRole('ROLE_FACULTY')" >
<!--                            <li><a href="${pageContext.request.contextPath}/faculty" class="list-group-item">Faculty Home Page</a></li>-->
                            <li><a href="${pageContext.request.contextPath}/facultyProfile" class="list-group-item">Profile</a></li>
                            <li><a href="${pageContext.request.contextPath}/viewAdvisees" class="list-group-item"> View Advisees</a></li>
                            <li><a href="${pageContext.request.contextPath}/viewWaiverRequests" class="list-group-item">View Waiver Request</a></li>
                            <li><a href="${pageContext.request.contextPath}/viewFacultySections" class="list-group-item">View Sections</a></li>
                            
                            </sec:authorize>
                    </div>
                </div>
                <div class="col-md-9">
                    <div class="thumbnail">
<!--                        <img class="img-responsive" src="http://placehold.it/800x300" alt="">-->
                        <div class="caption-full">
                            <div class="row">
                                <div class="box">
                                    <div class="col-lg-12">
                                        <sitemesh:write property='body' />
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>

            </div>

        </div>
        <!-- /.container -->

        <div class="container">

            <hr>

            <!-- Footer -->
            <footer>
                <div class="row">
                    <div class="col-lg-12">
                        <p>Copyright &copy; Oak Yoga Studio 2014</p>
                    </div>
                </div>
            </footer>

        </div>
        <!-- /.container -->

        <!-- jQuery Version 1.11.0 -->
        <script src="/oak_yoga_studio/resources/bootstrap/js/jquery-1.11.0.js"></script>

        <!-- Bootstrap Core JavaScript -->
        <script src="/oak_yoga_studio/resources/bootstrap/js/bootstrap.min.js"></script>

    </body>

</html>
