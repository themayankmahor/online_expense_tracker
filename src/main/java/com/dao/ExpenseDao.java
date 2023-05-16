package com.dao;

import java.util.ArrayList;
import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;

import com.entity.Expense;
import com.entity.User;

public class ExpenseDao {

	private SessionFactory sessionFactory = null;
	private Session session = null;
	private Transaction transaction = null;

	//
	public ExpenseDao(SessionFactory sessionFactory) {
		super();
		this.sessionFactory = sessionFactory;
	}

	public boolean saveExpense(Expense expense) {
		boolean f = false;

		try {

			session = sessionFactory.openSession();
			transaction = session.beginTransaction();

			session.save(expense);
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

	//
	public List<Expense> getAllExpense(User user) {
		List<Expense> expenseList = new ArrayList<Expense>();

		try {

			session = sessionFactory.openSession();
			Query q = session.createQuery("from Expense where user=:us");

			q.setParameter("us", user);

			expenseList = q.list();

		} catch (Exception e) {
			e.printStackTrace();
		}

		return expenseList;
	}

	// get expense by id
	public Expense getExpenseById(int id) {
		Expense expense = null;

		try {

			session = sessionFactory.openSession();
			Query q = session.createQuery("from Expense where id=:id");

			q.setParameter("id", id);
			expense = (Expense) q.uniqueResult();

		} catch (Exception e) {
			//
			e.printStackTrace();
		}

		return expense;
	}

	//update expense
	public boolean updateExpense(Expense expense) {
		boolean f = false;

		try {

			session = sessionFactory.openSession();
			transaction = session.beginTransaction();

			session.saveOrUpdate(expense);
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
	
	//delete
	public boolean deleteExpense(int id)
	{
		boolean f = false;
		
		try {
			
			session = sessionFactory.openSession();
			transaction = session.beginTransaction();
			
			//
			Expense expense = session.get(Expense.class, id);
			session.delete(expense);
			
			transaction.commit();
			f = true;
			
		} catch (Exception e) {
			
			//
			f = false;
			//
			e.printStackTrace();
		}
		
		return f;
	}

}
