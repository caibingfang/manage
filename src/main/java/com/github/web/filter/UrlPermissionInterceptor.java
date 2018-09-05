package com.github.web.filter;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.method.HandlerMethod;
import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.github.vo.ResultVO;

public class UrlPermissionInterceptor implements HandlerInterceptor {

	/**
	 * controller 执行之前调用
	 */
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		String username = (String) request.getSession().getAttribute("username");
		ResponseBody responseBody = ((HandlerMethod) handler).getMethodAnnotation(ResponseBody.class);
		if (username == null) {
			if (responseBody == null) {
				response.sendRedirect(request.getContextPath() + "/login");
			} else {
				response.setContentType("application/json; charset=utf-8");
		        PrintWriter writer = response.getWriter();
		        ObjectMapper mapper = new ObjectMapper();
		        ResultVO result = ResultVO.getRedirectResult();
		        result.setMessage(request.getContextPath() + "/login");
		        writer.print(mapper.writeValueAsString(result));
		        writer.close();
		        response.flushBuffer();
			}

			return false;
		}
		return true;
	}

	/**
	 * controller 执行之后，且页面渲染之前调用
	 */
	@Override
	public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler,
			ModelAndView modelAndView) throws Exception {

	}

	/**
	 * 页面渲染之后调用，一般用于资源清理操作
	 */
	@Override
	public void afterCompletion(HttpServletRequest request, HttpServletResponse response, Object handler, Exception ex)
			throws Exception {

	}

}
