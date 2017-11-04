package dev.sgp.web;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dev.sgp.entite.Collaborateur;
import dev.sgp.filtre.FrequentationFilter;

public class StatsController extends HttpServlet{

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.setAttribute("visites", FrequentationFilter.getVisites());
		req.getRequestDispatcher("/WEB-INF/views/statistiques.jsp").forward(req,resp);
	}
}
