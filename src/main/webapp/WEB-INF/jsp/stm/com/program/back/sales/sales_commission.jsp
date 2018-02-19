<%@ page language="java" contentType="text/html; charset=utf-8"	pageEncoding="utf-8"%>
<%@ include file="../../../sys/taglibs.jspf"%>
<%@ include file="../../../sys/setCodes.jspf"%>
<h1 class="admin-title">Sales Calculator</h1>
		<div class="content-admin">
			<div class="sales-box">
				
				<ul>
					<li>
						<form name="form_commission" method="post" action="${url }" >
						<span><input type="text" name="from_date" value="${from_date }" class="datepicker" /></span>&nbsp;~
						<span><input type="text" name="to_date" value="${to_date }" class="datepicker" /></span>
						<input type="submit" value="Search" />
						</form>
					</li>
					<li>
						<span class="half"><c:if test="${!empty(from_date)}">${from_date } ~ ${to_date }</c:if></span>
						<span class="half">Total: <span class="txt-red">$ ${total + total_payment}</span></span>
					</li>
					<li>
						<span class="half">CebuEssay</span>
						<span class="half">EssayTop</span>
						
						
					</li>
					<li>	
						<span class="half txt-red">$ ${ce_share } 
						<c:if test="${total gt 0 }">
							<form action="https://www.paypal.com/cgi-bin/webscr" method="post" target="_top">
							<input type="hidden" name="cmd" value="_s-xclick">
							<input type="hidden" name="hosted_button_id" value="R8GSK96VSNZBA">
							<input type="image" src="${img_src }/stm/icon/icon_paypal.png" border="0" name="submit" alt="PayPal - The safer, easier way to pay online!">
							<img alt="" border="0" src="https://www.paypalobjects.com/en_US/i/scr/pixel.gif" width="1" height="1">
							</form>
							</c:if>
						</span>
						<span class="half txt-red">$ ${et_share }</span>
					</li>
				</ul>
				
			</div>
			<table class="tbl-admin">
				<colgroup>
					<col width="" />
					<col width="" />
					<col width="" />
					<col width="" />
					<col width="" />
				</colgroup>
				<thead>
					<tr>
						<th>No</th>
						<th>Order No</th>
						<th>Date</th>
						<th>Price</th>
						<th>Status</th>
						<th>Info</th>
						<th>Payment</th>
					</tr>
				</thead>
				<tbody>
					<c:if test="${fn:length(cmd.list) gt 0}">
					<c:forEach var="row" items="${cmd.list }" varStatus="i">
					<tr>
						<td>${i.index+1 }</td>
						<td>${row.ce_order_id }</td>
						<td>${fn:substring(row.date,0,10) }</td>
						<td>
							<c:if test="${row.status eq '4' }">0</c:if>
							<c:if test="${row.status ne '4' }">
								<c:if test="${row.used_refund eq '1' }">-${row.pricewithcommission }</c:if>
								<c:if test="${row.used_refund eq '0' }">${row.pricewithcommission }</c:if>
							</c:if>
						</td>
						<td>${row.status }</td>
						<td>
							<c:if test="${row.type_id eq '1' }">
							<a href="/back/order/essay/view.do?ce_order_id=${row.ce_order_id }">
							</c:if>
							<c:if test="${row.type_id eq '2' }">
							<a href="/back/order/revision/view.do?ce_order_id=${row.ce_order_id }">
							</c:if>
							<img src="${img_src }/stm/icon/icon_process.png" alt="i"/>
							</a>
						</td>
						<td>
							<c:if test="${row.refunded eq '1' }">Virtual Money</c:if>
							<c:if test="${row.refunded ne '1' }">Paypal</c:if>
						</td>
					</tr>
					</c:forEach>
					</c:if>
					<c:if test="${fn:length(cmd.list) lt 1}">
					<tr>
						<td colspan="7">No Result</td>
					</tr>
					</c:if>
				</tbody>
			</table>
			
			<div class="admin-paging">
				<stmfn:paging1/>
			</div>
			<table class="tbl-admin mt20">
				<thead>
					<tr>
						<th>No</th>
						<th>User Email</th>
						<th>Amount</th>
						<th>Date</th>
						<th>Payment Method</th>
					</tr>
				</thead>
				<tbody>
					<c:if test="${fn:length(payment_list.list) gt 0 }">
					<c:forEach var="row" items="${payment_list.list }" varStatus="i">
					<tr>
						<td>${i.index+1 }</td>
						<td>${row.user_email }</td>
						<td>${row.amount }</td>
						<td>${row.date }</td>
						<td>PayNow</td>
					</tr>	
					</c:forEach>
					</c:if>
					<c:if test="${fn:length(payment_list.list) lt 1 }">
					<tr>
						<td colspan="5">No Result</td>
					</tr>
					</c:if>
				</tbody>
			</table>
		</div>