<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ include file="../sys/taglibs.jspf"%>
<%@ include file="../sys/setCodes.jspf"%>

<c:if test="${lang eq 'CN'}">
	<div id="contents">
		<div id="content-area">
	        <div class="page-title">
	             <h1>Guide Services</h1>
	        </div>
            <span class="page-subtitle align-left">这是对从注册会员到付款、接收文件为止的整个过程的指南。</span>
            <p class="guide-subtext">写作不论是哪种体裁都有难度。研究、分析、整理需要很长的时间。Essaytop.net就是帮您解决这些问题的地方。您所交付给我们的任务会得到彻底的保护，文件的所有权毫无理由地归顾客。<br/>
Essaytop.net的文件使用可信度极高的Plagiarismascanner.com，而不是随处可见的软件，因此不会涉及到抄袭问题。</p>
        </div>
   	</div>
	<div class="essay-cross-content">
	    <div class="contents">
	        <div class="content-area">
	            <span class="cont-title">Essaytop业务流程</span>
	            <ul class="guide-essaytop-services">
	                <li><span><img src="${img_src}/stm/icon/icon_guide_ch_01.png" alt="1. 注册会员→填写您的个人信息"/></span>1. 注册会员→填写您的个人信息</li>
				      <li><span><img src="${img_src}/stm/icon/icon_guide_ch_02.png" alt="2. 在申请页面填写您的订单要求"/></span>2. 在申请页面填写您的订单要求</li>
				      <li><span><img src="${img_src}/stm/icon/icon_guide_ch_03.png" alt="3. 利用Paypal付款"/></span>3. 利用Paypal付款</li>
				      <li><span><img src="${img_src}/stm/icon/icon_guide_ch_04.png" alt="4. 确认付款后开始撰写"/></span>4. 确认付款后开始撰写</li>
				      <li><span><img src="${img_src}/stm/icon/icon_guide_ch_05.png" alt="5. 撰写完毕后由项目负责人审稿并检查是否涉及到抄袭问题"/></span>5. 撰写完毕后由项目负责人审稿并检查是否涉及到抄袭问题</li>
				      <li><span><img src="${img_src}/stm/icon/icon_guide_ch_06.png" alt="6. 完成→交稿（用手机短信和电子邮件发送通知）"/></span>6. 完成→交稿（用手机短信和电子邮件发送通知)</li>
				    </ul>
				</div>
    		</div>
		</div>
		<div class="contents">
		    <div class="content-area ">
		        <span class="red-title">Essaytop service参考</span>
		        <div class="guide-essaytop-services-list">
		            <span class="number"><img src="${img_src}/stm/number_01.png" alt="01"/></span>
		            <p class="text">如果对文件的要求较高且对我们的服务质量存有怀疑，可通过Essaytop.net skype与我们取得联系或发邮件至essaytopp@gmail.com。</p>
		        </div>
		        <div class="guide-essaytop-services-list">
		            <span class="number"><img src="${img_src}/stm/number_02.png" alt="02"/></span>
		            <p class="text">会员注册时需要填写电子邮箱、性别、联系电话及国籍等个人信息。要求这些信息的目的是为了更好地为您服务，并事先了解顾客的文化背景来更好地撰写文章所需。</p>
		        </div>
		        <div class="guide-essaytop-services-list">
		            <span class="number"><img src="${img_src}/stm/number_03.png" alt="03"/></span>
		            <p class="text">在申请过时您可上传10个文件。容量过大的视频文件可利用Drop box或Naver 云服务共享。若文件超过10个，剩余的可用邮箱转发。由于每个学校的课程和对报告的要求不同，烦请您将具体要求一并发给我们。</p>
		        </div>
		        <div class="guide-essaytop-services-list">
		            <span class="number"><img src="${img_src}/stm/number_04.png" alt="04"/></span>
		            <p class="text">Essaytop.net的文件质量管理员确认您的订单要求后，如有不明之处将与您取得联系。在进行相应的沟通后，您会收到订单确认邮件，并安排最合适的人选为您撰写文章。</p>
		        </div>
		        <div class="guide-essaytop-services-list">
		            <span class="number"><img src="${img_src}/stm/number_05.png" alt="05"/></span>
		            <p class="text">我们将通过Skype及时通讯和电子邮件来管理您的订单。</p>
		        </div>
		        <div class="guide-essaytop-services-list">
		            <span class="number"><img src="${img_src}/stm/number_06.png" alt="06"/></span>
		            <p class="text">交稿日期到达后，您可进入Essaytop.net的我的页面或通过Essaytop.net向您发去的电子邮件下载文件。</p>
		        </div>
		        <div class="guide-essaytop-services-list last">
		            <span class="number"><img src="${img_src}/stm/number_07.png" alt="07"/></span>
		            <p class="text">若您不满意我们的服务，我们会向您提供免费修改服务直到您满意为止。我们Essaytop.net的目标是为顾客提供最高品质的服务。我们会诚恳地接受您的批评和建议。</p>
		        </div>
		    </div>
		</div>
	</div>
</c:if>
<c:if test="${lang ne 'CN'}">
	<div id="contents">
		<div id="content-area">
			<div class="page-title">
               	<h1>Guide Services</h1>
           	</div>
           	<span class="page-subtitle align-left">회원가입부터 결제 및 완료문서 수신까지의 전 이용과정에 대한 가이드입니다.</span>
            <p class="guide-subtext">글쓰기는 어떤 종류라도 쉽지가 않습니다. 연구하고, 분석하고 정보를 정리하고 생각하는데 시간이 많이 소요됩니다. Essaytop.net은 바로 이점을 도와 드리기 위한 곳입니다. 고갹에 대한 모든 정보는 비밀이 보장되며, 문서의 소유권은 당연히 고객에게 있습니다.<br/>
