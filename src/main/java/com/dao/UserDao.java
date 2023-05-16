package com.dao;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;

import com.entity.User;

public class UserDao {

	private SessionFactory sessionFactory = null;
	private Session session = null;
	private Transaction transaction = null;

	public UserDao(SessionFactory sessionFactory) {
		super();
		this.sessionFactory = sessionFactory;
	}

	// Save User
	public boolean saveUser(User user) {

		boolean f = false;

		try {

			session = sessionFactory.openSession();
			transaction = session.beginTransaction();

			session.save(user);
			transaction.commit();

			f = true;

		} catch (Exception e) {
			//
			if (transaction != null) {
				f = false;
				e.printStackTrace();
			}
		}

		return f;
	}

	// For Login
	public User login(String email, String password) {
		User user = null;

		// open session
		session = sessionFactory.openSession();
		// create query
		Query q = session.createQuery("from User where email=:em and password=:ps");

		q.setParameter("em", email);
		q.setParameter("ps", password);

		user = (User) q.uniqueResult();

		return user;
	}

}
