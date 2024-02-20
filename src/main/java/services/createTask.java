package services;

import models.Task;
import models.connection;
import org.hibernate.Session;
import org.hibernate.Transaction;

import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.Serial;


@WebServlet("/addTask")
public class createTask extends HttpServlet {
    @Serial
    private static final long serialVersionUID = 1L;
    public createTask() {
        super();
    }
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException {
        String name = request.getParameter("taskName");
        String description = request.getParameter("taskDescription");
        String status = request.getParameter("taskStatus");
        String dueDate = request.getParameter("taskDueDate");
        String priority = request.getParameter("taskPriority");
        System.out.println("name: " + name+ " description: " + description + " status: " + status + " dueDate: " + dueDate + " priority: " + priority);
        Task task = new Task();
        task.setName(name);
        task.setDescription(description);
        task.setStatus(status);
        task.setDueDate(dueDate);
        task.setPriority(priority);

        Session session = connection.getFactory().openSession();
        Transaction tx = session.beginTransaction();
        session.persist(task);
        tx.commit();
        response.sendRedirect("index.jsp");
    }
}
