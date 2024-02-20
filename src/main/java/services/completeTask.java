package services;

import models.Task;
import models.connection;
import org.hibernate.Session;
import org.hibernate.Transaction;

import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.time.LocalDateTime;

@WebServlet("/completeTask")
public class completeTask extends javax.servlet.http.HttpServlet {
    public completeTask() {
        super();
    }
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException {
        String id = request.getParameter("taskId");
        Session session = connection.getFactory().openSession();
        Transaction tx = session.beginTransaction();
        Task task = session.get(Task.class, Integer.parseInt(id));
        task.setStatus("Completed");
        task.setCompletedDate(String.valueOf(LocalDateTime.now()));
        session.update(task);
        tx.commit();
        //redirect to index.jsp
        response.sendRedirect("index.jsp");
    }
}
