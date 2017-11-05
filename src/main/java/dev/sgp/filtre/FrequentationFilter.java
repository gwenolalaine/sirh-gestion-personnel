package dev.sgp.filtre;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import java.util.Optional;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;

import org.apache.catalina.servlet4preview.http.HttpServletRequest;

import dev.sgp.entite.VisiteWeb;

public class FrequentationFilter implements Filter{

	static List<VisiteWeb> visites = new ArrayList<>();
	private FilterConfig config = null;
	
	@Override
	public void init(FilterConfig config) throws ServletException {
		this.config = config;
		config.getServletContext().log("Frequentation filter initialized");
	}
	
	@Override
	public void doFilter(ServletRequest req, ServletResponse resp, FilterChain chain)
			throws IOException, ServletException {
		
		Integer before = (int)System.currentTimeMillis();
		chain.doFilter(req, resp);
		Integer after = (int) System.currentTimeMillis();
		
		HttpServletRequest request = (HttpServletRequest) req;
		String url 	= request.getRequestURI();
		
		Optional<VisiteWeb> visiteOpt = visites.stream().filter(v->v.getChemin().equals(url)).findFirst();
		
		if(visiteOpt.isPresent()) {
			visiteOpt.get().setNbVisites(visiteOpt.get().getNbVisites()+1);
			visiteOpt.get().setTempsExecution(after-before);
		}else {
			VisiteWeb visite = new VisiteWeb();
			visite.setChemin(url);
			visite.setNbVisites(1);
			visite.setTempsExecution(after-before);
			visites.add(visite);
		}
	}

	@Override
	public void destroy() {
		
	}
	
	public static List<VisiteWeb> getVisites(){
		return visites;
	}
}
