<%--
  Created by IntelliJ IDEA.
  User: Alex_Stuff
  Date: 2/1/2015
  Time: 8:19 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <script type="text/javascript" src="${pageContext.request.contextPath}/resources/jquery-2.1.3.min.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/resources/script.js"></script>
    <title>Add/Edit Video</title>

</head>
<body>
<center>

    <div style="color: #861b0c; font-size: 30px">
        <c:choose>
            <c:when test="${video.id == 0}">
                Add Video Details
            </c:when>
            <c:otherwise>
                Edit Video Details
            </c:otherwise>
        </c:choose> </div>

    <form:form id="editForm" modelAttribute="video" method="post" >
        <form:input path="id" type="hidden" value="${video.id}"/>
        <table align="center">
            <tr>
                <td><form:label path="videoId">Video ID</form:label></td>
                <td><form:input path="videoId" value="${video.videoId}" /></td>
            </tr>
            <tr>
                <td><form:label path="title">Title</form:label></td>
                <td><form:input path="title" value="${video.title}"/></td>
            </tr>
            <tr>
                <td><form:label path="views">Views</form:label></td>
                <td><form:input path="views" value="${video.views}"/></td>
            </tr>
            <tr>
                <td><form:label path="likes">Likes</form:label></td>
                <td><form:input path="likes" value="${video.likes}"/></td>
            </tr>
            <tr>
                <td><form:label path="dislikes">Likes</form:label></td>
                <td><form:input path="dislikes" value="${video.dislikes}"/></td>
            </tr>
            <tr>
                <td><form:label path="channel">Channel</form:label></td>
                <td><form:input path="channel" value="${video.channel}"/></td>
            </tr>

            <tr >
                <td>
                    <c:choose>
                        <c:when test="${video.id == 0}">
                            <input type="button" id="addButton" value="Add" />
                        </c:when>
                        <c:otherwise>
                            <input type="button" id="saveButton" value="Save" />
                        </c:otherwise>
                    </c:choose>
                </td>
                <td>
                    <input type="button" id="cancelButton" value="Cancel"  />
                </td>
            </tr>
        </table>
    </form:form>

</center>
</body>
</html>
