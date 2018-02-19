<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ include file="../../../sys/taglibs.jspf"%>
<%@ include file="../../../sys/setCodes.jspf"%>

<script type="text/javascript">
	fnSubmit = function(){
		if( $('#signup_agree').prop('checked')){
			location.href = "/front/user/signup/step2.do";
		} else {
			alert("You must agree with the terms and conditions to sign up.");
		}
	}
</script>
<div id="contents">
	<div id="content-area">            
		<div class="single page-title">
			<h1>Sign Up</h1>
		</div >
		<c:if test="${lang eq 'CN' }">
		<p class="title-blue">本页为Essaytopchina.com会员注册页面。<br />
会员注册为免费，您所填写的信息将得到法律的保护。</p>   
		</c:if>
		<c:if test="${lang ne 'CN' }">
		<p class="title-blue"><span>Essaytop.net</span> 회원가입 페이지 입니다.<br />
회원가입은 무료이며 회원가입 신청서에 기재되는 모든 정보는 법에 의해 철저히 보호됩니다.</p>   
		</c:if>
		<c:if test="${lang eq 'CN' }">
		<ul class="signup-steps cn">
			<li><img src="${img_src }/stm/cn/signup_step1_on.png" alt="STEP. 01 同意上述条款/重复注册确认"/>STEP.01<br/>同意上述条款/重复注册确认</li>
			<li><img src="${img_src }/stm/cn/signup_step2.png" alt="STEP. 02 填写信息/本人验证"/>STEP.02<br/>填写信息/本人验证</li>
			<li class="last"><img src="${img_src }/stm/cn/signup_step3.png" alt="STEP. 03 注册成功"/>STEP.03<br/>注册成功</li>
		</ul>
		</c:if>
		<c:if test="${lang ne 'CN'}">
		<ul class="signup-steps">
			<li><img src="${img_src}/stm/signup_step01_on.png" alt="STEP. 01 약관동의 / 가입확인"/></li>
			<li><img src="${img_src}/stm/signup_step02.png" alt="STEP. 02 정보입력 / 본인인증"/></li>
			<li class="last"><img src="${img_src}/stm/signup_step03.png" alt="STEP. 03 가입완료"/></li>
		</ul>
		</c:if>
		<div class="signup-step1-cont">
			<c:if test="${lang eq 'CN' }">
				<span class="txt-blue">注册为essaytopchina会员，可得到个性化服务。</span>  
				<p>如想注册会员，请仔细阅读以下服务条款后点击同意。</p>
				<span class="terms-title">服务条款</span>
			</c:if>
			<c:if test="${lang ne 'CN' }">
			<img src="${img_src}/stm/tit/tit_signup_txt02.png" alt="ESSAYTOP에 회원으로 가입하시면 맞춤형 에세이를 편리하게 이용하실 수 있습" class="img-txt mBot22"/>   
			<img src="${img_src}/stm/tit/tit_signup_txt03.png" alt="회원가입을 위해 아래 서비스 약관을 읽고 동의버튼을 선택해 주십시오. ESSAYTOP은 주민등록번호를 수집하지 않습니다." class="img-txt mBot56"/> 
			<span class="terms-title"><img src="${img_src}/stm/tit/tit_signup_txt04.png" alt="이용약관"/></span>
			</c:if>
			<div class="txtarea-hldr mBot46">
			   <div id="scrollbar" class="terms-box gray-skin scroll-pane">
				  <div class="term-contents">
					<p>You are responsible to study and learn the materials of your assignment.All the works done by EssayTop are solely for research or reference purposesonly. We only hire highly-skilled English Major professionals to meet your requirements and satisfy your needs but EssayTop will not be responsible for any losses you acquired as a result of using our services.</p>
					<p>EssayTop knows the rules to avoid plagiarism so we can assure you that all our works are safe. As soon as we have given the confirmation for you to download the file from our website, that file is totally owned by you. You will become the copyright owner of that material.</p>
					<p>In the event that inevitable situation will cause the delay of your order beyond the timeframe given, EssayTop will fully refund your money as soon as possible. We will also refund your money if in case you can show to us all the necessary markings proving that your model materials failed the passing criteria of your instructor and that there is no other chance for revision. If there is a chance to revise the material, then we will do it for you for free but make it sure that it has all the necessary guidelines from your instructor to meet his passing criteria. However, if the reason of the failure is due to incomplete or wrong instructions, then we cannot be held responsible. If the instructions had been changed after work has begun, then we will consider it as another order.</p>
					<p>EssayTop has the right to cite other materials such as books, magazines, journals and online publications unless specified not to do so.</p>
					</div>     
			   </div>
			</div>    
			<span class="checkbox-btn">
				<label><input type="checkbox" name="signup_agree" id="signup_agree"/> 
				<c:if test="${lang eq 'CN' }">同意上述条款并提供个人信息。</c:if>
				<c:if test="${lang ne 'CN' }"><img src="${img_src}/stm/tit/tit_signup_txt06.png" alt="textbox text"/></c:if>
				</label>
				<span class="term-btns">
					<button type="submit" class="agree" onclick="fnSubmit();">
					<c:if test="${lang eq 'CN' }">
					<img src="${img_src}/stm/cn/tit/tit_agree.png" alt="Agree"/>
					</c:if>
					<c:if test="${lang ne 'CN' }">
					<img src="${img_src}/stm/tit/tit_signup_btn01.png" alt="동의"/>
					</c:if>
					</button>
					<button class="disagree" onclick="javascript:document.location.href='/front/main.do'">
					<c:if test="${lang eq 'CN' }">
					<img src="${img_src}/stm/cn/tit/tit_disagree.png" alt="Agree"/>
					</c:if>
					<c:if test="${lang ne 'CN' }">
					<img src="${img_src}/stm/tit/tit_signup_btn02.png" alt="거부"/>
					</c:if>
					</button>
				</span>
			</span>
		</div>
	</div>
</div>