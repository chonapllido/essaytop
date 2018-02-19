<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ include file="../sys/taglibs.jspf"%>
<%@ include file="../sys/setCodes.jspf"%>

<div id="contents">
            <div id="content-area">
                <div class="page-title">
                     <h1>FAQ Services</h1>
                </div>
                <span class="page-subtitle faq-sub">
                	 <c:if test="${lang eq 'CN' }">常见问答</c:if>
                	 <c:if test="${lang ne 'CN' }">서비스 일반 FAQ</c:if>
               	</span>                
                <ul class="question-and-answer">
                <c:if test="${lang eq 'CN' }">
					<li>
						<span>Q 01. 如果在同一时间接到了相同的订单会怎么样?</span>
                       	<p>Essaytop.net会接受该订单。但因为有不同的人负责撰写，不会出现重复问题。在交稿之前我们会进行自己的审稿，请您放心。</p>
                   	</li>
                   	<li>
						<span>Q 02. 文件的标准格式如何?</span>
                       	<p>标准格式：字体为Arial，字体大小为12号，行间距为1倍。</p>
                   	</li>
                   	<li>
						<span>Q 03. 可用中文下单吗?</span>
                       	<p>当然可以。您可以用中文或英文下单。</p>
                   	</li>
                   	<li>
						<span>Q 04. 撰稿人具备了哪些资格?</span>
                       	<p>所有撰稿人均为大学本科以上学历，大部分为硕士在读或毕业。</p>
                   	</li>
                   	<li>
						<span>Q 05. 在下单后是否可以追加提出要求?</span>
                       	<p>可以，但须在下单24小时内。</p>
                   	</li>
                   	<li>
						<span>Q 06. 在下单后是否可以更改要求?</span>
                       	<p>只可在确认订单后的1-2小时内更改。</p>
                   	</li>
                   	<li>
						<span>Q 07. 是否无需考虑抄袭问题?</span>
                       	<p>文件撰写完毕后我们将利用www.plagiarismscanner.com software来检查是否存在抄袭问题，因此您可以放心。</p>
                   	</li>
                   	<li>
						<span>Q 08. 如果对文件不满意该怎么办?</span>
                       	<p>Essaytop.net将提供免费修改服务，直至您满意。</p>
                   	</li>
                   	<li>
						<span>Q 09. 怎么拿到文件?</span>
                       	<p>会向您发去电子邮件，或者您还可以登录我们网站内的我的页面下载。</p>
                   	</li>
                   	<li>
						<span>Q 10. 隐私会得到保护吗?</span>
                       	<p>EssayTop会保护顾客的隐私。我们绝不会将您的个人信息提供给第三者。</p>
                   	</li>
				</c:if>   
				<c:if test="${lang ne 'CN' }">
					<li>
						<span>Q 01. 동일한 시점에 각각 다른 고객과 동일한 주제를 주문한 거라면 어떻게 해야 하나요?</span>
                       	<p>EssayTop.net은 두분 고객의 주문을 모두 접수하지만, 각각 다른 작성자가 작성하게 되므로 다른 내용으로 작성된다는 사실을 약속 드립니다. 
                       	또한 모든 문서가 고객에게 전달 되기 전에 검수를 거치므로 품질보장을 해드립니다.</p>
                   	</li>
                   	<li>
                   		<span>Q 02. 에세이의 표준 형식은 어떤 것인가요?</span>
                   		<p>표준 형식은, Font는 Arial, Font Size 12, 줄 간격은 Double입니다.</p>
                   	</li>
                   	<li>
                   		<span>Q 03. 주문은 영어가 아닌 한국어로 할 수 있나요?</span>
                   		<p>모든 주문은 한국어와 영어로 받습니다.</p>
                   	</li>
                   	<li>
                   		<span>Q 04. 작성자의 자격은 어떤가요?</span>
                   		<p>모든 작성자는 최소 4년의 대학과정을 졸업했으며, 대부분이 석사 과정을 이수 중이거나 이수했습니다.</p>
                   	</li>
                   	<li>
                   		<span>Q 05. 에세이 작성 지시 사항과 관련하여 정보를 추가하는 것이 가능한가요?</span>
                   		<p>가능합니다. 정보를 추가해 주실 수 있습니다만, 주문 후 24시간 내에서만 가능합니다.</p>
                   	</li>
                   	<li>
                   		<span>Q 06. 주문 한 뒤에 에세이 작성 지시사항을 변경하는 것이 가능한가요?</span>
                   		<p>주문 확정하신 뒤 1-2시간 내에만 가능합니다</p>
                   	</li>
                   	<li>
                   		<span>Q 07. 표절에 대해서는걱정 하지 않아도 되나요?</span>
                   		<p>걱정하지 않으셔도 됩니다. 모든 문서는 작성이 끝난 뒤에 www.plagiarismscanner.com software를 사용하여 표절 검사를 하므로 표절은 없습니다.</p>
                   	</li>
                   	<li>
                   		<span>Q 08. 문서의 품질에 만족하지 못한 경우는 어떻게 하나요?</span>
                   		<p>Essaytop.net은 귀하가 만족하실 때까지 문서를 무료로 수정해 드립니다.</p>
                   	</li>
                   	<li>
                   		<span>Q 09. 완성된 문서를 어떻게 받나요?</span>
                   		<p>문서 첨부한 이메일을 드립니다. 또한 우리 웹사이트 My page를 통하여문서를 다운로드 하시면 됩니다.</p>
                   	</li>
                   	<li>
                   		<span>Q 10. 개인정보 보호는 어떻게 되나요?</span>
                   		<p>EssayTop은 모든 고갹의 정보는 비밀 보장을 원칙으로 하고있습니다.
