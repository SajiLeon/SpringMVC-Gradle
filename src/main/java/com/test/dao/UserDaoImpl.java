package com.test.dao;

import java.util.List;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.test.model.User;

@Repository("userDao")
public class UserDaoImpl implements UserDao {

	@Autowired
	private SessionFactory sessionFactory;

	public void setSessionFactory(SessionFactory sf) {
		this.sessionFactory = sf;
	}
	
	private final Session getCurrentSession() {
		return sessionFactory.getCurrentSession();
	}

	public List<User> getAllUsers() {
		List<User> userList = getCurrentSession().createQuery("from User").list();
		return userList;
	}

	public User getUser(int id) {
		User user = (User) getCurrentSession().get(User.class, new Integer(id));
		System.out.println(user.getEmail());
		System.out.println(user.getId());
		return user;
	}

	public User addUser(User user) {
		getCurrentSession().save(user);
		return user;
	}

	public User updateUser(Integer id, User user) {
		User getUser = getCurrentSession().get(User.class, id);
		getUser.setEmail(user.getEmail());
		getUser.setFirstName(user.getFirstName());
		getUser.setLastName(user.getLastName());
		getUser.setPassword(user.getPassword());

		getCurrentSession().update(String.valueOf(id), getUser);

		return getUser;
	}

	public User deleteUser(int id) {
		User p = (User) getCurrentSession().load(User.class, new Integer(id));
		if (null != p) {
			getCurrentSession().delete(p);
		}
		return p;
	}
}