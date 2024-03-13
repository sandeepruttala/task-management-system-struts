<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.*" %>
<%@ page import="views.TaskList" %>
<%@ page import="models.Task" %>
<html>
<head>
  <title>Task Management System</title>
  <link href="global.css" rel="stylesheet" type="text/css">
</head>
<body>
<h1>Task Management System</h1>
<div>
    <button onclick="showForm()" id="addButton">Add Task</button>
  <h2>List of Pending Tasks</h2>
  <table>
    <tr>
      <th>Task</th>
      <th>Description</th>
      <th>Priority</th>
      <th>Due Date</th>
      <th>Status</th>
      <th>Delete</th>
    </tr>
    <%
      List<Task> tasks = TaskList.getPendingTasks();
      for (models.Task task : tasks) {
    %>
    <tr>
      <td><%= task.getName() %></td>
      <td><%= task.getDescription() %></td>
      <td><%= task.getPriority() %></td>
      <td><%= task.getDueDate() %></td>
      <td><a href="completeTask?taskId=<%= task.getId() %>">Mark as Completed</a></td>
      <td><a class="delete" href="deleteTask?taskId=<%= task.getId() %>">Delete</a></td>
    </tr>
    <%
      }
    %>
  </table>
</div>

<div>
  <div id="createForm" class="task-form">
    <form action="addTask" method="post">
      <h2>Add Task</h2>
      <div class="form-row">
        <label for="task-name">Task Name:</label>
        <input type="text" id="task-name" name="taskName" required>

        <label for="task-description">Task Description:</label>
        <textarea type="text" id="task-description" name="taskDescription"></textarea>

        <label for="task-priority">Task Priority:</label>
        <select id="task-priority" name="taskPriority">
          <option value="low">Low</option>
          <option value="medium">Medium</option>
          <option value="high">High</option>
        </select>
      </div>

      <div class="form-row">
        <label for="task-status">Task Status:</label>
        <select id="task-status" name="taskStatus">
          <option value="todo">To Do</option>
          <option value="completed">Completed</option>
        </select>

        <label for="task-due-date">Task Due Date:</label>
        <input type="datetime-local" id="task-due-date" name="taskDueDate" required>
      </div>

      <div class="form-row">
        <button type="submit" class="submit-btn">Submit</button>
        <button onclick="closeForm()">Cancel</button>
      </div>
    </form>
  </div>
</div>

<h2>List of Completed Tasks</h2>
<table>
  <tr>
    <th>Task</th>
    <th>Description</th>
    <th>Priority</th>
    <th>Due Date</th>
    <th>Completed Date</th>
  </tr>
  <%
    tasks = TaskList.getCompletedTasks();
    for (models.Task task : tasks) {
  %>
  <tr>
    <td><%= task.getName() %></td>
    <td><%= task.getDescription() %></td>
    <td><%= task.getPriority() %></td>
    <td><%= task.getDueDate() %></td>
    <td><%= task.getCompletedDate() %></td>
  </tr>
  <%
    }
  %>
</table>

<script>
  function showForm() {
    const form = document.getElementById("createForm");
    if (form.style.display === "block") {
      form.style.display = "none";
      document.getElementById("addButton").innerHTML = "Add Task";
    } else {
      form.style.display = "block";
      document.getElementById("addButton").innerHTML = "Hide Form";
    }
  }

  function closeForm() {
    const form = document.getElementById("createForm");
    form.style.display = "none";
    document.getElementById("addButton").innerHTML = "Add Task";
    }
</script>

</body>
</html>
