<%@ page language="java" contentType="text/html; charset=utf-8"	pageEncoding="utf-8"%>
<%@ include file="../../../../sys/taglibs.jspf"%>
<%@ include file="../../../../sys/setCodes.jspf"%>
<validator:javascript formName="orderEssayCommand" staticJavascript="false" xhtml="true" cdata="false"/>
<script src="${js_src}/stm/program/essay.js"></script>
<script type="text/javascript">
	
	function compute_total(){
		JSEssay.calcTotal();
		$('.show-total').css('display', 'inline-block');
	}

	doPreSubmit = function(f){
		return JSEssay.validateForm();
	}
	
</script>

<jsp:useBean id="current_date" class="java.util.Date" />
<c:set var="temp_price" value="${price}" />
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
			<form:form name="Form_essay" commandName="orderEssayCommand" method="POST" action="${url }"  enctype="multipart/form-data" onsubmit="return doSubmit(this, 'OrderEssayCommand')" >
			<input type="hidden" name="order_id" value="${orderEssayCommand.order_id }" />
			<input type="hidden" name="total_payment" value="${orderEssayCommand.total_payment }" />
			<input type="hidden" name="price" id="price" value="" />
			<input type="hidden" name="materials_text" value="" />
			<input type="hidden" name="deldate" id="deldate" value="<fmt:formatDate pattern="MMM dd" value="${deadline}" /> 7pm (GMT + 9 Asian Time)"/>
			<input type="hidden" name="end_date" id="end_date" value="<fmt:formatDate pattern="yyyy-MM-dd H:m:s" value="${deadline}" />" />
			<input type="hidden" name="category_flag" value="1" />
			<input type="hidden" name="hasorder" value="${hasorder}" />
			<input type="hidden" name="default_price" value="${default_price}" />
			<input type="hidden" name="def_days" value="${default_days}" />
			<input type="hidden" name="pricewithcommission" value="${orderEssayCommand.pricewithcommission }" />
			<input type="hidden" name="user_price" value="0" />
			<input type="hidden" name="user_id" value="${orderEssayCommand.user_id }" />
			<input type="hidden" name="order_type" value="1" />
			<div class="form-col">
			    <span class="details">
			        <label>Category</label>
			        <span class="info-help select-arrow-bg">
			            <select name="category" id="category" title="Category" autocomplete="off">
							<c:forEach var="category" items="${category_list.list}" varStatus="i">
							<option value="${category.title }" <c:if test="${orderEssayCommand.category == category.title}">selected="selected"</c:if>>${category.title}</option>
							</c:forEach> 
			           </select>   
			       </span>
			   </span>
			   <span class="details">
			       <label>Writing Format</label>
			       <span class="info-help select-arrow-bg">  
			           <select name="format" id="format" title="Writing Format" onchange="JSEssay.enableSources();" autocomplete="off"/>
			              	<option value="">None</option>
							<c:forEach var="format" items="${format_list.list}" varStatus="i">
							<option value="${format.title }" <c:if test="${orderEssayCommand.format == format.title}">selected="selected"</c:if>>${format.title}</option>
							</c:forEach> 
			           </select>
			       </span>
					<label class="right-label">
						<input type="checkbox" name="etcformatcheck" onclick="JSEssay.etcFormatOn()"/>
						Etc
					</label>
					<input type="text" name="etc_format" disabled="disabled" title="Writing format" class="etc-input" />
			    </span> 
				<span class="details">
				    <label>Level</label>
				    <span class="info-help select-arrow-bg">
				        <select name="level" id="level" title="Level" autocomplete="off"/>
				           <c:forEach var="level" items="${level_list.list}" varStatus="i">
							<option value="${level.title }" <c:if test="${orderEssayCommand.level == level.title}">selected="selected"</c:if>>${level.title}</option>
							</c:forEach> 
						</select>
			       </span>
			   </span>
			
			   <span class="details">
			       <label>Deadline</label>
			       <span class="info-help select-arrow-bg">
			           <select name="days" id="due" title="Deadline" onchange="JSEssay.update_materials(); JSEssay.set_date('${fn:substring(orderEssayCommand.start_date,0,10)}'); JSEssay.checkPageByType();"  autocomplete="off"/>
			                <c:forEach var="i" begin="${min_days}" end="30">
							<option value="${i}" 
							<c:if test="${orderEssayCommand.days == i}">selected="selected"</c:if>
							<c:if test="${empty(orderEssayCommand.days) && i==10 }">selected="selected"</c:if>>${i*24} hrs (${i} days)</option>
							</c:forEach>
			           </select>
			    	</span>
					<span id="del_date" class="deadline-txt"><fmt:formatDate pattern="MMM dd" value="${deadline}" /> 7pm (GMT + 9 Asian Time)</span>  
			   </span>
			
			   <span class="details">
			       <label>Number of Pages</label>
			       <span class="info-help select-arrow-bg">
			           <select name="no_pages" id="no_pages" title="Number of Pages" autocomplete="off"/>
			              	<c:forEach var="i" begin="1" end="${maxpage}">
							<option value="${i}" <c:if test="${orderEssayCommand.no_pages == i}">selected="selected"</c:if>>
								${i} page<c:if test="${i > 1}">s</c:if> (${words} words)
							</option>
							</c:forEach>
			           </select>
			       </span>
			   </span>
			
			   <span class="details">
			       <label>Required Reading</label>
			       <span class="info-help select-arrow-bg" id="select_materials">
				       	<c:set var="start" value="${fn:indexOf(orderEssayCommand.read_material, 'pages (')}" />
						<c:set var="end" value="${fn:indexOf(orderEssayCommand.read_material, ' US')}" />
						<c:set var="read_material" value="${fn:substring(orderEssayCommand.read_material, start+7, end)}" />
						<c:set var="temp_price_str" value="${fn:trim(temp_price + '') }" />
						<select class="ipt" name="read_material" id="reqread" onchange="JSEssay.calcTotal();" >
						<option value="">None</option>
						<c:if test="${has_free == '1'}">
						<option value="0" <c:if test="${orderEssayCommand.read_material eq '0-50 pages (free)'}">selected="selected"</c:if>>0-${free_pages} pages (free)</option>
						</c:if>
						<c:forEach var="i" begin="${pages}" end="999" step="${pages}">
							<option value="${temp_price}" <c:if test="${read_material eq temp_price_str}">selected="selected"</c:if>>
							${i+1} - (${i+pages}) pages (${temp_price} US $)
							</option>
							<c:set var="temp_price" value="${temp_price + price }" />
							<c:set var="temp_price_str" value="${fn:trim(temp_price+'') }" />
						</c:forEach>
					</select>
			       </span>
			   </span>

			   <span class="details">
			       <label>Number of Sources</label>
			       <span class="info-help select-arrow-bg">
			           <select name="no_sources" id="no_sources" title="Number of Sources" disabled="disabled" autocomplete="off"/>
			              	<c:forEach var="i" begin="0" end="20">
							<option value="${i}" <c:if test="${orderEssayCommand.no_sources == i}">selected="selected"</c:if>>
							${i}
							</option>
							</c:forEach>
			           </select>
			       </span>
			   </span>
			   <span class="details">
			       <label>Topic</label>
			       <input type="text" name="topic" id="topic" value="<c:out value="${orderEssayCommand.topic }"/>" class="full" title="Topic"/>
			    </span>                        
			</div>
			<div class="form-col">
			    <span class="details textbox2">
			        <label class="txtarea-label">
			            Instructions
			        </label>
			        <span class="info-help">
			            <textarea id="writebody" name="in_body" rows="10" cols="100"><c:out value="${orderEssayCommand.in_body }"/></textarea>
			        </span>
				</span>
				<div class="details file-list">
				    <label class="txtarea-label">
				        Files
				    </label>
				    <input type="file" name="upload[]" id="upload" value="Browse" maxlength="10" class="input-files multi"/>
				</div>
				<span class="btns-sec">
					<span class="files-note"> You can select upto 10 files</span>
					<span class="btncompute">
						<button type="button" onclick="compute_total();">
							<c:if test="${lang eq 'CN' }">Compute Total</c:if>
							<c:if test="${lang ne 'CN' }">총액 합산</c:if>
						</button>
					</span>
              		<span class="total-amt-hldr show-total" style="display:inline-block">
 						<span class="label">Total</span>
 						<span class="total-amt">
     					<span class="dollar-sign">$</span>&nbsp;<span class="txt-total" id="total_text">${orderEssayCommand.pricewithcommission }</span>
    				</span>                                
				</span>
				<span class="writing-btns">
				    <button type="submit" name="essay_submit" class="apply" ><img src="${img_src }/stm/tit/tit_req_btn_apply_en.png" alt="신청"></button>
				 	<a href="/back/order/list.do" class="cancel"><img src="${img_src }/stm/tit/tit_req_btn_cancel_en.png" alt="취소"></a>
				</span>
			</span>
		</div>    
		</form:form>                                
     </div>
</div>