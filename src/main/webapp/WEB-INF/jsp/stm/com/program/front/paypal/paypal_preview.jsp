<%@ page language="java" contentType="text/html; charset=utf-8"	pageEncoding="utf-8"%>
<%@ include file="../../../sys/taglibs.jspf"%>
<%@ include file="../../../sys/setCodes.jspf"%>

<div id="contents">
	<div id="content-area">
	    <div class="single page-title">
	        <h1>Pay Now</h1>
	    </div> 
	
	   	<div class="paynow-box">
			<span class="row">
				<label>Email Address</label>
				${email }
			</span>
			<span class="row">
				<label>Amount</label>
				${amount } $ (US dollar)
			</span>
			<span class="row">
				<label>Payment Method</label>
				<img src="${img_src }/stm/btn_paypal2.jpg" alt="paypal" />
			</span>
		</div>
		<br/>
		<div class="form-submit">
			<form action="https://www.paypal.com/cgi-bin/webscr" method="post" target="_blank">
			<input type="hidden" name="cmd" value="_xclick" />
			<input type="hidden" name="business" value="tamura198@gmail.com" />
			<input type="hidden" name="item_name" value="Order" />
			<input type="hidden" name="item_number" value="1" />
			<input type="hidden" name="quantity" value="1" />
			<input type="hidden" name="amount" value="${amount }" />
			<input type="hidden" name="no_shipping" value="0" />
			<input type="hidden" name="return" value="https://www.essaytop.net/" />
			<input type="hidden" name="no_note" value="3" />
			<input type="hidden" name="currency_code" value="USD" />
			<input type="hidden" name="lc" value="EN" />
			<input type="hidden" name="bn" value="PP-BuyNowBF" />
			<input type="hidden" name="image_url" value="https://www.essaytop.net/images/logo_small.png" />
			<input type="image" src="${img_src }/stm/btn_paynow.gif" name="submit" alt="PayPal - The safer, easier way to pay online!" />
			</form>
		</div>
	</div>
</div>