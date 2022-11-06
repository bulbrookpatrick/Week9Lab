<%-- 
    Document   : users
    Created on : 29-Oct-2022, 4:17:28 PM
    Author     : Patrick
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Users</title>
    </head>
    <body>
        <h1>Manage Users</h1>
        <p>
        <c:if test="${message eq 'add'}">User added</c:if>
        <c:if test="${message eq 'update'}">User updated</c:if>
        <c:if test="${message eq 'delete'}">User deleted</c:if>
        <c:if test="${message eq 'error'}">An error occurred</c:if>
        
        </p>
        
        
        <table style="border:solid; border-width: 2px;">
            <tr>
                <th>Email</th>
                <th>First Name</th>
                <th>Last Name</th>
                <th>Role</th>
                <th></th>
                <th></th>
            </tr>
        
            <c:forEach items="${user}" var="user">
                <td>${user.email}</td>
                <td>${user.firstName}</td>
                <td>${user.lastName}</td>
                <td>${user.role}</td>
                <td>Edit</td>
                <td>Delete</td>
            </c:forEach>
    
        </table>
        <!--still need to implement edit users-->
        <form method="post" action="users">
         
            <h1>
                <c:if test="${selectedUser eq null}">Add User: 
 
            </h1><br>
            <<form action="uesrs" method="post">
            <label for="email">Email: </label>
            <input type="text" id ="email" name="email"><br>
            
            <label for="fName">First Name: </label>
            <input type="text" id="fName" name="fName"><br>
            
            <label for="lName">Last Name: </label>
            <input type="text" id="lName" name="lName"><br>


            <label for="role">Role: </label>
            <select name="role" id="role">
                <option value="admin">System Admin</option>
                <option value="regularUser">Regular User</option>
                
            </select>
            <br><br>
            <input type="button" method="get" value="Add User">
            </c:if>
        </form>
    </body>
</html>
