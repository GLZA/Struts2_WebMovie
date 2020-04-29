package com.pili.action;

import java.util.Map;

import org.apache.struts2.interceptor.SessionAware;

import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;
import com.pili.dao.MovieDao;
import com.pili.pojo.Movie;;



public class MvEditAction extends ActionSupport 
implements SessionAware , ModelDriven<Movie>{

	/**
	 * 
	 */
	private static final long serialVersionUID = -2886913994014343223L;
	public int err=0;
	private Movie movie = new Movie();
	private Map<String, Object> session;
	public void setSession(Map<String, Object> session) 
	{ 
		this.session = session;
	}
	
	public String delect() throws Exception {
		// TODO Auto-generated method stub
		
		MovieDao moviedao = new MovieDao();
		Movie m = moviedao.DeleteFSUploadMovie(movie.getMovieID());
		if(m.getStatus()==66){
    		err=-99;
    		return SUCCESS;
    	}
    	else {
    		err=-1;
    		return ERROR;
    	}
    	
	}
	public String update() throws Exception {
		// TODO Auto-generated method stub
		
		MovieDao moviedao = new MovieDao();
		Movie m = moviedao.updateMovie(movie.getMovieID(),movie.getMovieName(),movie.getMovieType());
		if(m.getStatus()==66){
    		err=-66;
    		return SUCCESS;
    	}
    	else {
    		err=-2;
    		return ERROR;
    	}
    	
	}

	@Override
	public Movie getModel() {
		// TODO Auto-generated method stub
		return movie;
	}
}
