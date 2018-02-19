<%@ page language="java" contentType="text/html; charset=utf-8"	pageEncoding="utf-8"%>
<%@ include file="../../../../sys/taglibs.jspf"%>
<%@ include file="../../../../sys/setCodes.jspf"%>
<script src="${js_src}/stm/program/revision.js"></script>
<script type="text/javascript">
	
	doPreSubmit = function(f){
		return JSRevision.validateForm();
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
				<li><img src="${img_src}/stm/tit/tit_req_guide01.jpg" alt=""/></li>
				<li>1. 논문의 경우 주문 전 상담 후 주문해주세요.</li>
				<li>2. 토요일, 일요일은 작업일에 포함되지 않습니다.</li>
			</ul>
			<ul>
               	<li><img src="${img_src}/stm/tit/tit_req_guide02.jpg" alt=""/></li>
				<li>1. Plagiarism 발생 시 2배 보상합니다.</li>
				<li>2. 무료 수정 가능합니다.</li>
			</ul>
  		</div>
       	</c:if>
        <div class="form-tabs-revision">
	        <ul>
	            <li><a href="essay-form">Writing</a></li>
	            <li class="current">Revision</li>
	        </ul>
	    </div>
        <div class="form-holder-revision">
		<form:form name="Form_revision" commandName="orderRevisionCommand" method="post" action="review.do" enctype="multipart/form-data" onsubmit="return doSubmit(this, 'OrderRevisionCommand')"> 
		<input type="hidden" name="total_payment" id="total_payment" value="0" />
		<input type="hidden" name="price" value=""/>
		<input type="hidden" name="no_pages" value=""/>
		<input type="hidden" name="deldaterev" id="deldate" value="<fmt:formatDate pattern="MMM dd" value="${deadline }" /> 7pm (GMT +9 Asian Time)"/>
		<input type="hidden" name="end_date" value="<fmt:formatDate pattern="yyyy-MM-dd H:m:s" value="${deadline }" />"/>
		<input type="hidden" name="rate" value="${prices }" />
		<input type="hidden" name="hasorder" value="${hasorder }" />
		<input type="hidden" name="pricewithcommission" value="${pricewithcommission }"/>
		<input type="hidden" name="user_id" value="${user.user_id }" />
		<input type="hidden" name="session_lang" value="EN" />
		<input type="hidden" name="file" value="${orderRevisionCommand.file }" />
          <div class="form-col">                                      
              <span class="details">
                  <label>Main Topic</label>
                  <span class="info-help">
                      <input type="text" name="topic" value="" maxlength="100" autocomplete="off" title="Main Topic"/>
                  </span>
              </span>
              <span class="details">
                  <label>Level</label>
                  <span class="info-help select-arrow-bg">
                      <select name="level" autocomplete="off" title="Level"/>
                        <c:forEach var="level" items="${level_list.list}" varStatus="i">
						<option value="${level.title }">${level.title}</option>
						</c:forEach> 
                      </select>
                  </span>
              </span> 
              <span class="details">
                  <label>Deadline</label>
                  <span class="info-help select-arrow-bg">
 					<select id="deadline" name="days" autocomplete="off" title="Deadline" onchange="JSRevision.countWords('${words}'); JSRevision.set_date('<fmt:formatDate pattern="yyyy-MM-dd" value="${current_date}" />');" />
                   		<c:forEach var="i" begin="${min_days}" end="30">
						<option value="${i}">${i*24} hrs (${i} days)</option>
						</c:forEach> 
               		</select>
                 </span>
                 <span id="del_date_rev" ><fmt:formatDate pattern="MMM dd" value="${deadline }" /> 7pm (GMT +9 Asian Time)</span>
				</span>                  
              <span class="details word-count-details">
                  <span class="info-help no-label">
                      <textarea name="content" id="pasteinfo" autocomplete="off" rows="10" cols="10"></textarea>
                    </span>
                    <span class="no-label word-count-holder">
					<button type="button" onclick="JSRevision.countWords('${words}');" class="btn-word-count">
					<img src="${img_src}/stm/tit/tit_count_words.png" alt="Count words"/>
					</button>
                        <img src="${img_src}/stm/tit/tit_request_revision_form.png" alt="No of words" class="number-of-words"/>
                      <input type="text" name="no_words" autocomplete="off" title="No of words" class="no-of-words" value="0" readonly="readonly" />
                      <img src="${img_src}/stm/tit/tit_request_revision_form02.png" alt="(250 words is 1 page payment)" class="page-payment"/>
                  </span>
              </span>
              <span class="details file-list">
                  <label class="txtarea-label">
                      Files
                  </label>
                  <input type="file" name="upload" id="upload" autocomplete="off" title="Files" class="input-files"/>
                  
              </span>
              <span class="btns-sec">
                  <span class="total-amt-hldr">
                      <img src="${img_src}/stm/tit/tit_total.png" alt="Total"/><br/>
                      <span class="total-amt" id="total-amt">
                          <img src="${img_src}/stm/tit/tit_dollar_sign.png" alt="$" class="dollar-sign"/><span id="total_text">0</span>
                      </span>                                
                  </span>
                  
                  <span class="writing-btns">
                      <button type="submit" class="apply"><img src="${img_src}/stm/tit/tit_req_btn_apply_en.png" alt="신청"></button>
                      <button type="button" class="cancel"  onclick="location.href='/front/main.do'"><img src="${img_src}/stm/tit/tit_req_btn_cancel_en.png" alt="취소"></button>
                  </span>
           		</span>
     		</div>  
			</form:form>                                  
        </div>
    </div>
</div>