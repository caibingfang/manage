<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" session="false"%>
<!DOCTYPE html>
<html lang="en">
<%String context = request.getContextPath();%>
	<head>
		<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
		<meta charset="utf-8" />
		<title>Login Page - Ace Admin</title>

		<meta name="description" content="User login page" />
		<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0" />

		<!-- bootstrap & fontawesome -->
		<link rel="stylesheet" href="<%=context%>/assets/css/bootstrap.min.css" />
		<link rel="stylesheet" href="<%=context%>/assets/css/font-awesome.min.css" />

		<!-- text fonts -->
		<link rel="stylesheet" href="<%=context%>/assets/css/ace-fonts.css" />

		<!-- ace styles -->
		<link rel="stylesheet" href="<%=context%>/assets/css/ace.min.css" />

		<!--[if lte IE 9]>
			<link rel="stylesheet" href="<%=context%>/assets/css/ace-part2.min.css" />
		<![endif]-->
		<link rel="stylesheet" href="<%=context%>/assets/css/ace-rtl.min.css" />

		<!--[if lte IE 9]>
		  <link rel="stylesheet" href="<%=context%>/assets/css/ace-ie.min.css" />
		<![endif]-->
		<link rel="stylesheet" href="<%=context%>/assets/css/ace.onpage-help.css" />
		
		<style type="text/css">
		
		.error{
			color:#d16e6c;
			padding-left:12px;
			padding-top:6px;
		}
		</style>

		<!-- HTML5 shim and Respond.js IE8 support of HTML5 elements and media queries -->

		<!--[if lt IE 9]>
		<script src="<%=context%>/assets/js/html5shiv.js"></script>
		<script src="<%=context%>/assets/js/respond.min.js"></script>
		<![endif]-->
	</head>

	<body class="login-layout light-login">
		<div class="main-container">
			<div class="main-content">
				<div class="row">
					<div class="col-sm-10 col-sm-offset-1">
						<div class="login-container">
							<div class="center">
								<h1>
									<i class="ace-icon fa fa-leaf green"></i>
									<span class="red">Ace</span>
									<span class="grey" id="id-text2">Application</span>
								</h1>
								<h4 class="blue" id="id-company-text">&copy; Company Name</h4>
							</div>

							<div class="space-6"></div>

							<div class="position-relative">
								<div id="login-box" class="login-box visible widget-box no-border">
									<div class="widget-body">
										<div class="widget-main">
											<h4 class="header blue lighter bigger">
												<i class="ace-icon fa fa-coffee green"></i>
												请输入您的信息
											</h4>

											<div class="space-6"></div>

											<form id="loginform" >
												<fieldset>
													<label class="block clearfix">
														<span class="block input-icon input-icon-right">
															<input type="text" name="username"  class="form-control" placeholder="用户名" autocomplete="off"/>
															<i class="ace-icon fa fa-user"></i>
														</span>
													</label>

													<label class="block clearfix">
														<span class="block input-icon input-icon-right">
															<input type="password" name="password" class="form-control" placeholder="密码" />
															<i class="ace-icon fa fa-lock"></i>
														</span>
													</label>

													<div class="space"></div>

													<div class="clearfix">
														<div id="errorinfo" class="red pull-left"></div>
														<button type="submit" class="width-35 pull-right btn btn-sm btn-primary">
															<i class="ace-icon fa fa-key"></i>
															<span class="bigger-110">登录</span>
														</button>
													</div>

												</fieldset>
											</form>


											<div class="space-6"></div>

											
										</div><!-- /.widget-main -->

										<div class="toolbar clearfix">
										
										</div>
									</div><!-- /.widget-body -->
								</div><!-- /.login-box -->

								
							</div><!-- /.position-relative -->

							<div class="navbar-fixed-top align-right">
								<br />
								&nbsp;
								<a id="btn-login-dark" href="#">Dark</a>
								&nbsp;
								<span class="blue">/</span>
								&nbsp;
								<a id="btn-login-blur" href="#">Blur</a>
								&nbsp;
								<span class="blue">/</span>
								&nbsp;
								<a id="btn-login-light" href="#">Light</a>
								&nbsp; &nbsp; &nbsp;
							</div>
						</div>
					</div><!-- /.col -->
				</div><!-- /.row -->
			</div><!-- /.main-content -->
		</div><!-- /.main-container -->



		<!-- basic scripts -->

		<!--[if !IE]> -->
		<script type="text/javascript">
			window.jQuery || document.write("<script src='<%=context%>/assets/js/jquery.min.js'>"+"<"+"/script>");
		</script>
		<script src="<%=context%>/assets/js/bootstrap.min.js"></script>
		<script src="<%=context%>/assets/js/bootbox.min.js"></script>
		<script src="<%=context%>/assets/js/jquery.validate.min.js"></script>
		<!-- <![endif]-->

		<!--[if IE]>
<script type="text/javascript">
 window.jQuery || document.write("<script src='<%=context%>/assets/js/jquery1x.min.js'>"+"<"+"/script>");
</script>
<![endif]-->
		<script type="text/javascript">
			if('ontouchstart' in document.documentElement) document.write("<script src='<%=context%>/assets/js/jquery.mobile.custom.min.js'>"+"<"+"/script>");
		</script>

		<!-- inline scripts related to this page -->
		<script type="text/javascript">



		$().ready(function() {
			// 在键盘按下并释放及提交后验证提交表单
			  $("#loginform").validate({
			    rules: {
			    	username: "required",
			      	password: "required"
			    },
			    messages: {
			    	username: "请输入您的名字",
			    	password: "请输入您的密码"
			     },
			     onsubmit:true,
			     onfocusout : false
			    }
			    
			  
			  )
			});
		
		
			jQuery(function($) {
			 $(document).on('click', '.toolbar a[data-target]', function(e) {
				e.preventDefault();
				var target = $(this).data('target');
				$('.widget-box.visible').removeClass('visible');//hide others
				$(target).addClass('visible');//show target
			 });
			 
			});
			
			
			//you don't need this, just used for changing background
			jQuery(function($) {
			 $('#btn-login-dark').on('click', function(e) {
				$('body').attr('class', 'login-layout');
				$('#id-text2').attr('class', 'white');
				$('#id-company-text').attr('class', 'blue');
				
				e.preventDefault();
			 });
			 $('#btn-login-light').on('click', function(e) {
				$('body').attr('class', 'login-layout light-login');
				$('#id-text2').attr('class', 'grey');
				$('#id-company-text').attr('class', 'blue');
				
				e.preventDefault();
			 });
			 $('#btn-login-blur').on('click', function(e) {
				$('body').attr('class', 'login-layout blur-login');
				$('#id-text2').attr('class', 'white');
				$('#id-company-text').attr('class', 'light-blue');
				
				e.preventDefault();
			 });
			 
			});
			
			
			$(document).ready(function(){
				
				$(".ajax-loading-overlay").hide();
				
				
				
				 $("form").submit(function(){
					 if (!$("form").valid()) {
						 return false;
					 }
						 
					 var data=$('form').serializeArray();
					 $.post("<%=context%>/login/form", data,
							  function(data,status){
						 		if(status=="success"){
						 			if(data.status=="SUCCESS"){
						 				window.location.href = "<%=context%>/ajax";
						 			}else{
						 				//$("#errorinfo").text(data.message);
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
			});
		</script>
	</body>
</html>
