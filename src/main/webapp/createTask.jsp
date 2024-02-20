<%--
  Created by IntelliJ IDEA.
  User: saiki
  Date: 15-02-2024
  Time: 09:17
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Create Task</title>
    <style>
        table{
            margin-top: 50px;
            margin-left: 50px;
        }
        h1{
            margin-left: 50px;
        }
    </style>
</head>
<body>
<h1>Create Task</h1>
<form action="addTask" method="post">
    <table>
        <tr>
            <td>Task Name</td>
            <td><input type="text" name="taskName"></td>
        </tr>
        <tr>
            <td>Task Description</td>
            <td><textarea type="text" name="taskDescription"></textarea></td>
        </tr>
        <tr>
            <td>Task Priority</td>
            <td><select name="taskPriority">
                <option value="high">High</option>
                <option value="medium">Medium</option>
                <option value="low">Low</option>
            </select></td>

        </tr>
        <tr>
            <td>Task Status</td>
            <td><select name="taskStatus">
                <option value="Pending">Not Completed</option>
                <option value="Completed">Completed</option>
            </select></td>
        </tr>
        <tr>
            <td>Task Due Date</td>
            <td><input type="datetime-local" name="taskDueDate"></td>
        </tr>
        <tr>
            <td>
                <input type="submit" value="Create Task">
            </td>
        </tr>
    </table>
</form>
</body>
</html>
