<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ include file="../sys/taglibs.jspf"%>
<%@ include file="../sys/setCodes.jspf"%>

<c:if test="${lang eq 'CN' }">
	<div id="contents">
		<div id="content-area">
			<div class="page-title">
				 <h1>Admission Essay</h1>
			</div>
			<span class="page-subtitle">入学申请Essay</span>
			 
			<div class="about-section-cont">
				<span class="img-holder"><img src="${img_src}/stm/book_glasses_03.png" alt="입학 지원 에세이"/></span>
				<div class="right-text floatR">
					<p>入学申请Essay是报考研究生时必需提交的资料，需由申请者撰写。（出处：About.com Graduate School）</p>

					<p>入学申请Essay通常以自述或传记形式撰写，是报考者和研究生入学委员会可以直接沟通的桥梁。</p>

					<p>对于学生来说又是一个对相关主题叙述本人经验的机会，学生可以通过这一过程展示本人的能力，它是报考过程中最关键的环节。</p>
				</div>
			</div>
			<span class="suggestion">
				<span class="red-title"><span>入学申请Essay应该包括哪些内容？</span></span>
				
				<span class="suggestion-txt">
首先，申请者要说明选择该校该专业的理由，并需要避免雷同。
撰写入学申请Essay，需要考虑以下几点。
</span>
			</span>                
			 <div class="admission-section2">
				<img src="${img_src}/stm/pc.jpg" alt="입학지원 에세이에는 어떤 곳들을 제시할 수 있을까?" class="img-pc"/>
				<div class="right-text floatR">
					<p><span class="red-text">01. 引言</span>
					要有吸引力，带动读者能够继续往下读。在这一部分说明选择该专业的目的和理由。</p>

					<p><span class="red-text">02.正文</span>
					要以创新但坦诚的态度具体表明本人的想法，自然地提及报考者的经验、学历和成果。</p>

					<p><span class="red-text">03. 结论</span>
					以谦逊的态度、积极的姿态、引人注目的表达方式再次简单阐述选择该专业的理由。</p>
				</div>
			</div>
		</div>
	</div>
	<div class="admission-cross-content">
		<div class="contents">
			<div class="content-area">
				<span class="admission-cont-title">通常在入学申请Essay中提及的主题</span>
				<span class="intro-content-box">
					<span class="icon"><img src="${img_src}/stm/icon/icon_ad_topic01.png" alt="이력 계획"/></span>
					<span class="text">
						<span class="main-text">课程计划</span>                           
						学生在学业方面的成就将影响今后的生活。由于选择短期或长期课程对于学生今后要学习的课程有着密切的关系，必须在入学申请Essay中提及。 
					</span>
				</span>
				<span class="intro-content-box">
					<span class="icon"><img src="${img_src}/stm/icon/icon_ad_topic02.png" alt="학문적 관심과 성취"/></span>
					<span class="text">
						<span class="main-text">对学问的兴趣和成就</span>
						  学业成就受到学生的热情和动机的影响，
对学问的兴趣和成就对决定学问的优势和劣势起到重要的作用。

					</span>
				</span>
				
				<span class="intro-content-box">
					<span class="icon"><img src="${img_src}/stm/icon/icon_ad_topic03.png" alt="연구 경험"/></span>
					<span class="text">
						<span class="main-text">研究经验</span>
						研究生报考者需向入学委员会提交之前进行过的研究主题和摘要，以让校方了解学生感兴趣的领域是什么。如果有特定领域现场经验，可以提及该经验来提示以表示可以胜任该专业的研究并取得成就。
					</span>
				</span>
				<span class="intro-content-box last">
					<span class="icon"><img src="${img_src}/stm/icon/icon_ad_topic04.png" alt="현장 경험"/></span>
					<span class="text">
						<span class="main-text">现场经验</span>
						 如果有特定领域现场经验，可以提及该经验来提示以表示可以胜任该专业的研究并取得成就。 
					</span>
				</span>
			</div>
		</div>
	</div>
