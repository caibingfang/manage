package com.github.vo;

import com.github.enums.Status;

public class ResultVO {

	private Status status;
	private Object message;

	public Status getStatus() {
		return status;
	}

	public void setStatus(Status status) {
		this.status = status;
	}

	public Object getMessage() {
		return message;
	}

	public void setMessage(Object message) {
		this.message = message;
	}
	
	public static ResultVO getSuccessResult(){
		ResultVO vo = new ResultVO();
		vo.setStatus(Status.SUCCESS);
		return vo;
	}
	
	public static ResultVO getFailureResult(){
		ResultVO vo = new ResultVO();
		vo.setStatus(Status.FAILURE);
		return vo;
	}
	
	public static ResultVO getRedirectResult(){
		ResultVO vo = new ResultVO();
		vo.setStatus(Status.REDIRECT);
		return vo;
	}

}
