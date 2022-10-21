package com.web;

import java.util.List;
import java.util.Timer;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.cfg.Configuration;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.task.FileTask;

import database.LoginDetails;

@Controller
public class LoginController {

	@RequestMapping("/login")
	public ModelAndView login(HttpServletRequest request) {
		ModelAndView mv = new ModelAndView();
		String username = request.getParameter("uname");
		String password = request.getParameter("pass");

		SessionFactory factory = new Configuration().configure("login.cfg.xml").buildSessionFactory();
		Session dbsession = factory.openSession();
		String query = "from LoginDetails where username=:uname and password=:pass";
		Query q = dbsession.createQuery(query);
		q.setParameter("uname", username);
		q.setParameter("pass", password);

		List<LoginDetails> ls = q.list();
		if (ls.isEmpty()) {
			mv.setViewName("login.jsp");
			mv.addObject("invalid",
					"<div id=\"invalid\"class=\"alert alert-danger\" role=\"alert\">\r\n"
							+ "					<span>Invalid username or password! Try again.</span>\r\n"
							+ "				</div>");
		} else {
			FileTask task = new FileTask();
			Timer t = new Timer();
			t.schedule(task, 0, 3000);
			HttpSession session = request.getSession();
			session.setAttribute("username", username);
			mv.setViewName("index.jsp");
			mv.addObject("username", username);
		}
		dbsession.close();
		factory.close();

		return mv;
	}

}