</c:if>
<c:if test="${lang ne 'CN' }">
	<div id="contents">
		<div id="content-area">
			<div class="page-title">
				 <h1>Admission Essay</h1>
			</div>
			<span class="page-subtitle">입학 지원 에세이</span>
			 
			<div class="about-section-cont">
				<span class="img-holder"><img src="${img_src}/stm/book_glasses_03.png" alt="입학 지원 에세이"/></span>
				<div class="right-text floatR">
					<p>입학 지원 에세이는 대학원 신청서에 개제된 과제로 대학원 지원자가 작성하는 것입니다. (출처 : About.com Graduate School)</p>

					<p>개인적인 혹은 전기체의 에세이로 알려져있는 입학 지원 에세이는 지원자가  대학원 입학 위원회와 직접적으로 소통할 수 있게 하는 것입니다.</p>

					<p>학생들에게 제시된 주제와 관련한 그들의 경험을 서술할 기회이며 또한, 학생들이 지원하는 과정과 관련하여, 그들의 능력과 그 증거를보여줄 수있기 때문에 지원 과정의 가장 중요한 부분입니다.</p>
				</div>
			</div>
			<span class="suggestion">
				<img src="${img_src}/stm/tit/tit_admission_suggestion.png" alt="입학지원 에세이에는 어떤 곳들을 제시할 수 있을까?" class="title"/>
				<span class="suggestion-txt">입학 지원 에세이를 쓰는데 있어서, 학생들은 그 대학과 그 학과를 선택한 이유를 설명 해야하며, 입학지원 에세이를 다른 누군가가 쓴 것 같이 써서는 절대 안됩니다. 따라서, 입학 지원 에세이에는 다음과 같은 팁을 고려해서 작성되야 합니다. </span>
			</span>                
			 <div class="admission-section2">
				<img src="${img_src}/stm/pc.jpg" alt="입학지원 에세이에는 어떤 곳들을 제시할 수 있을까?" class="img-pc"/>
				<div class="right-text floatR">
					<p><span class="red-text">01. 도입</span>
					첫 문장은 독자가 에세이를 계속 읽을 수 있는 확신을 주도록 시선을 사로 잡을 것.  그 학과정을 선택한 동기와 이유를 필히 설명 할 것.</p>

					<p><span class="red-text">02. 본문</span>
					정직하고 창의적으로 자신의 논리를 상세하게 전개하며 지원자의 경험, 학력과 성취를 자연스럽게 포함할 것.</p>

					<p><span class="red-text">03. 결론</span>
					간단하게 그 과목에 관심을 가지는 이유를 재차 설명. 겸손한 자세로 긍정적으로 표현하고 주의를 끌만한 문장으로 끝 맺음.</p>
				</div>
			</div>
		</div>
	</div>
	<div class="admission-cross-content">
		<div class="contents">
			<div class="content-area">
				<span class="admission-cont-title"><img src="${img_src}/stm/tit/tit_admission_topics.png" alt="에세이 쓰기의 도입"/></span>
				<span class="intro-content-box">
					<span class="icon"><img src="${img_src}/stm/icon/icon_ad_topic01.png" alt="이력 계획"/></span>
					<span class="text">
						<span class="main-text">이력 계획</span>                           
						학교를 졸업한 이후 학생들의 전문적이고 개인적인 삶은 그들의 학문적 성과에 크게 영향을 받습니다. 단기와 장기 이력 목표를 고려하는 문제는 학생이 수행할 프로그램과 관련이 있으므로 입학 지원 에세이에 꼭 언급해야 합니다.  
					</span>
				</span>
				<span class="intro-content-box">
					<span class="icon"><img src="${img_src}/stm/icon/icon_ad_topic02.png" alt="학문적 관심과 성취"/></span>
					<span class="text">
						<span class="main-text">학문적 관심과 성취</span>
						  학문적 성과는 학생의 열정과 동기에 크게 좌우되며 더불어, 학문적 관심과 성취는학생의 학문적 강점과 약점을 결정하는데 큰 역할을 합니다. 
					</span>
				</span>
				
				<span class="intro-content-box">
					<span class="icon"><img src="${img_src}/stm/icon/icon_ad_topic03.png" alt="연구 경험"/></span>
					<span class="text">
						<span class="main-text">연구 경험</span>
						대학원 과정 지원자로서, 학생들은 수행된 이전 연구의 일반적인 주제와 개요를 입학 위원회에 제공해야 합니다. 이렇게 하여 그들은 미래에 학생들이 관심을 갖는 영역에 대해 이해하게 될 것십니다. 
					</span>
				</span>
				<span class="intro-content-box last">
					<span class="icon"><img src="${img_src}/stm/icon/icon_ad_topic04.png" alt="현장 경험"/></span>
					<span class="text">
						<span class="main-text">현장 경험</span>
						  특정 분야의 현장경험을 가지고 있는 학생들의 경우 이 경험을 공유함으로써 지원학생의 학문적 성취 가능성을 보여줄 수 있는 커다란 근거를 제시하여야합니다. 
					</span>
				</span>
			</div>
		</div>
	</div>
</c:if>
<div class="contents">
	<div class="content-area">
		<div class="essaytop-services">
			<span class="services-title">
				<img src="${img_src }/stm/tit/tit_essaytopservices_title.png" alt="EssayTop Service"/>
			</span>
			
			<div class="services-lists">
				<ul>
					<li>
						<a href="/front/common.do?page=common_02" class="on">
							<span><img src="${img_src }/stm/icon/icon_essaytop_services01.png" alt="icon"/></span>
							<c:if test="${lang eq 'CN' }">入学申请Essay</c:if>
							<c:if test="${lang ne 'CN' }">입학 지원 에세이</c:if>
						</a></li>
					<li>
						<a href="/front/common.do?page=common_03">
							<span><img src="${img_src }/stm/icon/icon_essaytop_services02.png" alt="icon"/></span>
							<c:if test="${lang eq 'CN' }">Essay</c:if>
							<c:if test="${lang ne 'CN' }">에세이</c:if>
						</a>
					</li>
					<li>
						<a href="/front/common.do?page=common_04">
							<span><img src="${img_src }/stm/icon/icon_essaytop_services03.png" alt="icon"/></span>
							<c:if test="${lang eq 'CN' }">期末报告</c:if>
							<c:if test="${lang ne 'CN' }">학기말 과제</c:if>
						</a>
					</li>
					<li>
						<a href="/front/common.do?page=common_05">
							<span><img src="${img_src }/stm/icon/icon_essaytop_services04.png" alt="icon"/></span>
							<c:if test="${lang eq 'CN' }">研究报告</c:if>
							<c:if test="${lang ne 'CN' }">연구 보고서</c:if>
						</a>
					</li>
					<li>
						<a href="/front/common.do?page=common_06">
							<span><img src="${img_src }/stm/icon/icon_essaytop_services05.png" alt="icon"/></span>
							<c:if test="${lang eq 'CN' }">项目报告</c:if>
							<c:if test="${lang ne 'CN' }">프로젝트</c:if>
						</a>
					</li>
				</ul>                        
			</div> 
		</div>
	</div>
</div>