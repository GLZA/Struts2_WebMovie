package com.pili.pojo;

import java.io.File;

public class Movie {
	
	private File upload1; //�õ��ϴ����ļ�
	private String upload1ContentType; //�õ��ļ�������
	private String upload1FileName; //�õ��ļ�������
	private File upload2; //�õ��ϴ����ļ�
	private String upload2ContentType; //�õ��ļ�������
	private String upload2FileName; //�õ��ļ�������
	
	private String movieName;//��Ƶ����
	private String movieType;//��Ƶ����
	private String movieUser;//��Ƶ������
	private String movieSrc;//��Ƶ·��
	private String imgSrc;//��ƵͼƬ·��
	
	private int movieID;
	private int status;
	
	
	public String getMovieName() {
		return movieName;
	}

	public File getUpload1() {
		return upload1;
	}

	public void setUpload1(File upload1) {
		this.upload1 = upload1;
	}

	public String getUpload1ContentType() {
		return upload1ContentType;
	}

	public void setUpload1ContentType(String upload1ContentType) {
		this.upload1ContentType = upload1ContentType;
	}

	public String getUpload1FileName() {
		return upload1FileName;
	}

	public void setUpload1FileName(String upload1FileName) {
		this.upload1FileName = upload1FileName;
	}

	public File getUpload2() {
		return upload2;
	}

	public void setUpload2(File upload2) {
		this.upload2 = upload2;
	}

	public String getUpload2ContentType() {
		return upload2ContentType;
	}

	public void setUpload2ContentType(String upload2ContentType) {
		this.upload2ContentType = upload2ContentType;
	}

	public String getUpload2FileName() {
		return upload2FileName;
	}

	public void setUpload2FileName(String upload2FileName) {
		this.upload2FileName = upload2FileName;
	}

	public void setMovieName(String movieName) {
		this.movieName = movieName;
	}

	public String getMovieType() {
		return movieType;
	}

	public void setMovieType(String movieType) {
		this.movieType = movieType;
	}
	

	public String getMovieUser() {
		return movieUser;
	}

	public void setMovieUser(String movieUser) {
		this.movieUser = movieUser;
	}

	public int getStatus() {
		return status;
	}

	public void setStatus(int status) {
		this.status = status;
	}

	public int getMovieID() {
		return movieID;
	}

	public void setMovieID(int movieID) {
		this.movieID = movieID;
	}

	public String getMovieSrc() {
		return movieSrc;
	}

	public void setMovieSrc(String movieSrc) {
		this.movieSrc = movieSrc;
	}

	public String getImgSrc() {
		return imgSrc;
	}

	public void setImgSrc(String imgSrc) {
		this.imgSrc = imgSrc;
	}

	
	
}
