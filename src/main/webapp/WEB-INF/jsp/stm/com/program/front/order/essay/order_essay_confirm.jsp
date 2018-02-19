<%@ page language="java" contentType="text/html; charset=utf-8"	pageEncoding="utf-8"%>
<%@ include file="../../../../sys/taglibs.jspf"%>
<%@ include file="../../../../sys/setCodes.jspf"%>

<div id="contents">
	<div id="content-area">
	    <div class="single page-title">
	        <h1>Order</h1>
	    </div >
	    <div class="request-box">
	    	<c:if test="${lang eq 'CN' }">
			<span class="reqst-box-txt">
	            Thank you for your order!<br/>
	            Your order number is ${order_id } and the total amount is US $<span class="total-txt">${total_payment }</span>.<br/>
	            You can pay through PayPal.<br/>
	            Orders with $0 total will be processed automatically.<br />                    
	        </span> 
			</c:if>
			<c:if test="${lang ne 'CN' }">
	       	<span class="reqst-box-txt">
			            주문해 주셔서 감사합니다.<br/>
			            주문 번호는 ${order_id }이며 총금액은 US $<span class="total-txt">${total_payment }</span>입니다.<br/>
			            아래의 PayPal 버튼으로 결제해 주세요.<br/>                    
		   	</span> 
			</c:if>
	        <span class="button-section">			
	        	<c:if test="${total_payment ne '0' }">	
				<form id="formpaypal" name="formpaypal" action="/paypal/pay.do" method="post" target="_blank" >
				<input type="hidden" name="BRANDNAME" value="EssayTop" />
				<input type="hidden" name="L_PAYMENTREQUEST_0_NAME0" value="Essay Order" />
				<input type="hidden" name="PAYMENTREQUEST_0_AMT" value="${total_payment }" />
				<input type="hidden" name="L_PAYMENTREQUEST_0_QTY0" value="1" />
				<input type="hidden" name="PAYMENTREQUEST_0_ITEMAMT" value="${total_payment }" />
				<input type="hidden" name="currencyCodeType" value="USD" />
				<input type="hidden" name="paymentType" value="Sale" />
				<input type="hidden" name="orderType" value="Essay" />
				<input type="hidden" name="orderId" value="${order_id }" />
				<button type="submit" class="btn-img"><img src="${img_src }/stm/paypal.gif" border="0" align="top" alt="Check out with PayPal"/></button>
				</form>
				</c:if>
				<a href="/front/main.do" class="btncancel mt11">
					<c:if test="${lang eq 'CN' }">Go Back</c:if>
					<c:if test="${lang ne 'CN' }">돌아가기</c:if>
				</a>          
	     	</span>
        </div>
    </div>
</div>