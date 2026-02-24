package com.example.hibernate;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;

import com.example.hibernate.model.Profesor;
import com.example.hibernate.util.HibernateUtil;


public class Main {
        public static void main(String[] args) {
                // Get the singleton instance of HibernateUtil
                HibernateUtil hibernateUtil = HibernateUtil.getInstance();

                // Retrieve the SessionFactory
                SessionFactory sessionFactory = hibernateUtil.getSessionFactory();

                // Open a session
                Session session = sessionFactory.openSession();

                {
                        System.out.println("-----------  OneToOne con PK iguales -----------");

                        List<Profesor> profes = session.createSelectionQuery(
                                        "SELECT p from Profesor p",
                                        Profesor.class)
                                        .getResultList();

                        for (Profesor profe : profes) {
                                System.out.println(" Datos profe: " + profe + " ContactInfo: "
                                                + profe.getContactinfo().getTlfMovil());
                        }
                }

        }
}