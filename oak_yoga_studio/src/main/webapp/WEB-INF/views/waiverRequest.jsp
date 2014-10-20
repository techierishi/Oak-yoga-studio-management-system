<%-- 
    Document   : WaiverRequest
    Created on : Oct 18, 2014, 4:03:29 PM
    Author     : Fetiya
--%>



<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Sections Taken</title>
    </head>
    <body>
        <div align="center">
            <h1> ${msg}</h1>
            <table border="1" cellpadding="10">  <tr>

                <tr>
                    <td>Course Name</td>
                    <td>Course Number  </td>
                    <td>Description</td>
                    <td></td>
                </tr>

                <c:forEach var="course" items="${coursesToWaive}">

                    <tr>

                        <td> ${course.courseName} </td> 
                        <td>${course.courseNumber}</td>
                        <td>${course.description}</td>


                        <td>
                            <form commandName="course"  action="${pageContext.request.contextPath}/waiverRequest/${course.id}" method="POST">

                                <input type="submit" value="Waive"/>

                            </form>

                        </td>    


                    </tr>
                </c:forEach>
            </table>
        </div>

        <div align="center">
            <a href="${pageContext.request.contextPath}/index">Back</a></br>
        </div>


    </body>
</html>
