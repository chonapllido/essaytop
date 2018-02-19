<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ include file="../../../sys/taglibs.jspf"%>
<%@ include file="../../../sys/setCodes.jspf"%>
<script type="text/javascript">
fnPreSubmit = function(){
	
	var error = 0;
	$('#user_login,#password').removeClass('error');
	
	if($('#user_login').val() == $('#user_login').attr('title')){
		$('#user_login').addClass('error');
		error++;
	}
	if($('#password').val() == ''){
		$('#password').addClass('error');
		error++;
	}
	if(error > 0){
		var txt = error > 1 ? 'boxes' : 'box';
		$('.error-login').show().text('The red '+txt+' should not be empty!');
		return false;
	}
	
	return true;
}
</script>

<c:if test="${lang eq 'CN' }">
	<c:set var="email_title" value="Email" />
	<c:set var="pwd_title" value="Password" />
</c:if>
<c:if test="${lang ne 'CN' }">
	<c:set var="email_title" value="이메일" />
	<c:set var="pwd_title" value="비밀번호" />
</c:if>
<div id="contents">
    <div id="content-area">
        <div class="single page-title">
            <h1>Login</h1>
        </div>                
        <div class="login-box">
            <span class="lock-image">
                <img src="${img_src}/stm/img_lock.png" alt="lock"/>                  
           	</span>  
			<form name="Form_login" id="Form_login" method="post" action="${url }" onsubmit="return fnPreSubmit()">
               <div class="login-details">
					<span class="error-login"><c:if test="${!empty param.fail && param.fail eq 'Y'}">Your email/password is invalid!</c:if></span>
                   <span class="loign-inputs">
                       <input type="text" name="user_login" id="user_login" title="${email_title }" value="" placeholder="${email_title }"/><br/>
                      <%--  <input type="text" name="fakepassword" id="fakepassword" title="${pwd_title }" value="${pwd_title }"/>--%>
					   <input type="password" name="password" id="password"  value="" placeholder="${pwd_title }" />
                   </span>
                   <div class="login-btn">
                       <input type="submit" class="btnsubmit" title="로그인" value="" />
                	</div>
            	</div>
	            <span class="login-checkbox">
	                <a href="/front/user/forgot_password.do" class="second-checbox">
	                <c:if test="${lang eq 'CN' }">Forgot ID/Password</c:if>
	               	<c:if test="${lang ne 'CN' }">
	                <img src="${img_src}/stm/tit/tit_login_checkbox02.png" alt="lock"/></a>
	                </c:if>
	            </span>
            </form>
        </div>
    </div>
</div>