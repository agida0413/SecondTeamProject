package com.sist.commons;

import java.io.IOException;
import java.sql.SQLException;

import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.bind.annotation.RestControllerAdvice;


@RestControllerAdvice
public class CommonsRestControllerException {

	@ExceptionHandler(RuntimeException.class)
	public void runtimeException(RuntimeException ex) {
		
		System.out.println("=========RuntimeException===========");
		ex.printStackTrace();
		System.out.println("=====================");
	}
	@ExceptionHandler(IOException.class)
	public void ioException(IOException ex) {
		System.out.println("===IOEXCEPTION=====");
		ex.printStackTrace();
		System.out.println("=====================");
	}

	@ExceptionHandler(SQLException.class)
	public void sqlException(SQLException ex) {
		System.out.println("===SQLEXCEPTION=====");
		ex.printStackTrace();
		System.out.println("=====================");
	}	
}
