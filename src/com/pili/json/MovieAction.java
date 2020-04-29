package com.pili.json;

import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;
import com.pili.dao.MovieDao;
import com.pili.pojo.MovieType;

import net.sf.json.JSONArray;

public class MovieAction extends ActionSupport implements ModelDriven<MovieType> {
	/**
	 * 
	 */
	private static final long serialVersionUID = -8104094316102496436L;
	private MovieType movieType = new MovieType();
	private JSONArray json;
	public String showMovie() {
		
		MovieDao movieTypeDao = new MovieDao();
		MovieType src =movieTypeDao.QueryMovieType(movieType.getMovieType());
		if(src.getMovieCount()>0){
			
			MovieDao movieDao = new MovieDao();
			
			String jsonCode = movieDao.queryMovie(src.getMovieSrc());
		
			json = JSONArray.fromObject(jsonCode);
		}
		return SUCCESS;
	}
	public JSONArray getJson() {
		return json;
	}
	public void setJson(JSONArray json) {
		this.json = json;
	}
	@Override
	public MovieType getModel() {
		// TODO Auto-generated method stub
		return movieType;
	}
	
}
