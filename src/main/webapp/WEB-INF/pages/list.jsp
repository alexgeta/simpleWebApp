
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <script type="text/javascript" src="${pageContext.request.contextPath}/resources/jquery-2.1.3.min.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/resources/script.js"></script>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/styles.css" />

    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>YouTubeMonitoring | Video List</title>

</head>
<body>
<center>

    <div style="color: teal; font-size: 30px">YouTubeMonitoring | Video List</div>
    <br>

    <c:if test="${empty videoList}">
        <div class="emptyList">You don't have any videos.</div>
    </c:if>

    <c:if test="${!empty videoList}">
        <table border="1" bgcolor="black" width="1200px">
            <tr style="background-color: #dba2da; color: #6e037b; text-align: center;"
                    height="40px">

                <td>Link</td>
                <td>Title</td>
                <td>Views</td>
                <td>Likes</td>
                <td>Dislikes</td>
                <td>Channel</td>
                <td>Delete</td>
            </tr>

            <form method="post" id="tableForm">
            <c:forEach items="${videoList}" var="video">
                <tr style="background-color: white; color: rgba(0, 0, 0, 0.97); text-align: center;" height="30px">
                    <td>
                        <a href="http://www.youtube.com/watch?v=${video.videoId}">
                        <c:out value="http://www.youtube.com/watch?v=${video.videoId}"/></a>
                    </td>
                    <td><c:out value="${video.title}"/></td>
                    <td><c:out value="${video.views}"/></td>
                    <td><c:out value="${video.likes}"/></td>
                    <td><c:out value="${video.dislikes}"/></td>
                    <td><c:out value="${video.channel}"/></td>
                    <td align="center"><input type="checkbox" name="id" value="${video.id}" class="checkbox"></td>
                </tr>
            </c:forEach>
            </form>

        </table>
        <p></p>
        <table>
            <tr align="right">
                <td >
                    <input type="button" id="refreshButton" value="Refresh">
                    <input type="button" id="editButton" value="Edit">
                    <input type="button" id="deleteButton" value="Delete">
                </td>
            </tr>
        </table>

    </c:if>

    <p>
    <p>

    <form id="addVideoForm" method="post">
        <div class="addvideo">
            <table>
                <p>
                    <tr>Add new video:</tr>
                <p>
                    <tr><c:if test="${not empty error}">
                        <div class="error">${error}</div>
                        </c:if>

                        <c:if test="${not empty exist}">
                            <div class="exist">${exist}</div>
                        </c:if>
                    </tr>
                    <tr>
                        <td>http://www.youtube.com/watch?v=</td>
                        <td>
                            <input type="text" name="videoId"/>
                            <input type="button" id="addVideoButton" value="Add">
                        </td>
                    </tr>

            </table>
        </div>
    </form>

</center>
</body>
</html>