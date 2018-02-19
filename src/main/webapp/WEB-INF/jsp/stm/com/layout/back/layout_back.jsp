<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ include file="../../sys/taglibs.jspf"%>
<%@ include file="../../sys/setCodes.jspf"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" lang="ko" xml:lang="ko">
<head>
<title>EssayTop</title>
<%@include file="../../sys/metalibs.jspf" %>
<%@include file="../../sys/csslibs_back.jspf" %>
<%@include file="../../sys/jslibs_back.jspf" %>
</head>
<body>
	<div class="container">
		<tiles:insertAttribute name="header" />
		<div id="contents">
			<div class="wrapper">
				<div class="admin-tabs">
					<ul>
						<li <c:if test="${fn:contains(url,'/order/list.do') }">class="on"</c:if>><a href="/back/order/list.do">Order Mgmt</a></li>
						<li <c:if test="${fn:contains(url,'/user/list.do') }">class="on"</c:if>><a href="/back/user/list.do">Users</a></li>
						<li <c:if test="${fn:contains(url,'/order/complete/') }">class="on"</c:if>><a href="/back/order/complete/list.do">Completed Orders</a></li>
						<li <c:if test="${fn:contains(url,'/order/unconfirmed/') }">class="on"</c:if>><a href="/back/order/unconfirmed/list.do">Cancelled Orders</a></li>
						<li <c:if test="${fn:contains(url,'/sales/list.do') }">class="on"</c:if>><a href="/back/sales/list.do">Sales Graph</a></li>
						<li <c:if test="${fn:contains(url,'/register/graph.do') }">class="on"</c:if>><a href="/back/user/register/graph.do">Registration Graph</a></li>
						<li <c:if test="${fn:contains(url,'/listvm.do') }">class="on"</c:if>><a href="/back/user/listvm.do">Virtual Money</a></li>
						<li <c:if test="${fn:contains(url,'/commission.do') }">class="on"</c:if>><a href="/back/sales/commission.do">Sales</a></li>
					</ul>
				</div>
				<tiles:insertAttribute name="content" />   
			</div>
		</div>
		<tiles:insertAttribute name="footer" />
	</div>
</body>
</html>