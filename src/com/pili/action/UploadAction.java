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
        //��ȡ�����ݿ���������ƵID��
        System.out.println("ID:"+Fupload.getMovieID());
        System.out.println("Status:"+Fupload.getStatus());
        
        if(Fupload.getStatus()==1) {
        
	        //��ȡҪ�����ļ��е�����·��(����·��)
	        String realPath=ServletActionContext.getServletContext().getRealPath(""
	        +"/uploads"
	        +"/"+movie.getMovieType()
	        +"/"+ Fupload.getMovieID()+"");
	        String UrlPath = ServletActionContext.getRequest().getRequestURL().toString()
	        +"/"+movie.getMovieType()
	        +"/"+ Fupload.getMovieID()+"";
	        
	        File file = new File(realPath);
	        
	        //���Դ˳���·������ʾ���ļ���Ŀ¼�Ƿ���ڡ��������ڣ������˳���·����ָ����Ŀ¼���������б��赫�����ڵĸ�Ŀ¼��
	        if(!file.exists())file.mkdirs();
	        try {
	            
	        	//�����ļ�
	        	FileUtils.copyFile(movie.getUpload1(), new File(file/*·��*/,"0.jpg"/*����ļ���*/));
	        	
	        	FileUtils.copyFile(movie.getUpload2(), new File(file/*·��*/,"0.mp4"/*����ļ���*/));
	            
	            
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