package com.pili.action;

import java.io.File;
import java.io.IOException;
import java.util.Map;

import org.apache.commons.io.FileUtils;
import org.apache.struts2.ServletActionContext;
import org.apache.struts2.interceptor.SessionAware;

import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;
import com.pili.dao.MovieDao;
import com.pili.pojo.Movie;


public class UploadAction extends ActionSupport 
implements SessionAware,ModelDriven<Movie>{

    /**
	 * 
	 */
	private static final long serialVersionUID = 4670048751835580848L;
	public int err=0;
	private Map<String, Object> session;
	public void setSession(Map<String, Object> session) 
	{ 
		this.session = session;
	}
    Movie movie = new Movie();
    public String execute(){
    	
    	System.out.println("imgName:"+movie.getUpload1FileName());
        System.out.println("contentType:"+movie.getUpload1ContentType());
        System.out.println("File:"+movie.getUpload1());
       
        System.out.println("fileName:"+movie.getUpload2FileName());
        System.out.println("contentType:"+movie.getUpload2ContentType());
        System.out.println("File:"+movie.getUpload2());
       
        System.out.println("movieType:"+movie.getMovieName());
        System.out.println("movieType:"+movie.getMovieType());
        System.out.println("movieType:"+movie.getMovieUser());
       
        
        MovieDao md1 = new MovieDao();
        Movie Fupload = md1.FirstUploadMovie(movie.getMovieName(),movie.getMovieType(),movie.getMovieUser());
        //获取到数据库自增的视频ID号
        System.out.println("ID:"+Fupload.getMovieID());
        System.out.println("Status:"+Fupload.getStatus());
        
        if(Fupload.getStatus()==1) {
        
	        //获取要保存文件夹的物理路径(绝对路径)
	        String realPath=ServletActionContext.getServletContext().getRealPath(""
	        +"/uploads"
	        +"/"+movie.getMovieType()
	        +"/"+ Fupload.getMovieID()+"");
	        String UrlPath = ServletActionContext.getRequest().getRequestURL().toString()
	        +"/"+movie.getMovieType()
	        +"/"+ Fupload.getMovieID()+"";
	        
	        File file = new File(realPath);
	        
	        //测试此抽象路径名表示的文件或目录是否存在。若不存在，创建此抽象路径名指定的目录，包括所有必需但不存在的父目录。
	        if(!file.exists())file.mkdirs();
	        try {
	            
	        	//保存文件
	        	FileUtils.copyFile(movie.getUpload1(), new File(file/*路径*/,"0.jpg"/*另存文件名*/));
	        	
	        	FileUtils.copyFile(movie.getUpload2(), new File(file/*路径*/,"0.mp4"/*另存文件名*/));
	            
	            
	        } catch (IOException e) {
	            e.printStackTrace();
	        }
	        MovieDao md2 = new MovieDao();
	        Movie Supload = md2.SecondUploadMovie(Fupload.getMovieID(),UrlPath);
	        
	        if(Supload.getStatus()==2){
	        	err=0;
	        	return SUCCESS;
	        }
	        else{
	        	MovieDao md = new MovieDao();
	        	Movie Dupload = md.DeleteFSUploadMovie(Fupload.getMovieID());
	        	if(Dupload.getStatus()==66){
	        		err=2;
	        	}
	        	else {
	        		err=-99;
	        	}
	        	return ERROR;
	        }
        }
        else{
        	err=-1;
        	return ERROR;
        }
    }
	@Override
	public Movie getModel() {
		// TODO Auto-generated method stub
		return movie;
	}
	public int getErr() {
		return err;
	}
	public void setErr(int err) {
		this.err = err;
	}
}