<%@ page language="java" contentType="text/html; charset=utf-8"	pageEncoding="utf-8"%>
<%@ include file="../../../sys/taglibs.jspf"%>
<%@ include file="../../../sys/setCodes.jspf"%>

<div id="contents">
	<div id="content-area">
  		<div class="single page-title">
      		<h1>Request</h1>
       	</div >
       	<div>
			<form name="form_paypal" method="post" action="/paypal/review.do?page=return">
			<table class="tbl">
				<thead>
					<tr>
						<th width="20%">Item</th>
						<th width="50%">Email</th>
						<th width="30%" class="last">Price</th>
					</tr>
				</thead>
				<tbody>
					<tr>
						<td>${result.get("L_NAME0") }</td>
						<td>${result.get("EMAIL") }</td>
						<td>${result.get("CURRENCYCODE")} ${result.get("PAYMENTREQUEST_0_AMT")}</td>
					</tr>
				</tbody>
			</table>
			<div class="paypal-bottom">
				<span class="paypal-line"><strong>Total:</strong>&nbsp;<span class="txt-red">${result.get("CURRENCYCODE")} ${result.get("PAYMENTREQUEST_0_AMT")}</span></span>
				<span class="paypal-line"><button type="submit" class="btn-img"><img src="${img_src }/stm/btn_paynow_SM.gif" name="submit"" /></button></span>
			</div>
			</form>
		</div>
	</div>
</div>
		