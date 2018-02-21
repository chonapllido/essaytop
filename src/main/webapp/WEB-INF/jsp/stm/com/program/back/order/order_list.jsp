<%@ page language="java" contentType="text/html; charset=utf-8"	pageEncoding="utf-8"%>
<%@ include file="../../../sys/taglibs.jspf"%>
<%@ include file="../../../sys/setCodes.jspf"%>

<script type="text/javascript">
	
	fnUpdateStatus = function(action, order_id, type, email, topic){
		var f 			= document.Form_manage,
			order_type 	= "Essay",
			status		= "2";

			if(!confirm('Are you sure you want to update the order status?')){
				return false;
			}
			if(type == '2')
				order_type = "Revision";
			
			if(action == "finish"){
				status = "3";
			}
			
			$.ajax({
				url:'/back/order/updateStatus.do',
				type: 'get',
				data:{
					'do':action,
					'order_id':order_id, 
					'type':order_type,
					'status':status,
					'email':email,
					'topic':topic
				},
				success: function(data){
					location.reload();
				}
			});	
	}
	
	fnUploadResult = function(el, order_id, type){
		
		var f = document.Form_manage;
			f.order_id.value = order_id;
			f.type_id.value = type;
			f.result.value = el;
			$('input[type=file]').not("input[name="+el+"]").prop('disabled', true);
		 	
			document.Form_manage.action = "/back/order/uploadResult.do?"+"<c:out value='${params}' />";
		 	document.Form_manage.submit();
	}
	
	fnDownloadResult = function(type_id, filename){
		var f = document.Form_manage;
			f.type_id.value = type_id;
			f.result.value = filename;
		
			document.Form_manage.action = "/back/order/downloadResult.do";
			document.Form_manage.submit();
	}
	
</script>
<h1 class="admin-title">Order Management</h1>
<form:form name="Form_manage" action="${url }" method="post" >
<input type="hidden" name="type_id"  />
<input type="hidden" name="order_id" />	
<input type="hidden" name="result" value="" />
<div class="content-admin">
	<table class="tbl-admin">
		<thead>
			<tr>
				<th>No</th>
				<th>Order #</th>
				<th>User</th>
				<th>Type</th>
				<th>Date</th>
				<th>Deadline</th>
				<th>Manager</th>
				<th>Writer</th>
				<th>Price</th>
				<th>Status</th>
				<th>Result</th>
				<th>Finish</th>
				<th>Info</th>
			</tr>
		</thead>
		<tbody>
			<c:if test="${fn:length(cmd.list) gt 0 }">
			<c:forEach var="row" items="${cmd.list }" varStatus="i">
			<tr>
				<td>${i.index+1 }</td>
				<td>${row.ce_order_id }</td>
				<td>${row.user_email }</td>
				<td>
					<c:if test="${row.type_id eq 1 }">Essay</c:if>
					<c:if test="${row.type_id ne 1 }">Revision</c:if>
				</td>
				<td>${row.date }</td>
				<td>${row.end_date }</td>
				<td>${row.manager_id }</td>
				<td>${row.writer_id }</td>
				<td>${row.pricewithcommission }</td>
				<td>
					<c:choose>
						<c:when test="${row.status eq '1' }">Pending</c:when>
						<c:when test="${row.status eq '2' }">Working</c:when>
						<c:when test="${row.status eq '5' }">Paid</c:when>
						<c:when test="${row.status eq '6' }">Finished</c:when>
						<c:otherwise>Pending</c:otherwise>
					</c:choose>
				</td>
				<td>
					<c:if test="${!empty row.result }">
					<button type="button" class="btn-img" onclick="fnDownloadResult('${row.type_id }', '<c:out value="${row.result}" />');"><img src="${img_src }/stm/icon/icon_download.png" /></button>
					</c:if>
				</td>
				<td>
					<c:if test="${row.status eq '6' }">
					<button type="button" class="btnfinish" onclick="fnUpdateStatus('finish','${row.ce_order_id}','${row.type_id }','${row.user_email }', '${row.topic }')"><img src="${img_src }/stm/icon/icon_finish.png" alt="finish" /></button>
					</c:if>
				</td>
				<td>
					<c:if test="${row.type_id eq '1' }">
					<a href="/back/order/essay/view.do?order_id=${row.ce_order_id }">
					</c:if>
					<c:if test="${row.type_id eq '2' }">
						<a href="/back/order/revision/view.do?order_id=${row.ce_order_id }">
					</c:if>
					<img src="${img_src }/stm/icon/icon_process.png" alt="i"/>
					</a>
				</td>
			</tr>
			</c:forEach>
			</c:if>
			<c:if test="${fn:length(cmd.list) lt 1 }">
			<tr>
				<td colspan="13">No results</td>
			</tr>
			</c:if>
		</tbody>
	</table>
</div>
<div class="admin-paging">
	<stmfn:paging1 />
</div>
</form:form>
<form:form name="Form_manage_search" commandName="orderCommand" action="${url }?${params }" method="post">
<div class="admin-search">
	<select name="search_field">
		<option value="order_id" <c:if test="${orderCommand.search_field eq 'order_id' }">selected='selected'</c:if>>Order No</option>
		<option value="user_email" <c:if test="${orderCommand.search_field eq 'user_email' }">selected='selected'</c:if>>Email</option>
	</select>
	<input type="text" name="search_keyword" value="${orderCommand.search_keyword }" />
	<input type="submit" value="Search" />
</div>
</form:form>
