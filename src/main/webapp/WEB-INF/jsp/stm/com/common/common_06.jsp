<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ include file="../sys/taglibs.jspf"%>
<%@ include file="../sys/setCodes.jspf"%>

<div id="contents">
     <div id="content-area">
         <div class="page-title">
              <h1>Project</h1>
         </div>
         <span class="page-subtitle align-left">
         	<c:if test="${lang eq 'CN' }">这是一项针对新项目开发的一种有机的、组织性的策划。通常指为实现特定目标和计划而竖立的学习活动或实行计划等。</c:if>
            <c:if test="${lang ne 'CN' }">연구나 새로운 사업의 개발을 위한 유기적이고 조직적인 계획. 일반적으로는 특정한 목표, 계획을 위한 학습활동, 실행계획 등을 가리킨다.</c:if>
         </span>
    
         <div class="about-section-cont">
             <span class="img-holder"><img src="${img_src }/stm/research1.png" /></span>
             <div class="right-text floatR">
	             <c:if test="${lang eq 'CN' }">
	             	<p>我们的服务中包括：制作Powerpoint，进行Web Programming和Internet Search，撰写用于Speech的Script。</p>
	             	<p>您可通过Skype和Email与我们取得联系。</p>
	             </c:if>
	             <c:if test="${lang ne 'CN' }">
	             	<p>Powerpoint 작성, Web Programming, Internet Search, Speech를 위한 Script작성 등 Project 작업도 가능합니다.
Skype와 EMail을 통해서 상담 가능합니다.</p>
	             </c:if>
             </div>
         </div> 
		<div class="contents">
			<div class="content-area">
				<div class="essaytop-services">
					<span class="services-title">
						<img src="${img_src }/stm/tit/tit_essaytopservices_title.png" alt="EssayTop Service"/>
					</span>
					<div class="services-lists">
						<ul>
							<li>
								<a href="admission-essay">
									<span><img src="${img_src }/stm/icon/icon_essaytop_services01.png" alt="icon"/></span>
									<c:if test="${lang eq 'CN' }">入学申请Essay</c:if>
									<c:if test="${lang ne 'CN' }">입학 지원 에세이</c:if>
								</a></li>
							<li>
								<a href="essay-paper">
									<span><img src="${img_src }/stm/icon/icon_essaytop_services02.png" alt="icon"/></span>
									<c:if test="${lang eq 'CN' }">Essay</c:if>
									<c:if test="${lang ne 'CN' }">에세이</c:if>
								</a>
							</li>
							<li>
								<a href="term-paper">
									<span><img src="${img_src }/stm/icon/icon_essaytop_services03.png" alt="icon"/></span>
									<c:if test="${lang eq 'CN' }">期末报告</c:if>
									<c:if test="${lang ne 'CN' }">학기말 과제</c:if>
								</a>
							</li>
							<li>
								<a href="research-paper">
									<span><img src="${img_src }/stm/icon/icon_essaytop_services04.png" alt="icon"/></span>
									<c:if test="${lang eq 'CN' }">研究报告</c:if>
									<c:if test="${lang ne 'CN' }">연구 보고서</c:if>
								</a>
							</li>
							<li>
								<a href="project" class="on">
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
 