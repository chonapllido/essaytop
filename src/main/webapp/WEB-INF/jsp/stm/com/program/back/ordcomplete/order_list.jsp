<%@ page language="java" contentType="text/html; charset=utf-8"	pageEncoding="utf-8"%>
<%@ include file="../../../sys/taglibs.jspf"%>
<%@ include file="../../../sys/setCodes.jspf"%>

<script type="text/javascript">
	fnDownloadResult = function(type_id, filename){
		var f = document.Form_list;
			f.type_id.value = type_id;
			f.result.value = filename;
		
			document.Form_list.action = "/back/order/downloadResult.do";
			document.Form_list.submit();
	}
	
</script>

<h1 class="admin-title">Complete Orders List</h1>
<form:form name="Form_list" method="post" action="${url }" >
<input type="hidden" name="type_id" value="" />
<input type="hidden" name="result" value="" />
<div class="content-admin">
	<table class="tbl-admin">
		<thead>
			<tr>
				<th>No</th>
				<th>Order #</th>
				<th>User Email</th>
				<th>Type</th>
				<th>Date</th>
				<th>Deadline</th>
				<th>Manager</th>
				<th>Writer</th>
				<th>Price</th>
				<th>Result</th>
				<th>Process</th>
			</tr>
			<tbody>
			<c:if test="${fn:length(cmd.list) gt 0 }">
			<c:forEach var="row" items="${cmd.list }" varStatus="i">
				<tr>
					<td>${i.index+1 }</td>
					<td>${row.ce_order_id }</td>
					<td>${row.user_email }</td>
					<td>
						<c:if test="${row.type_id eq '1' }">Essay</c:if>
						<c:if test="${row.type_id eq '2' }">Revision</c:if>
					</td>
					<td>${row.date }</td>
					<td>${row.end_date }</td>
					<td>${row.manager_id }</td>
					<td>${row.writer_id }</td>
					<td>${row.pricewithcommission }</td>
					<td>
						<c:if test="${!empty row.result }">
						<button type="button" class="btn-img" onclick="fnDownloadResult('${row.type_id }', '<c:out value="${row.result}" />');"><img src="${img_src }/stm/icon/icon_download.png" /></button>
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
		</thead>
	</table>
</div>
<div class="admin-paging">
	<stmfn:paging1/>
</div>
</form:form>
<form:form name="Form_search" action="${url }" method="post">
<div class="admin-search">
	<select name="search_field">
		<option value="order_id" <c:if test="${cmd.search_field eq 'order_id' }">selected="selected"</c:if>>Order No</option>
		<option value="user_email" <c:if test="${cmd.search_field eq 'user_email' }">selected="selected"</c:if>>Email</option>
	</select>
	<input type="text" name="search_keyword" value="${cmd.search_keyword }" />
	<input type="submit" value="Search" />
</div>
</form:form>