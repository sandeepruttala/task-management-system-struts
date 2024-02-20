package models;

import org.hibernate.SessionFactory;

public class connection {

    public static SessionFactory getFactory() {

        return new org.hibernate.cfg.Configuration().configure("hibernate.cfg.xml").buildSessionFactory();
    }
}
