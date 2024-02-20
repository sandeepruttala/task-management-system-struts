package views;

import models.Task;
import org.hibernate.SessionFactory;

import java.util.List;

public class TaskList {

    public TaskList() {

    }
    public static List<Task> getCompletedTasks() {
        List<Task> tasks = null;
        try (SessionFactory factory = models.connection.getFactory()) {
            org.hibernate.Session session = factory.openSession();
            tasks = session.createQuery("from Task where status = 'Completed'", Task.class).list();
            session.close();
        }
        return tasks;
    }
    public static List<Task> getPendingTasks() {
        List<Task> tasks = null;
        try (SessionFactory factory = models.connection.getFactory()) {
            org.hibernate.Session session = factory.openSession();
            tasks = session.createQuery("from Task where status = 'Pending' or status = 'todo'", Task.class).list();
            session.close();
        }
        return tasks;
    }
}
