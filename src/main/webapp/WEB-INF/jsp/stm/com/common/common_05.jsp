<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ include file="../sys/taglibs.jspf"%>
<%@ include file="../sys/setCodes.jspf"%>

<div id="contents">
     <div id="content-area">
         <div class="page-title">
              <h1>Research Paper</h1>
         </div>
         <span class="page-subtitle align-left">
         	<c:if test="${lang eq 'CN' }">研究报告是研究、批判性思维、资料评价以及与组织、构成相关的最终结果。 （来源：Purdue Online Writing Lab）</c:if>
            <c:if test="${lang ne 'CN' }">연구 보고서는 연구, 비평적 사고, 자료 평가, 조직, 구성과 관련된 최종 결과물입니다. (출처 : Purdue Online Writing Lab)</c:if>
         </span>
    
         <div class="about-section-cont">
             <span class="img-holder"><img src="${img_src }/stm/research1.png" /></span>
             <div class="right-text floatR">
	             <c:if test="${lang eq 'CN' }">
	             	<p>这一定义涵盖了研究报告是与特定领域的一系列研究相关的产物。</p>
	             	<p>在撰写研究报告时研究者需评价资料的论据，因此包含着资料与研究者之间的相互作用。所以研究者需要在调查研究过程中遇到的问题、探索和咨询主题的过程中先解析资料的意图并评价论据。</p>
	             </c:if>
	             <c:if test="${lang ne 'CN' }">
	             	<p>이 정의는 특정 분야에 대한 일련의 연구와 관련된 생산물이라는 뜻을 함축하고 있습니다.</p>
					<p>연구 보고서를 작성하는 과정은 연구자가 자료의 논거를 평가 해야 하기 때문에 자료와 연구자간의 상호작용을 포함하고 있습니다. 이때문에 연구자들은 그들의 연구 과정에서 발생한 의문을 조사하고 주제를 탐구하며 문의하는 과정에서 상호작용하고 자료의 의도를 해석하고 논거를 평가해야 합니다.</p>
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
								<a href="/front/common.do?page=common_05" class="on">
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
 