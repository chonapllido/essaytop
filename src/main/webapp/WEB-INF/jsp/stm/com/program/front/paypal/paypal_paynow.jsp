<%@ page language="java" contentType="text/html; charset=utf-8"	pageEncoding="utf-8"%>
<%@ include file="../../../sys/taglibs.jspf"%>
<%@ include file="../../../sys/setCodes.jspf"%>

<script type="text/javascript">

	fnPay = function(){
		var f = document.Form_pay,
		 	email = f.email,
			name = f.username,
			amount = f.amount;

		if(email.value == ''){
			alert('Please enter your email address!');
			email.focus();
			return false;
		}

		if(!isValidEmail(email.value)){
			alert('Please enter a valid email address!');
			email.focus();
			return false;
		}
		
		if(amount.value == ''){
			alert('Please enter the amount that you will pay!');
			amount.focus();
			return false;
		} else {
			if(isNaN(amount.value)){
				alert('Please enter a valid amount!');
				amount.focus();
				return false;
			}
		}
		
		return true;
	}
</script>

<div id="contents">
	<div id="content-area">
	    <div class="single page-title">
	        <h1>Pay Now</h1>
	    </div>      
		<form name="Form_pay" method="post" action="/front/paypal/preview.do" onsubmit="return fnPay();">
			<div class="paynow-box">
				<span class="row">
					<label>Email Address</label>
					<input type="text" name="email" id="email" value="" />
				</span>
				<span class="row">
					<label>Amount</label>
					<input type="text" name="amount" id="amount" value="" />&nbsp;<strong>US $</strong>
				</span>
				<span class="row">
					<label>Paypal</label>
					<img src="${img_src }/stm/btn_paypal2.jpg" alt="paypal" />
				</span>
			</div>
			<button type="submit" class="btn-paynow" >Pay Now</button>
		</form>
        </div>
    </div>
        
  