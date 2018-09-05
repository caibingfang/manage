package com.github.controller;

import java.util.ArrayList;
import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.validation.BindException;
import org.springframework.validation.BindingResult;
import org.springframework.validation.FieldError;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.context.request.WebRequest;
import org.springframework.web.method.HandlerMethod;
import org.springframework.web.servlet.ModelAndView;

import com.github.vo.ResultVO;

@ControllerAdvice
public class SpringExceptionHandler {
	
	Logger logger = LoggerFactory.getLogger(SpringExceptionHandler.class);

	@ExceptionHandler(value = { Exception.class })
    @ResponseBody
	public ResultVO handleOtherExceptions(Exception ex, HandlerMethod handlerMethod,WebRequest req) {
		logger.error(ex.getMessage(), ex);
		ResultVO result = ResultVO.getFailureResult();
		ResponseBody rb = handlerMethod.getMethodAnnotation(ResponseBody.class);
		if (ex instanceof BindException) {
			BindingResult bindingResult = ((BindException) ex).getBindingResult();
			List<FieldError> allErrors = bindingResult.getFieldErrors();
			List<String> list = new ArrayList<String>();
			for (FieldError error : allErrors) {
				list.add(error.getDefaultMessage());
				result.setMessage(list.toString());
			}
			
		}
		return result;
	}

}