EssayTop.net은 고객의 개인 정보를 제3자나 기타 타인에게 절대로 제공하지 않습니다.</p>
                   	</li>
				</c:if>
                </ul>
                
				<c:if test="${lang eq 'CN' }">
				<span class="page-subtitle faq-sub mTop80">付款问答</span>
                <ul class="question-and-answer">
                   	<li>
						<span>Q 01.用什么方式付款?</span>
                        <p>您可用信用卡或PayPal付款。</p>
                    </li>
                    <li>
						<span>Q 02. 付款后能否撤销交易?</span>
                        <p>不可以。</p>
                    </li>
                </ul>
                <span class="page-subtitle faq-sub mTop80">服务问答</span>
                <ul class="question-and-answer">
                    <li>
						<span>Q 01. 如有关于订单的疑问，应怎么与Essaytop.net取得联系?</span>
                        <p>您可以通过Skype及时通讯或向essaytopp@gmail.com发送电子邮件。</p>
                    </li>
                    <li>
						<span>Q 02. 可用电话与Essaytop取得联系吗?</span>
                        <p>您可用skype向Essaytop拨打免费网络电话。</p>
                    </li>
                </ul>
				</c:if>
				<c:if test="${lang ne 'CN' }">
                <span class="page-subtitle faq-sub mTop80">서비스 결제 FAQ</span>
                <ul class="question-and-answer">
                   	<li>
						<span>Q 01. 비용 지불은 어떻게 하나요?</span>
                        <p>신용카드와 PayPal을 이용하여 지불 하실 수 있습니다.</p>
                    </li>
                    <li>
						<span>Q 02. 신청후 취소 환불이 가능한가요?</span>
                        <p>가능하지 않습니다.</p>
                    </li>
                </ul>
                
                <span class="page-subtitle faq-sub mTop80">서비스 문의 FAQ</span>
                <ul class="question-and-answer">
                    <li>
						<span>Q 01. 주문에 대해 여쭤 보려면 어떻게 Essaytop.net과 연락 하나요?</span>
                        <p>Skype를 통한 메신저나 essaytopp@gmail.com으로 메일을 보내주시면 됩니다.</p>
                    </li>
                    <li>
						<span>Q 02. 전화로 Essaytop와 연락 가능 한가요?</span>
                        <p>skype는 Essaytop과의 인터넷 무료전화가 가능합니다.</p>
                    </li> 
                </ul>
				</c:if>
			</div>
        </div>