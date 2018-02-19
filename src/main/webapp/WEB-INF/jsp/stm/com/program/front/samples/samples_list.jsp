<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ include file="../../../sys/taglibs.jspf"%>
<%@ include file="../../../sys/setCodes.jspf"%>

<script type="text/javascript">
	fnDownloadSample = function(filename){
		var f = document.Form_list;
			document.Form_list.filename.value = filename;
			document.Form_list.submit();
	}
</script>

<div id="contents">
	<div id="content-area">
	    <div class="page-title">
	         <h1>Samples</h1>
	    </div>
		<c:if test="${lang eq 'CN' }">
			<span class="page-subtitle align-left">可用样本来确认我们的质量. </span>
                
            <p class="guide-subtext">我们进行了包括Powerpoint和软件编程在内的各种项目。
您可以在编辑部份确认您发给我们的原稿得到了哪些校订。
在提供高品质结果的同时我们还想您提交抄袭报告书的复印件。
</p>
		</c:if>
		<c:if test="${lang ne 'CN' }">
	    	<span class="page-subtitle align-left">샘플을 통해서 작업의 퀄리티를 확인해 보세요. </span>
	    	<p class="guide-subtext"> 파워포인트, 소프트웨어 프로그래밍을 포함한 다수의 프로젝트를 진행했습니다. 처음 제출하신 문서의 교정된 문법부분을 편집된 부분에서 확인하실 수 있습니다. 최고 품질의 결과물을 제시하는 것 이외에도 표절 스캐너 보고서의 사본도 첨부해 드립니다.</p>
		</c:if>
	    <!-- Writing -->
	    <form:form name="Form_list" action="download.do" method="post" >
		<input type="hidden" name="filename" value="" />
	    <div class="sample-box">
	        <span class="writing-tab">
	            <img src="${img_src}/stm/tab_writing.png" alt="Writing"/>
	        </span>
			<div class="sample-details">                                            
			    <div class="writing-sample first-box">
			    	<span class="image"><img src="${img_src}/stm/sample_writing.png" alt="검증된 실력을 갖춘 에디터들이 다방면의 주제에 걸쳐서 수준높은 문서를 작성해드립니다."/></span>
			        <span class="content-text blue-text">
					<c:if test="${lang eq 'CN' }">
					高水准的编辑人员为您撰写各领域高水平的文件。
					</c:if>
					<c:if test="${lang ne 'CN' }">
					검증된 실력을 갖춘 에디터들이 다방면의 주제에 걸쳐서 수준높은 문서를 작성해드립니다.
					</c:if>
					</span>
			   	</div>
			  	<c:forEach var="row" items="${essay_samples.list }" varStatus="i">
			   	<c:set var="instruct_ext" value="${(i.index == 1) ? 'zip':'doc'}" />
				<c:set var="plag_ext" value="${(i.index == 3) ? 'zip':'jpg'}" />
               	<div class="writing-sample">
					<span class="image"><img src="${img_src}/stm/writing_sample0${i.index+1 }.png" alt="writing sample icon"/></span>
					<span class="content-text">
					    <span class="red-text">Title:</span>
					    <span class="sample-title">${row.title }</span>                                
					   <span class="sample-writing-btn">
					       <button type="button" onclick="fnDownloadSample('Sample ${name_list[i.index]} Instruction.${instruct_ext}')"><img src="${img_src}/stm/tit/tit_sample_writing_btn_0${i.index+1 }.png" alt="Instructions"/></button>
					       <button type="button" onclick="fnDownloadSample('${row.file}')"><img src="${img_src}/stm/tit/tit_sample_writing_btn_02.png" alt="Paper"/></button>
					       <button type="button" onclick="fnDownloadSample('Sample ${name_list[i.index]} Plagiarism Report.${plag_ext }')" class="btn-plagiarism"><img src="${img_src}/stm/tit/tit_sample_writing_btn_03.png" alt="Plagiarism Report"/></button>
					    </span>
					</span>                        
          		</div>
          		</c:forEach>
          	</div>
		</div>
          		
	    <!-- Revision -->
	    <div class="sample-box">
	        <span class="writing-tab">
	            <img src="${img_src}/stm/tab_revision.png" alt="Revison"/>
	        </span>
	        <div class="sample-details">  
	            <div class="writing-sample revision-project-box">
	                <span class="image revision-project-img"><img src="${img_src}/stm/sample_revision.png" alt="Essaytop.com은 귀하가 만족하실 때까지 문서를 무료로  수정해 드립니다."/></span>
	                <span class="content-text blue-text">
					<c:if test="${lang eq 'CN' }">
					Essaytop.net为您提供免费事后服务，直至您满意。
					</c:if>
					<c:if test="${lang ne 'CN' }">
					Essaytop.net은 귀하가 만족하실 때까지 문서를 무료로  수정해 드립니다.
					</c:if>
					</span>
	          	</div> 
                <div class="list-of-samples">
                    <ul>
						<c:forEach var="row" items="${revision_samples.list }" varStatus="i">
						<li><button type="button" onclick="fnDownloadSample('${row.file}')"><img src="${img_src}/stm/writing_sample0${i.index+1 }.png" alt="sample"/></button></li>
						</c:forEach>
                	</ul>
	                <span class="arrow">
	                <a href="#">
	                    <img src="${img_src}/stm/icon/icon_sample_arrow.png" alt=">"/>
	                </a>    
	                </span>
           		</div>
	           
	        </div>
	    </div>  
	
	    <!-- Project -->
	    <div class="sample-box">
	        <span class="writing-tab">
	            <img src="${img_src}/stm/tab_project.png" alt="Project"/>
	        </span>
	        <div class="sample-details">  
	           	<div class="writing-sample revision-project-box">
	                <span class="image revision-project-img"><img src="${img_src}/stm/sample_project.png" alt="연구나 새로운 사업의 개발을 위한 유기적이고 조직적인 계획. 일반적으로는 특정한 목표, 계획을 위한 학습활동, 실행계획 등을 가리킨다."/></span>
	                <span class="content-text blue-text">
						<c:if test="${lang eq 'CN' }">
						指以研究和新项目开发等为目的的有机的、组织性的计划，通常是为实现特定目标和计划而进行的学习活动和实行计划。
						</c:if>
						<c:if test="${lang ne 'CN' }">
						연구나 새로운 사업의 개발을 위한 유기적이고 조직적인 계획. 
						일반적으로는 특정한 목표, 계획을 위한 학습활동, 실행계획 등을 
						가리킨다.
						</c:if>
					</span>
	          	</div>
	           	<span class="list-of-samples">
	                <ul>
						<c:forEach var="row" items="${project_samples.list }" varStatus="i">
						<li><button type="button" onclick="fnDownloadSample('${row.file}')"><img src="${img_src}/stm/writing_sample0${i.index+1 }.png" alt="sample"/></button></li>
						</c:forEach>
	                </ul>
	                <span class="arrow">
	                	<a href="#">
	                    	<img src="${img_src}/stm/icon/icon_sample_arrow.png" alt=">"/>
	                    </a>    
	              	</span>
	          	</span>  
            </div>
        </div>   
        </form:form>              
    </div>
</div>