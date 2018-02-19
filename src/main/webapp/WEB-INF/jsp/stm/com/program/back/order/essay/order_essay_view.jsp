<%@ page language="java" contentType="text/html; charset=utf-8"	pageEncoding="utf-8"%>
<%@ include file="../../../../sys/taglibs.jspf"%>
<%@ include file="../../../../sys/setCodes.jspf"%>
<script type="text/javascript">
fnDownloadFile = function(filenameOrig, filenameNew){
	var f = document.Form_essay;
		f.file.value = filenameOrig;
		f.file_upload.value = filenameNew;
	
		f.action = "/back/order/downloadFile.do";
		f.submit();
}
</script>
 <div id="contents">
	<div id="content-area" class="form-request-content">
	    <div class="single page-title">
	        <h1>Order</h1>
	    </div>          
		<c:if test="${lang eq 'CN' }">
		<div class="request-guides">
			<ul>
				<li class="title">订单指南</li>
				<li>1. 为了避免纠纷，请预先与我们确认订单是否被接受.</li>
				<li>2. 工作日不包括星期六和星期天.</li>
			</ul>
			<ul>
		        <li class="title">资料指南</li>
				<li>1. 如有抄袭，双倍返还.</li>
				<li>2. 修改至满意为止.</li>
			</ul>
		</div>
		</c:if>
		<c:if test="${lang ne 'CN' }">
	 	<div class="request-guides">
			<ul>
				<li><img src="${img_src }/stm/tit/tit_req_guide01.jpg" alt=""/></li>
				<li>1. 논문의 경우 주문 전 상담 후 주문해주세요.</li>
				<li>2. 토요일, 일요일은 작업일에 포함되지 않습니다.</li>
			</ul>
			<ul>
			    <li><img src="${img_src }/stm/tit/tit_req_guide02.jpg" alt=""/></li>
				<li>1. Plagiarism 발생 시 2배 보상합니다.</li>
				<li>2. 무료 수정 가능합니다.</li>
			</ul>
		</div>
	  	</c:if>
        <div class="form-tabs">
            <ul>
                <li class="current">Writing</li>
                <li><a href="/front/order/revision/insert.do">Revision</a></li>
            </ul>
        </div>                
		<div class="form-holder">
			<form name="Form_essay" method="POST" action="${url }" >
			<input type="hidden" name="order_id" value="${cmd.order_id }" />
			<input type="hidden" name="file" value="" />
			<input type="hidden" name="file_upload" value="" />
			<input type="hidden" name="type_id" value="1" />
	        <div class="form-col">
	            <span class="details">
	                <label>Category</label>
	                <span class="data">${cmd.category }</span>
	            </span>
	        	   	<span class="details">
	                <label>Writing Format</label>
	                <span class="data">${cmd.format }</span>
	            </span>
	            <span class="details">
	                <label>Level</label>
	                <span class="data">${cmd.level }</span>
	            </span>
	            <span class="details">
	                <label>Deadline</label>
	                <span class="data">${cmd.days } days&nbsp;&nbsp;-&nbsp;<fmt:formatDate pattern="MMM dd" value="${deadline}" /> 7pm (GMT + 9 Asian Time)</span>
	            </span>
	       	    <span class="details">
	                <label>Number of Pages</label>
	                <span class="data">${cmd.no_pages }</span>
	            </span>
	    	    <span class="details">
	                <label>Required Reading</label>
	                <span class="data">${cmd.read_material }</span>
	            </span>
	            <span class="details">
	                <label>Number of Sources</label>
	                <span class="data">${cmd.no_sources }</span>
	            </span>   
	            <span class="details">
	                <label>Topic</label>
	               	<span class="data"><c:out value="${cmd.topic }" /></span>
	            </span>                        
	        </div>
	        <div class="form-col">
	            <span class="details textbox2">
	                <label class="txtarea-label">
	                    Instructions
	                </label>
	                <span>
	                    <span class="data"><c:out value="${cmd.in_body }" /></span>
	                </span>
	            </span>
	            <div class="details file-list">
	                <label class="txtarea-label">
	                    Files
	                </label>
	                <span class="file-list-name">
		                <c:set var="filenameOrig" value="${fn:split(cmd.file,':')}" />
						<c:set var="filenameNew" value="${fn:split(cmd.file_upload,':')}" />
						<c:forEach var="file" items="${filenameOrig }" varStatus="i">
							<a href="javascript:void" onclick="fnDownloadFile('${file}', '${filenameNew[i.index]}')">
							${file}
							</a>
						</c:forEach>
					</span>
	            </div>
	            <span class="btns-sec">                   
	                <span class="total-amt-hldr">
	                   	<span class="label">Total</span>
	                  	<span class="total-amt">
	                   		<span class="dollar-sign">$</span>&nbsp;<span class="txt-total" id="total_text">${cmd.pricewithcommission }</span>
	        			</span>                                
	                </span>
	                <span class="writing-btns">
						<button type="button" class="apply" onclick="javascript:location.href='update.do?order_id=${cmd.order_id}'"><img src="${img_src }/stm/tit/tit_edit.png" alt="Edit"></button>
	                    <button type="button" class="cancel" onclick="javascript:location.href='/back/order/list.do'"><img src="${img_src }/stm/tit/tit_req_btn_cancel_en.png" alt="취소"></button>
	                </span>
	    		</span>
			</div>    
			</form>                                
        </div>
    </div>
</div>