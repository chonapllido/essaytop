<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ include file="../../../sys/taglibs.jspf"%>
<%@ include file="../../../sys/setCodes.jspf"%>

<c:if test="${lang eq 'CN' }">
	<div id="contents">
        <div id="content-area">
             <div class="single page-title">
                    <h1>Sign Up</h1>
                </div >
          <p class="title-blue">本页为Essaytopchina.com会员注册页面。<br />
会员注册为免费，您所填写的信息将得到法律的保护。</p>      
            
            <ul class="signup-steps">
               <li><img src="${img_src}/stm/signup_step1.png" alt="STEP. 01 同意上述条款/重复注册确认"/>STEP.01<br/>同意上述条款/重复注册确认</li>
				<li><img src="${img_src}/stm/signup_step2.png" alt="STEP. 02 填写信息/本人验证"/>STEP.02<br/>填写信息/本人验证</li>
				<li class="last"><img src="${img_src}/stm/signup_step3_on.png" alt="STEP. 03 注册成功"/>STEP.03<br/>注册成功</li>
            </ul>
            <div class="signup-step2-cont mTop89">
                <img src="${img_src}/stm/img_lock.png" alt="Essaytop.com 회원가입 완료" class="img-lock" />
                <span class="step2-cont-right floatR">
                    <span class="txt-blue">Registration Complete</span>
                    <span class="txt-gray">You can now use all services of essaytopchina.com</span>
                    <div class="term-btns">
                        <a href="<?php echo home_url(); ?>" class="authentication" >Home</a>
                        <a href="login" class="cancel">Login</a>
                    </div>
                </span>
                
            </div>
        </div>
    </div>
</c:if>
<c:if test="${lang ne 'CN' }">
	<div id="contents">
		<div id="content-area">
			<div class="single page-title">
			   	<h1>Sign Up</h1>
			</div >
	       	<p class="title-blue"><span>Essaytop.net</span> 회원가입 페이지 입니다.<br />
	회원가입은 무료이며 회원가입 신청서에 기재되는 모든 정보는 법에 의해 철저히 보호됩니다.</p>      
	            
			<ul class="signup-steps">
	           <li><img src="${img_src}/stm/signup_step01.png" alt="STEP. 01 약관동의 / 가입확인"/></li>
	           <li><img src="${img_src}/stm/signup_step02.png" alt="STEP. 02 정보입력 / 본인인증"/></li>
	           <li class="last"><img src="${img_src}/stm/signup_step03_on.png" alt="STEP. 03 가입완료"/></li>
	       </ul>
	       <div class="signup-step2-cont mTop89">
	           <img src="${img_src}/stm/img_lock.png" alt="Essaytop.com 회원가입 완료" class="img-lock" />
	           <span class="step2-cont-right floatR">
	               <span class="txt-blue">Essaytop.net 회원가입 완료</span>
	               <span class="txt-gray">Essaytop.net 모든서비스를 이용하실수 있습니다.</span>
	               <div class="term-btns">
	                   <a href="<?php echo home_url(); ?>" class="authentication" ><img src="${img_src}/stm/tit/tit_signup_btn07.png" alt="메인으로"/></a>
	                   <a href="login" class="cancel"><img src="${img_src}/stm/tit/tit_signup_btn08.png" alt="로그인"/></a>
	                </div>
	            </span>
	        </div>
	    </div>
	</div>
</c:if>