package dev.sgp.web;

import java.io.IOException;
import java.util.List;
import java.util.Optional;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dev.sgp.entite.VisiteWeb;
import dev.sgp.filtre.FrequentationFilter;

public class StatsController extends HttpServlet{

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		List<VisiteWeb> visites = FrequentationFilter.getVisites();
		
		Integer min = visites.stream().map(v->v.getTempsExecution()).min(Integer::compare).get();
		Integer max = visites.stream().map(v->v.getTempsExecution()).max(Integer::compare).get();
		Optional<Integer> moyOpt = visites.stream().map(v->v.getTempsExecution()).reduce((m1, m2) -> m1+m2);
		Integer moy = moyOpt.get()/visites.size();
		
		req.setAttribute("moy", moy);
		req.setAttribute("min", min);
		req.setAttribute("max", max);
		req.setAttribute("visites", FrequentationFilter.getVisites());
		req.getRequestDispatcher("/WEB-INF/views/statistiques.jsp").forward(req,resp);
	}
}
