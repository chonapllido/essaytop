<%@ page language="java" contentType="text/html; charset=utf-8"	pageEncoding="utf-8"%>
<%@ include file="../../../sys/taglibs.jspf"%>
<%@ include file="../../../sys/setCodes.jspf"%>

<h1 class="admin-title">Virtual Money</h1>
<div class="content-admin">
	<form name="form_vm" method="post" action="<?php bloginfo('url'); ?>/admin-virtual-money" >
		<div class="content-admin">
			<table class="tbl-admin">
				<thead>
					<tr>
						<th>No</th>
						<th>User Email</th>
						<th>Virtual Money</th>
					</tr>
					<tbody>
					<c:if test="${fn:length(cmd.list) gt 0 }">
					<c:forEach var="row" items="${cmd.list }" varStatus="i">
						<tr>
							<td>${i.index+1 }</td>
							<td>${row.user_email }</td>
							<td>$ ${row.virtual_money }</td>
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
</div>