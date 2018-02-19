<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ include file="../sys/taglibs.jspf"%>
<%@ include file="../sys/setCodes.jspf"%>


<div id="contents">
	<div id="content-area">
		<div class="page-title">
		     <h1>About Us</h1>
		</div>		 
		<div class="about-section-cont">
		    <span class="img-holder"><img src="${img_src }/stm/blackboard.png" alt="" /></span>
		    <div class="right-text floatR">
		    <c:if test="${lang eq 'CN' }">
				<p>
				我的英文名字叫Gia Han, 在美国一家公立中学任职中文老师，拥有10年教学经验。在此之前亦在一家国际投资公司任职高级行政人员多年。
				对于各个类别的中文写作都拥有极为深厚的理论基础，以及实践经验。
				旨在帮助更多有该方面需要的各界朋友，能够通过Essaytopchina.com获得更为专业化的写作服务。相信我们，相信您的选择！
				</p>
				</c:if>
				<c:if test="${lang ne 'CN' }">
				<!--more-->
				<p>저는 대학에서 영어 영문학을 전공하였으며 영어 관련 작업은 2006년 이후 부터 약 10년 동안 해 왔습니다.</p>
				<p>일반 문서로는 건축물 건조 및 건축 시설 설명서, 농업대학 교재, 종교 서적, 스포츠 설명서, 무역계약서, 논문, 심리 상담서적, 제안서, 사업기획 평가서. 
				기업 소개서, 금융회사 사내 교육 자료, 국가 공문서, 홈페이지, 법률 저널등과 논문으로는 논문 요약 본에서 부터 건축학, 문학, 부동산, 역사, 의학, 심리학, 의상학, 무용학, 영화평론 등 수많은 분야의 논문 번역을 해 왔습니다.</p>
				<p>번역을 하며 얻은 경험으로 축척 된 Know-How에 책임감과 성실함을 더하여 EssayTop.net을 찾는 고객 분들에게 최고 품질의 에세이를 제공해 드릴 수 있도록 최선을 다하겠습니다.</p>
				</c:if>
				    
		    </div>
		</div> 
		<c:if test="${lang eq 'CN' }">
			<span class="aboutus-services-title">
				Essaytop提供四种差别于其他公司的服务。
			</span> 
		
			<ul class="aboutus-sevices">
				<li>按照国际写作标准提供撰写服务</li>
				<li class="blue">若发现抄袭，以两倍金额赔付</li>
				<li>免费修改服务</li>
				<li>通过深层沟通，提供论文撰写服务</li>
			</ul>
		</c:if>
		<c:if test="${lang ne 'CN' }">
			<span class="aboutus-services-title">
				EssayTop은 4가지 차별화된 장점을 가지고 서비스를 제공합니다.
			</span> 
		
			<ul class="aboutus-sevices">
				<li>쿡제쓰기 규격 결과물 작성</li>
				<li class="blue">표절 발생시 2배 보상 규정</li>
				<li>무료 수정 서비스</li>
				<li>심증 상담 기반 논문작성 서비스</li>
			</ul>
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
								<a href="/front/common.do?page=common_02">
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
	</div>
</div>