Essaytop.net의 문서는 어디서나 쉽게 찾을 수있는 소프트웨어가 아닌, 믿을 만한 Plagiarismascanner.com을 사용하고  있으므로 표절에서도 자유롭습니다.</p>
      	</div>
  	</div>
    <div class="essay-cross-content">
	    <div class="contents">
	        <div class="content-area">
	            <span class="cont-title"><img src="${img_src}/stm/tit/tit_essaytop_services.png" alt="EssayTop Service 과정"/></span>
				<ul class="guide-essaytop-services">
			        <li><img src="${img_src}/stm/icon/icon_guide_01.png" alt="1. 회원가입을 통한 회원님 프로필 기재"/></li>
			        <li><img src="${img_src}/stm/icon/icon_guide_02.png" alt="2. 신청하기 페이지에서 주문 양식 작성"/></li>
			        <li><img src="${img_src}/stm/icon/icon_guide_03.png" alt="3. Paypal이용 회원님 결제"/></li>
			        <li><img src="${img_src}/stm/icon/icon_guide_04.png" alt="4. 고객님 결제 후 해당 작성자 지정 Essay 작성 시작"/></li>
			        <li><img src="${img_src}/stm/icon/icon_guide_05.png" alt="5. Essay 작업 후 담당 PM이 검수 및 표절 확인"/></li>
			        <li><img src="${img_src}/stm/icon/icon_guide_06.png" alt="6. 완료 문서 전달 (알림 이메일 및 문자메시지 발송)"/></li>
			   	</ul>
        	</div>
    	</div>
	</div>
	<div class="contents">
	    <div class="content-area ">
	        <span class="cont-title"><img src="${img_src}/stm/tit/tit_essaytop_services_red.png" alt="EssayTop Service 참고"/></span>
	   <div class="guide-essaytop-services-list">
	       <span class="number"><img src="${img_src}/stm/number_01.png" alt="01"/></span>
	       <p class="text">에세이 주문 요건이 까다롭고, 우리가 보내드릴 문서의 품질에 대해 의심이 드신다면, Essaytop.com skype 상에서 대화를 나누시거나 이메일 essaytopp@gmail.com으로 메일을 주십시오.</p>
	   </div>
	   <div class="guide-essaytop-services-list">
	       <span class="number"><img src="${img_src}/stm/number_02.png" alt="02"/></span>
	       <p class="text">회원가입을 통해 이메일 주소, 성별, 전화번호 그리고 국적 등 모든 정보가 필요합니다. 이것은 대화를 순조 롭게 하고 어떤 경우에는 귀하의 문화적 배경을 이해하여 귀하의 에세이에 들어갈 내용에 참조하기 위한 것 입니다.</p>
	   </div>
	   <div class="guide-essaytop-services-list">
	       <span class="number"><img src="${img_src}/stm/number_03.png" alt="03"/></span>
	       <p class="text">신청하기를 통해 약식을 작성시 10개의 파일을 업로드 하실 수 있습니다. Video file 같이 File이 너무 크면 Drop box나 Naver N드라이브를 통해 파일을 공유해주세요. 파일이 10개 이상이면, 나머지 파일은 이메일로 보내주시고 교과 과정의 내용이 모든 학교나 대학에 따라 다르므로 귀하의 노트를 보내주시면 감사하겠습니다.</p>
	   </div>
	   <div class="guide-essaytop-services-list">
	       <span class="number"><img src="${img_src}/stm/number_04.png" alt="04"/></span>
	       <p class="text">Essaytop.net 문서의 품질 보증 관리자가 귀하의 주문 지시서를 검토하여 일치하지 않는 점이 있을 경우  귀하에게 알려드릴 겁니다. 확인 후 귀하의 주문을 확인하고 귀하는 주문 확인 이메일을 수령하시게 되며, 주제에 딱 맞는 적절한 작성자를 지정해 드립니다.</p>
	   </div>
	   <div class="guide-essaytop-services-list">
	       <span class="number"><img src="${img_src}/stm/number_05.png" alt="05"/></span>
	       <p class="text">실시간 Skype 채팅, 이메일을 통하여 귀하의 주문을 관리하실 수 있습니다.</p>
	   </div>
	   <div class="guide-essaytop-services-list">
	       <span class="number"><img src="${img_src}/stm/number_06.png" alt="06"/></span>
	       <p class="text">납기일에 EssayTop.net에 있는 My page를 통하여, 혹은 EssayTop.net이 보내드린 이메일을 통하여 귀하가 주문하신 상품을 다운 받으실 수 있습니다.</p>
	   </div>
	   <div class="guide-essaytop-services-list last">
	       <span class="number"><img src="${img_src}/stm/number_07.png" alt="07"/></span>
	            <p class="text">에세이의 품질에 만족하지 못하실 경우에는 귀하가 만족 하실 때까지 문한 수정을 제공해 드립니다. 고객에게 최고의 에세이를 제공해 드리는 것이 Essaytop.net의 목표입니다. 그래서 더욱 귀하의 의견을 수렴 할 것입니다.</p>
	        </div>
	    </div>
	</div>
</c:if>