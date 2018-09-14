package com.cmos.handlers;

import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.servlet.ModelAndView;

@ControllerAdvice
public class SpringMvcExceptionHandler {

	@ExceptionHandler({ArithmeticException.class})
	public ModelAndView handlerArithmeticException(Exception ex){
		System.out.println("存在异常");
		ModelAndView mv = new ModelAndView("error");
		mv.addObject("exception",ex);
		return mv;
		
	}
	
		
		
	
}
