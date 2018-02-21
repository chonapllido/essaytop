<%@ page language="java" contentType="text/html; charset=utf-8"	pageEncoding="utf-8"%>
<%@ include file="../../../sys/taglibs.jspf"%>
<%@ include file="../../../sys/setCodes.jspf"%>

<h1 class="admin-title">Users List</h1>
<form:form name="form_users" method="post" action="${url }" >
<div class="content-admin">
	<table class="tbl-admin">
		<thead>
			<tr>
				<th>No</th>
				<th>Orders</th>
				<th>User Email</th>
				<th>Contact No</th>
				<th>Date Registered</th>
			</tr>
			<tbody>
			<c:if test="${fn:length(cmd.list) gt 0 }">
			<c:forEach var="row" items="${cmd.list }" varStatus="i">
				<tr>
					<td>${i.index +1}</td>
					<td>${row.user_total_order }</td>
					<td>${row.user_email }</td>
					<td>${row.mobile1 }-${row.mobile2 }</td>
					<td>${row.date }</td>
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
<form:form name="Form_search" action="${url }?${params }" method="post">
<div class="admin-search">
	<select name="search_field">
		<option value="user_email">Email</option>
	</select>
	<input type="text" name="search_keyword" value="${cmd.search_keyword }" />
	<input type="submit" value="Search" />
</div>
</form:form>
