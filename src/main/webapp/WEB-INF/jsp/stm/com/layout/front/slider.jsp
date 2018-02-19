<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ include file="../../sys/taglibs.jspf"%>
<%@ include file="../../sys/setCodes.jspf"%>
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