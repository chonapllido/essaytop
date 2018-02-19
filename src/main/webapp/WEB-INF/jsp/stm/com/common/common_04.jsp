<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ include file="../sys/taglibs.jspf"%>
<%@ include file="../sys/setCodes.jspf"%>

<div id="contents">
     <div id="content-area">
         <div class="page-title">
              <h1>Term Paper</h1>
         </div>
         <span class="page-subtitle align-left">
         	<c:if test="${lang eq 'CN' }">期末报告是对学生在学期中所学到知识的一个总结 （来源：Cambridge Dictionary)</c:if>
              <c:if test="${lang ne 'CN' }">학기말 과제는 각 학기 중에 특정 과목 수업을 위해 학생이 작성하는 주요 리포트 입니다. (출처 : Cambridge Dictionary)</c:if>
         </span>
    
         <div class="about-section-cont">
             <span class="img-holder"><img src="${img_src }/stm/books_mags.png" /></span>
             <div class="right-text floatR">
	             <c:if test="${lang eq 'CN' }">
	             	<p>期末报告时将自己的研究结果转华为文章形式的。期末报告应把重点放在特定主题上，并应提及该学期对所选科目的研究。
	             	在学校特别是在高校，期末报告被认为是掌握学问的必要条件之一，它可以体现学生的目标和学生是在特定课题中如何扩展知识。</p>
	             	<p>大学的期末报告是极其重要的学问之必要条件之一。因为它是在大学决定学生的升级和留级的标准之一，需要写好。
	             	它是系统的研究之产物，也是校方确认学生理解程度的方法之一。</p>
	             </c:if>
	             <c:if test="${lang ne 'CN' }">
	             	<p>학기말 과제는 연구의 결과물을 글로 작성한 것입니다. 학기말 과제의 내용은 특정 주제에 중점을 두며 선택된 과목과 관련된 이전 연구를 논합니다. 
학교 중 특히 고등 교육 기관에서 학문의 필요 요건 중의 하나로 여겨지는 학기말 과제는 학생들이 지향하는 바를 보여주며, 학생들의 지식을 특정 과제에 따라 어떻게 확장시켜 나가는지를 보여줍니다.</p>
					<p>대학 학기말 과제는 가장 중요한 학문적 필요 요건중의 하나입니다. 대학교에서, 학생들의 진급과 유급을 결정하는 기준들의 하나이기 때문에 능숙하게 작성되야 합니다.
					학기말 과제는 체계적인 연구의 산물로, 학생들의 이해 수준을 파악하는 방법의 하나이기도 합니다.</p>
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
								<a href="/front/common.do?page=common_04" class="on">
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
 