<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ include file="../../../sys/taglibs.jspf"%>
<%@ include file="../../../sys/setCodes.jspf"%>

<script type="text/javascript">
	function fnValidateSignup(){
	
		var email_txt1 	= $('#email_txt1'), 
			email_txt2 	= $('#email_txt2'),
			email2_txt1 = $('#email2_txt1'),
			email2_txt2 = $('#email2_txt2'),
			password 	= $('#password'),
			password2 	= $('#password2'),
			mobile1 	= $('#mobile1'),
			mobile2 	= $('#mobile2'),
			empty_count = 0;
		
			$('.error-box >span').hide();
			$('.signup-step2-cont .error').removeClass('error');
			
			// check for empty inputs
			$('.signin-form').find('input[type="text"],input[type="password"]').each(function(){
				var myid = $(this).attr('id');
				
				if(!$(this).val()){
					$(this).addClass('error');
					empty_count++;
				}
			});
		
			if(empty_count > 0){
				$('.error-box >span').show().find('.error-txt').text("The red boxes should not be empty!");
			} else {
				var email = $.trim(email_txt1.val() + "@" + email_txt2.val()),
					email2 = $.trim(email2_txt1.val() + "@" + email2_txt2.val());
				// check if emails match
				if(email != email2){
					$('input[id*=email]').addClass('error');
					$('.error-box >span').show().find('.error-txt').text("Your email addresses do not match!");
				// check if email is a valid format
				} else if(!isValidEmail(email)){
					$('input[id*=email]').addClass('error');
					$('.error-box >span').show().find('.error-txt').text("Your email address is not valid!");
				// check if passwords match
				} else if(password.val() != password2.val()){
					$('input[id*=password]').addClass('error');
					$('.error-box >span').show().find('.error-txt').text("Your passwords do not match!");
				// check if mobile contains numbers only
				} else if( isNaN(mobile2.val()) ){
					$('input[id*=mobile]').addClass('error');
					$('.error-box >span').show().find('.error-txt').text("Your mobile number should contain numbers only!");
				} else {
					var form = document.Form_write;
					form.user_login.value = email;
					form.user_email.value = email;
					
					$.ajax({
						type: 'POST',
						url: '/front/user/idcheck.do',
						data: {'user_login': email, 'user_id':'' },
						success: function(data){
							if(data == "0"){
								form.submit();
							} else {
								$('input[id*=email]').addClass('error');
								$('.error-box >span').show().find('.error-txt').text("This email already exists in our system!");	
							}
						}
					});
				}
			}
	}	
</script>
<!-- Contents -->
    <div id="contents">
        <div id="content-area">
            <div class="single page-title">
                <h1>Sign Up</h1>
            </div >
            <c:if test="${lang eq 'CN' }">
            <p class="title-blue">本页为Essaytopchina.com会员注册页面。<br />
会员注册为免费，您所填写的信息将得到法律的保护。</p>     
            
            <ul class="signup-steps cn">
                <li><img src="${img_src }/stm/cn/signup_step1.png" alt="STEP.01 同意上述条款/重复注册确认"/>STEP.01<br/>同意上述条款/重复注册确认</li>
                <li><img src="${img_src }/stm/cn/signup_step2_on.png" alt="STEP.02 填写信息/本人验证"/>STEP.02<br/>填写信息/本人验证</li>
                <li class="last"><img src="${img_src }/stm/cn/signup_step3.png" alt="STEP.03 注册成功"/>STEP.03<br/>注册成功</li>
            </ul>
            </c:if>
            <c:if test="${lang ne 'CN' }">
            <p class="title-blue"><span>Essaytop.net</span> 회원가입 페이지 입니다.<br />
