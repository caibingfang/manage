<title>Tables - Ace Admin</title>
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" session="false"%>
<%@include file="/common/common.jsp"%>
<!-- ajax layout which only needs content area -->
<div class="page-header">
	<h1>
		用户管理 <small> <i class="ace-icon fa fa-angle-double-right"></i>
			用户列表
		</small>
	</h1>
</div>
<!-- /.page-header -->

<div class="row">
	<div class="col-xs-12">

		<form class="form-horizontal" role="form" action="${context}/ajax/user/list">
			
			<div class="form-group">
				<label class="col-sm-1 control-label no-padding-right" >用户名</label>
				<div class="col-sm-2">
					<input type="text" name="username" class="form-control"
						value="${query.username}">
				</div>

				<label class="col-sm-1 control-label no-padding-right" >真实姓名</label>
				<div class="col-sm-2">
					<input type="text" name="realName" class="form-control"
						value="${query.realName}">
				</div>

				<label class="col-sm-1 control-label no-padding-right" >性别</label>
				<div class="col-sm-2">
				
					<select class="form-control"  name="gender">
						<option value=""></option>
						<option value="MALE" <c:if test="${query.gender == 'MALE' }">selected="selected"</c:if>>男</option>
						<option value="FEMALE" <c:if test="${query.gender == 'FEMALE' }">selected="selected"</c:if>>女</option>
					</select>
				</div>


				<span class="col-sm-3 no-padding-middle">
					<button type="button" class="btn btn-info btn-sm btn-primary"
						id="searchBtn">查询</button>
				</span>
			</div>
		</form>

		
		
		<!-- PAGE CONTENT BEGINS -->
		<div class="row">
			
			<button class="btn btn-white btn-default btn-round" id="add-button" value="${context}/ajax/user/add">新增</button>
			<button class="btn btn-white btn-default btn-round" id="modify-button" value="${context}/ajax/user/edit">修改</button>
			<button class="btn btn-white btn-default btn-round" id="delete-button" value="${context}/ajax/user/delete">删除</button>
			
			<div class="dataTables_wrapper form-inline no-footer">
				<table id="main-table"
					class="table table-striped table-bordered table-hover dataTable no-footer">
					<thead>
						<tr>
							<th class="center"><label class="position-relative">
									<input type="checkbox" class="ace" /> <span class="lbl"></span>
							</label></th>
							<th>用户名</th>
							<th>真实姓名</th>
							<th>性别</th>

							<th><i class="ace-icon fa fa-clock-o bigger-110 hidden-480"></i>
								创建时间</th>
						</tr>
					</thead>

					<tbody>
					<c:forEach items="${page.list}" var="user">
						<tr>
							<td class="center"><label class="position-relative">
									<input type="checkbox" class="ace" value="${user.id}"/> <span class="lbl"></span>
							</label></td>

							<td>${user.username}</td>
							<td>${user.realName}</td>
							<td class="hidden-480"><c:if test="${user.gender == 'FEMALE' }">女</c:if><c:if test="${user.gender == 'MALE' }">男</c:if> </td>
							<td><fmt:formatDate value="${user.createdOn}" pattern="yyyy-MM-dd HH:mm:ss"/></td>

						</tr>

					</c:forEach>
					</tbody>
				</table>


				
		<%@include file="/common/page.jsp"%>

				
			</div>
			<!-- /.span -->
			
		</div>
		<!-- /.row -->

		<div class="hr hr-18 dotted hr-double"></div>


		<!-- PAGE CONTENT ENDS -->
	</div>
	<!-- /.col -->
</div>
<!-- /.row -->

<!-- page specific plugin scripts -->
<script type="text/javascript">
var scripts = [null, null]
ace.load_ajax_scripts(scripts, function() {
  //inline scripts related to this page
	 jQuery(function($) {

})
}); 

</script>
