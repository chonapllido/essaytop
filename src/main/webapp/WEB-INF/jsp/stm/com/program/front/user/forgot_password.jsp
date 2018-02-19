<%@ page language="java" contentType="text/html; charset=utf-8"	pageEncoding="utf-8"%>
<%@ include file="../../../sys/taglibs.jspf"%>
<%@ include file="../../../sys/setCodes.jspf"%>

<script type="text/javascript">
	fnSubmitEmail = function(){
		var f = document.Form_write;
		if(f.email.value == ""){
			alert("Please enter your email address!")
			f.email.focus();
			return false;
		} else {
			if(!isValidEmail(f.email)){
				alert("Please enter a valid email address!");
				f.email.focus();
				return false;
			}
		}
		
		f.submit();
	}
</script>	
<div id="contents">
	<div id="content-area">
	    <div class="single page-title">
	        <h1>Forgot Password</h1>
	    </div>                
	    <div class="login-box">
	        <span class="lock-image">
	            <img src="${img_src }/stm/img_lock.png" alt="lock"/>                  
	        </span>  
			<form:form name="Form_write" action="${url }?${param }" method="post" >
			 	<div class="login-details fp">
				 	<span class="instruct">Please enter your email address below.</span>
					<span class="msg">&nbsp;</span>
					<span class="loign-inputs">
					    <input type="text" name="email" id="email" title="이메일" value=""/>
					</span>
					<input type="button" title="Submit" value="Submit" class="btnfp" onclick="fnSubmitEmail()"/>
	        	</div>
	        </form:form>
	    </div>
	</div>
</div>			