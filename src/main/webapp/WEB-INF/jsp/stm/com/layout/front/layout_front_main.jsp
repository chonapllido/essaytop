<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>

<%@ include file="../../sys/taglibs.jspf"%>
<%@ include file="../../sys/setCodes.jspf"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" lang="ko" xml:lang="ko">
<head>
<title>Essaytop</title>
<%@include file="../../sys/metalibs.jspf" %>
<%@include file="../../sys/csslibs.jspf" %>
<%@include file="../../sys/jslibs.jspf" %>

</head>
<body>
	<div class="container">
	<tiles:insertAttribute name="header" />
	<div id="contents">
		<div id="content-area">
			<c:if test="${lang eq 'CN' }">
			<span class="page-subtitle">
				临近交稿时间，可是作业还没做完该怎么办？
	请不要担心，Essaytop.net为您排忧解难！
			</span>
			
			<p>Essaytop.net是由毕业于正规大学的优秀人才为您提供个性化Essay服务的公司。公司根据MLA, APA, Chicago, Harvard等国际标准格式提供满意的服务.</p>
	
			<p>Essaytop.net的工作人员以研究者的积极态度和严谨的分析来完成每一份工作。Essaytop.net不只提供简单的写作服务, 它还贯穿于整个学科, 提供顾客所需的任何形式的撰写服务.</p>
	
			<p>Essaytop.net以专业经验为基础, 在最短时间内提供无抄袭的全方位优质文章.</p>  
			</c:if>
			<c:if test="${lang ne 'CN' }">
			<span class="page-subtitle">
				과제를 아직 끝맺지 못했는데 제출 일이 가까워져서 불안하신가요? 더 이상 걱정 하지 마세요
			</span>
			
			<p>Essaytop.net은 정규 대학을 졸업한 최고의 작성자들이 고객 맞춤형 어세이를 제공하는 회사입니다. MLA, APA Chicago, Harvard 등 국제적인 글쓰기 규격으로 고객의 만족을 보장해 드립니다!</p>
	
			<p>Essaytop.net 작성자들은 연구하는 자세를 갖추고 있으며 열성적인 동시에 분석적이기도 합니다. 
			단순히 문서 작성을 하는 것 이상으로, EssatTop.com은 모든 학업과정을 아우르며, 모든 학생들이 필요로 
			하는 글쓰기를 제공합니다.</p>
	
			<p>Essaytop.net은 전문적인 경험을 바탕으로 정확하고 포괄적이며 표절없는 최상의 결과물을 빠른 시간 내에 
			작성합니다.</p>  
			
			</c:if>
		</div>
	</div>
	<div id="cross-content">
        <div class="contents">
            <div class="content-area clearfix">
                <span class="cross-content-icons systematic">
                    <img src="${img_src }/stm/icon/icon_systematic.png" alt="Systematic"/>
                    <span class="icon-text">
                        Systematic
						<c:if test="${lang eq 'CN' }"><span class="subs">通过深层沟通，提供优质的论文服务.</span></c:if>
						<c:if test="${lang ne 'CN' }"><span class="subs">심층 상담 기반 논문작성 <br/>서비스를 제공합니다.</span></c:if>
                    </span>
                </span>
                <span class="cross-content-icons best-quality">
                    <img src="${img_src }/stm/icon/icon_best_quality.png" alt="Best Quality"/>
                    <span class="icon-text">
                        Best Quality
						<c:if test="${lang eq 'CN' }"><span class="subs">具备实力的编辑人员提供优质服务，<br/>若发现抄袭将赔付两倍.</span></c:if>
                        <c:if test="${lang ne 'CN' }"><span class="subs">검증된 에디터가 최고 품질의 서비스를 제공하며,<br/> 표절 발생시 2배 보상을 규정합니다.</span></c:if>
                    </span>
                </span>
                <span class="cross-content-icons best-price">
                    <img src="${img_src }/stm/icon/icon_best_price.png" alt="Best Price"/>                        
                    <span class="icon-text">
                        Best Price
						<c:if test="${lang eq 'CN' }"><span class="subs">每页费用保证中国最低价，<br/>并提供免费修改服务.</span></c:if>
                        <c:if test="${lang ne 'CN' }"><span class="subs">페이지 당 국내 최저가이며<br/>무료 수정 서비스를 제공합니다.</span></c:if>
                    </span>
                </span>
            </div>
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
								<a href="project">
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
	<tiles:insertAttribute name="footer" />
	</div>
</body>
</html>