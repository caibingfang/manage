<title>用户编辑</title>
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" session="false"%>
<%@include file="/common/common.jsp"%>
<div class="page-header">
	<h1>
		用户管理
		<small>
			<i class="ace-icon fa fa-angle-double-right"></i>
			新增用户
		</small>
	</h1>
</div><!-- /.page-header -->

<div class="row">
	<div class="col-xs-12">
		<!-- PAGE CONTENT BEGINS -->
		<form class="form-horizontal" role="form">
			<input type="hidden" name="id" value="${user.id}"/>
			<div class="form-group">
				<label class="col-sm-3 control-label no-padding-right">用户名</label>

				<div class="col-sm-9">
					<input type="text" class="col-xs-10 col-sm-5" name="username" value="${user.username}"/>
				</div>
			</div>
			
			<div class="form-group">
				<label class="col-sm-3 control-label no-padding-right">密码</label>

				<div class="col-sm-9">
					<input type="text" class="col-xs-10 col-sm-5" name="password" value="${user.password}"/>
				</div>
			</div>
			
			<div class="form-group">
				<label class="col-sm-3 control-label no-padding-right">真实姓名</label>

				<div class="col-sm-9">
					<input type="text" class="col-xs-10 col-sm-5" name="realName" value="${user.realName}"/>
				</div>
			</div>
			<div class="form-group">
				<label class="col-sm-3 control-label no-padding-right">性别</label>
				<div class="col-sm-9">
					
					<div class="radio">
							<label>
								<input name="gender" type="radio" class="ace" value="MALE" <c:if test="${user.gender=='MALE'}">checked="checked"</c:if>/>
								<span class="lbl">男</span>
							</label>
				
							<label>
								<input name="gender" type="radio" class="ace" value="FEMALE" <c:if test="${user.gender=='FEMALE'}">checked="checked"</c:if>/>
								<span class="lbl">女</span>
							</label>
					</div>
				</div>
			</div>
		
			<div class="clearfix form-actions">
				<div class="col-md-offset-3 col-md-9">
					<button class="btn btn-info" type="submit">
						<i class="ace-icon fa fa-check bigger-110"></i>
						保存
					</button>
					
					&nbsp; &nbsp; &nbsp;
					<button class="btn btn-success" type="reset">
						<i class="ace-icon fa fa-undo bigger-110"></i>
						重置
					</button>

					&nbsp; &nbsp; &nbsp;
					<button class="btn" type="button" name="cancel">
						<i class="ace-icon fa fa-times bigger-110"></i>
						取消
					</button>
				</div>
			</div>
			
		
		
		</form>
		
	</div>
	
</div>

<script type="text/javascript">
	
$().ready(function() {
	// 在键盘按下并释放及提交后验证提交表单
	  $("form").validate({
	    rules: {
	    	username: "required",
	      	password: "required",
	      	realName: "required"
	    },
	    messages: {
	    	username: "请输入您的名字",
	    	password: "请输入您的密码",
	    	realName: "请输入您的真实姓名"
	     },
	     onsubmit:true,
	     onfocusout : false
	    }
	    
	  
	  )
	  
	  $("form").submit(function(){
			 if (!$("form").valid()) {
				 return false;
			 }
			 
			 var data=$('form').serializeArray();
			 
			 $.post("${context}/ajax/user/save", data,
					  function(data,status){
		
				 		if(status=="success"){
				 			if(data.status=="SUCCESS"){
				 				$(".page-content-area").load("${context}/ajax/user/list");
				 			} else if(data.status=="REDIRECT"){
				 				window.location.href=data.message; 
				 			} else {
				 				bootbox.alert({
				 				    message: data.message,
				 				    title: "提醒",
				 				    size: "small"
				 				});
				 			}
				 			
				 		}
					    
					  });
			 return false;
		});
	  
	  $("button[name='cancel']").click(function(){
		  $(".page-content-area").load("${context}/ajax/user/list");
	  });
	  
	  
	});



</script>