<%@ page language="java" contentType="text/html; charset=utf-8"	pageEncoding="utf-8"%>
<%@ include file="../../../sys/taglibs.jspf"%>
<%@ include file="../../../sys/setCodes.jspf"%>

<div id="contents">
	<div id="content-area">
  		<div class="single page-title">
      		<h1>Request</h1>
       	</div >
       	<div class="request-box">
			<div class="reqst-box-txt">
				<c:if test="${ack.equals('SUCCESS') || ack.equals('SUCCESSWITHWARNING')}">
				Payment Successful!<br/>Your order will now be started.
				</c:if>
				<c:if test="${!ack.equals('SUCCESS') && !ack.equals('SUCCESSWITHWARNING')}">
				<div class="hero-unit">
				<!-- Display the Transaction Details-->
					<h4> There is a Funding Failure in your account. You can modify your funding sources to fix it and make purchase later. </h4>	
					<h3> Click <a href='https://www.paypal.com/'>here </a> to go to PayPal site.</h3> <!--Change to live PayPal site for production-->
				</div>
				</c:if>	
              </div>
			<span class="button-section">
 				<a href="/front/main.do" class="button"><img src="${img_src }/stm/tit/tit_req_btn.png" alt="돌아가기"/></a>
            </span>
        </div>
    </div>
</div>	