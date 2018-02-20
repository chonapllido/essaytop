<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ include file="../../sys/taglibs.jspf"%>
<%@ include file="../../sys/setCodes.jspf"%>

<c:if test="${lang eq 'CN' }">
	<c:set var="cls" value="set2 ch" />
</c:if>
<c:if test="${lang ne 'CN' }">
	<c:set var="cls" value="set2" />
</c:if>
 <div id="header" class="${cls }">
      <!-- //navigation -->
      <div class="nav">
          <div class="wrapper">
              <a href="/front/main.do"><img src="${img_src }/stm/logo.png" alt="Essay Top" id="logo"/></a>
			  <div class="menu-main-menu-container">
			  	<ul class="main-menu">
			  		<li><a href="/front/common.do?page=common_01">About Us</a></li>
			  		<li>
			  			<a href="/front/common.do?page=common_02">Essay Services</a>
			  			<ul class="sub-menu">
			  				<li><a href="/front/common.do?page=common_02">Admission Essay</a></li>
			  				<li><a href="/front/common.do?page=common_03">Essay Paper</a></li>
			  				<li><a href="/front/common.do?page=common_04">Term Paper</a></li>
			  				<li><a href="/front/common.do?page=common_05">Research Paper</a></li>
			  				<li><a href="/front/common.do?page=common_06">Project</a></li>
			  			</ul>
			  		<li><a href="/front/samples/list.do">Samples</a></li>
			  		<li><a href="/front/prices.do">Price</a></li>
			  		<li><a href="/front/common.do?page=common_07">Guide</a></li>
			  		<li><a href="/front/common.do?page=common_08">FAQ</a></li>
			  	</ul>
			  </div>
              <span class="app-buttons <c:if test="${!empty user }">sigend-on</c:if>">
					<a href="/front/paypal/paynow.do" class="btnpaypal"><img src="${img_src }/stm/btn_paypal.png" alt="Paypal" /></a>
                  	<c:if test="${!empty user }">
						<c:if test="${user.position_id eq '1' }"><a href="/back/order/list.do">Admin</a></c:if>
						<c:if test="${user.position_id ne '1' }"><a href="/front/user/mypage.do">My page</a></c:if>
						<a href="/front/user/logout.do">Log out</a>
					</c:if>
					<c:if test="${empty user }">
					<a href="/front/user/login.do">Log in</a>
					<a href="/front/user/signup/step1.do">Sign up</a>
					</c:if>
					<c:if test="${lang eq 'KO'}">
              		<a href="/front/main.do?lang=CN" class="lang">Chinese</a> 
              		</c:if>
              		<c:if test="${lang ne 'KO'}">
              		<a href="/front/main.do?lang=KO" class="lang">Korean</a> 
              		</c:if>
              </span>
          </div>
      </div>
      <!-- //navigation -->
      <!--side-links-->
      <div class="side-links wrapper">
          <span class="easytop-apply">
          	<c:if test="${!empty user }">
             <a href="/front/order/essay/insert.do">
             </c:if>
             <c:if test="${empty user }">
             <a href="javascript:alert('Please log in!')">
             </c:if>
             <img src="${img_src }/stm/img_easytop.png" alt="Essaytop.com"/></a>
           </span>
           <span class="skype-service-connecting"> 
			<script type="text/javascript" src="${js_src }/stm/js/skype-uri.js"></script>
			<div class="skype-box" id="SkypeButton_Call_essaytop.com_1" >
			  <script type="text/javascript">
			Skype.ui({
			  "name": "chat",
			  "element": "SkypeButton_Call_essaytop.com_1",
			  "participants": ["essaytop.com"],
			  "imageSize": 32
			});
			 </script>
			</div>
           </span>
       </div>
       <!-- //side-links -->
  </div>
  <!-- //Header -->