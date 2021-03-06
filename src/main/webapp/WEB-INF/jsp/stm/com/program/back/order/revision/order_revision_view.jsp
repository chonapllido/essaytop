<%@ page language="java" contentType="text/html; charset=utf-8"	pageEncoding="utf-8"%>
<%@ include file="../../../../sys/taglibs.jspf"%>
<%@ include file="../../../../sys/setCodes.jspf"%>
<%@ page import="java.util.Date" %>
<script src="${js_src }/stm/timer.js"></script>
<script type="text/javascript">
	fnDownloadFile = function(filenameOrig, filenameNew){
		var f = document.Form_order_revision;
			f.file.value = filenameOrig;
			f.file_upload.value = filenameNew;
		
			f.action = "/back/order/downloadFile.do";
			f.submit();
	}
</script>

<jsp:useBean id="current_date" class="java.util.Date" />
<div id="contents">
	<div id="content-area" class="form-request-content-revision">
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
		<div class="form-tabs-revision">
		    <ul>
		        <li><a href="/front/order/essay/insert.do">Writing</a></li>
		        <li class="current">Revision</li>
		    </ul>
		</div>
		<div class="form-holder-revision">
			<form:form name="Form_order_revision" action="${url }" method="post" >
			<input type="hidden" name="order_id" value="${cmd.order_id }" />
			<input type="hidden" name="file" value="" />
			<input type="hidden" name="file_upload" value="" />
			<input type="hidden" name="type_id" value="2" />
	        <div class="form-col">                                      
	            <span class="details">
	                <label>Main Topic</label>
	                <span class="data"><c:out value="${cmd.topic }" /></span>
	          	</span>                  
				<span class="details">
				    <label>Level</label>
				    <span class="data">${cmd.level }</span>
				</span> 
				<span class="details">
				    <label>Deadline</label>
				    <span>
				        <span class="data">${cmd.days }days&nbsp;&nbsp;-&nbsp;<fmt:formatDate pattern="MMM dd" value="${deadline}" /> 7pm (GMT + 9 Asian Time)</span>
					</span>
				</span>                  
				<span class="details textbox2">
					<label>Instructions</label>
				   	<span>
				    	<span class="data"><c:out value="${content }" /></span>
				    </span>
				</span>
	            <span class="details file-list">
	                <label class="txtarea-label">
	                    Files
	                </label>
	             	 <a href="javascript:void(0)" onclick="javascript:fnDownloadFile('${cmd.file_upload}', '${cmd.file_upload_tmp}')">
					${cmd.file_upload}
					</a>
	            </span>
	            <span class="btns-sec">
	                <span class="total-amt-hldr">
	                    <img src="${img_src }/stm/tit/tit_total.png" alt="Total"/><br/>
	                    <span class="total-amt">
	                        <img src="${img_src }/stm/tit/tit_dollar_sign.png" alt="$" class="dollar-sign"/><span id="total_text">${cmd.pricewithcommission }</span>
	                    </span>                                
	                </span>
	                <span class="writing-btns">
						<button type="button" class="apply" onclick="javascript:location.href='update.do?order_id=${cmd.order_id}'"><img src="${img_src }/stm/tit/tit_edit.png" alt="Edit"></button>
	                    <button type="button" class="cancel" onclick="javascript:location.href='/back/order/list.do'"><img src="${img_src }/stm/tit/tit_req_btn_cancel_en.png" alt="취소"></button>
	                </span>
	          	</span>
			</div>  
			</form:form>                                  
        </div>
    </div>
</div>