회원가입은 무료이며 회원가입 신청서에 기재되는 모든 정보는 법에 의해 철저히 보호됩니다.</p>     
            
            <ul class="signup-steps">
               	<li><img src="${img_src}/stm/signup_step01.png" alt="STEP. 01 약관동의 / 가입확인"/></li>
             	<li><img src="${img_src}/stm/signup_step02_on.png" alt="STEP. 02 정보입력 / 본인인증"/></li>
             	<li class="last"><img src="${img_src}/stm/signup_step03.png" alt="STEP. 03 가입완료"/></li>
        	</ul>
        	</c:if>
        	
          	<div class="signup-step2-cont">
				<form:form name="Form_write" action="/front/user/insert.do" method="post" enctype="multipart/form-data">
				<input type="hidden" name="user_login" value="" />
				<input type="hidden" name="user_email" value="" />
				<input type="hidden" name="position_id" value="3" />
				<div class="error-box"><span><strong>** Error:</strong> <span class="error-txt"></span></span></div>
	            <span class="signin-form">
	                <span class="form-title">
	                    <c:if test="${lang eq 'CN' }">Detail Information</c:if>
	                    <c:if test="${lang ne 'CN' }"><img src="${img_src}/stm/tit/tit_signup_form_title.png" alt="기본정보 입력"/></c:if> 
					</span> 
					<span class="form-input">
					    <label>
					    	<c:if test="${lang eq 'CN' }">Email*</c:if>
					    	<c:if test="${lang ne 'CN' }"><img src="${img_src}/stm/tit/tit_signup_form_label01.png" alt="이메일*"/></c:if>
					    </label>
					    <input type="text" name="email_txt1" id="email_txt1" title="이메일"/>
					         &#64;
					    <input type="text" name="email_txt2" id="email_txt2" title="이메일" class="second-input"/> 
					</span>
					
					<span class="form-input">
					    <label>
					    	<c:if test="${lang eq 'CN' }">Repeat Email*</c:if>
					    	<c:if test="${lang ne 'CN' }"><img src="${img_src}/stm/tit/tit_signup_form_label02.png" alt="이메일 확인*"/></c:if>
					    </label>
					    <input type="text" name="email2_txt1" id="email2_txt1" title="이메일 확인"/>
					        &#64;
					    <input type="text" name="email2_txt2" id="email2_txt2" title="이메일" class="second-input"/> 
					</span>
					
					<span class="form-input">
					    <label>
					    	<c:if test="${lang eq 'CN' }">Password*</c:if>
					    	<c:if test="${lang ne 'CN' }"><img src="${img_src}/stm/tit/tit_signup_form_label03.png" alt="비밀번호*"/></c:if>
					    </label>
					    <input type="password" name="password" id="password" title="비밀번호"/>
					</span>
					
					<span class="form-input">
					    <label>
					    	<c:if test="${lang eq 'CN' }">Repeat Password*</c:if>
					    	<c:if test="${lang ne 'CN' }"><img src="${img_src}/stm/tit/tit_signup_form_label04.png" alt="비밀번호 확인*"/></c:if>
					    </label>
					    <input type="password" name="password2" id="password2" title="비밀번호 확인"/>
					</span>
					
					<span class="form-input">
					    <label>
					    	<c:if test="${lang eq 'CN' }">Mobile Number*</c:if>
					    	<c:if test="${lang ne 'CN' }"><img src="${img_src}/stm/tit/tit_signup_form_label05.png" alt="휴대폰 번호*"/></c:if>
					    </label>
					       <select title="mobile-area-code" name="mobile1">
							<option value="+82" <c:if test="${lang ne 'CN' }">selected="selected"</c:if>>South Korea</option>
							<option value="+86" <c:if test="${lang eq 'CN' }">selected="selected"</c:if>>China</option>
					      </select>
					    <input type="text" name="mobile2" id="mobile2" title="휴대폰 번호" maxlength="10" />
					</span>
					
					<span class="signup-form-btn">
					    <span class="term-btns">
					        <button type="button" class="join" onclick="fnValidateSignup()">
					        	<c:if test="${lang eq 'CN' }"><img src="${img_src}/stm/cn/tit/tit_submit.png" alt="Submit" /></c:if>
					        	<c:if test="${lang ne 'CN' }"><img src="${img_src}/stm/tit/tit_signup_btn05.png" alt="가입"/></c:if>
					        </button>
					        <button type="button" class="cancel" onclick="javascript:document.location.href='/front/main.do'">
					        	<c:if test="${lang eq 'CN' }"><img src="${img_src}/stm/cn/tit/tit_cancel.png" alt="Submit" /></c:if>
					        	<c:if test="${lang ne 'CN' }"><img src="${img_src}/stm/tit/tit_signup_btn06.png" alt="취소"/></c:if>
					        </button>
					    </span>
					</span>
				</span>
				</form:form>
          </div>
      </div>
  </div>