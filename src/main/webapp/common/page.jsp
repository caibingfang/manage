<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" session="false"%>
<div class="dataTables_wrapper">
<div class="row">
					<div class="col-xs-4">
					显示
					<select class="ui-pg-selbox" role="listbox" id="pageSizeSelect">
						<option role="option" value="10" <c:if test="${page.pageSize==10}">selected="selected"</c:if>>10</option>
						<option role="option" value="20" <c:if test="${page.pageSize==20}">selected="selected"</c:if>>20</option>
						<option role="option" value="30" <c:if test="${page.pageSize==30}">selected="selected"</c:if>>30</option>
					</select>
					条，共${page.total}条
					</div>
					<div class="col-xs-8">
					<div class="dataTables_paginate paging_simple_numbers">
					<ul class="pagination">
						<li <c:if test="${page.isFirstPage}">class="disabled"</c:if>>
							<a href="javascript:void(0)" title="1">
								首页
							</a>
						</li>
						<li <c:if test="${page.isFirstPage}">class="disabled"</c:if>>
							<a href="javascript:void(0)" title="${page.prePage}">
								上一页
							</a>
						</li>
						
						<c:forEach items="${page.navigatepageNums}" var="i">
							<li <c:if test="${page.pageNum==i}">class="active"</c:if>>
								<a href="javascript:void(0)" title="${i}">${i}</a>
							</li>
						</c:forEach>
						

						<li <c:if test="${page.isLastPage}">class="disabled"</c:if>>
							<a href="javascript:void(0)" title="${page.nextPage}">
								下一页
							</a>
						</li>
						<li <c:if test="${page.isLastPage}">class="disabled"</c:if>>
							<a href="javascript:void(0)" title="${page.pages}">
								末页
							</a>
						</li>
					</ul>
					
					
					</div>
					</div>
				</div>
				</div>
		<script type="text/javascript">
			
			function postMethod() {
				$.post($("form").attr("action"),
					$("form").serialize(),
					function(data,status){
						if(status=="success"){
							$(".page-content-area").html(data);
						} else {
							bootbox.alert({
			 				    message: "请求发生异常！！！",
			 				    title: "错误",
			 				    size: "small"
			 				});
						}
					});
			}
			
			
			function deleteMethod(url,delArrayObj){

				$.post(url,"ids="+delArrayObj,
						function(data,status) {
							if(status=="success"){
								$(".page-content-area").html(data);
							} else {
								bootbox.alert({
									    message: "请求发生异常！！！",
									    title: "错误",
									    size: "large"
									});
							}
					});
			}
			
			
		
			$(document).ready(function(){ 
				
				$(document).on(
						'click',
						'th input:checkbox',
						function() {
							var that = this;
							$(this).closest('table').find(
									'tr > td:first-child input:checkbox').each(
									function() {
										this.checked = that.checked;
										$(this).closest('tr').toggleClass(
												'selected');
									});
						});
				
				
				
				$("#searchBtn").click(function(){
					postMethod();
				});
			
				$("#pageSizeSelect").change(function(){
					var pageSize=$("#pageSizeSelect").val();
					$("form").prepend("<input type=\"hidden\" name=\"pageSize\" value=\""+pageSize+"\">");
					postMethod();
				});
				

				$("ul.pagination li:not(.disabled,.active) a").click(function(){
					var pageNum = $(this).attr("title");
					$("form").prepend("<input type=\"hidden\" name=\"pageNum\" value=\""+pageNum+"\">");
					postMethod();
				});
				
				
				$("#delete-button").click(function(){
					var checkbox = $("tr > td:first-child :checkbox:checked");
					if(checkbox.length==0){
						bootbox.alert({
		 				    message: "请至少选中一条数据",
		 				    title: "提醒",
		 				    size: "small"
		 				});
					} else {
						var url = $(this).val();
						bootbox.confirm({
						    message: "是否确定删除选中数据?",
						    buttons: {
						        confirm: {
						            label: '确定',
						            className: 'btn-success'
						        },
						        cancel: {
						            label: '取消',
						            className: 'btn-danger'
						        }
						    },
						    callback: function (result) {
						        if(result){
						        	var delArrayObj = [];
						        	checkbox.each(function(i){
						        		var v = $(this).val();
						        		delArrayObj.push(v);
						        	});
						        	deleteMethod(url,delArrayObj);
						        }
						    },
						    size: "small"
						});
					}
				});
				
				$("#add-button").click(function(){
					var url = $(this).val();
					$(".page-content-area").load(url);
				})
				
				$("#modify-button").click(function(){
					var checkbox = $("tr > td:first-child :checkbox:checked");
					var url = $(this).val();
					if(checkbox.length!=1){
						bootbox.alert({
		 				    message: "请选中一条数据",
		 				    title: "提醒",
		 				    size: "small"
		 				});
						return;
					}
					

					$.post(url,"id="+checkbox.val(),
							function(data,status) {
								if(status=="success"){
									$(".page-content-area").html(data);
								} else {
									bootbox.alert({
										    message: "请求发生异常！！！",
										    title: "错误",
										    size: "large"
										});
								}
						});
				})
				
			}); 
		
		
		</script>
		