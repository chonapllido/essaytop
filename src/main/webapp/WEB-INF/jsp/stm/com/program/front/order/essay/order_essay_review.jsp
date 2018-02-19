<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ include file="../../../../sys/taglibs.jspf"%>
<%@ include file="../../../../sys/setCodes.jspf"%>

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
	    <span class="request-guides">
	        <img src="${img_src }/stm/tit/tit_req_guide01.png" alt=""/>
	        <img src="${img_src }/stm/tit/tit_req_guide02.png" alt=""/>
	    </span>
	   	</c:if>
		<div class="form-tabs">
		    <ul>
		         <li class="current">Writing</li>
		        <li><a href="/front/order/revision/write.do">Revision</a></li>
		    </ul>
		</div>
      	<div class="form-holder">
		<form name="Form_essay" commandName="orderEssayCommand" action="insert.do" method="post" enctype="multipart/form-data" >
			<input type="hidden" name="category" value="<c:out value="${orderEssayCommand.category}" />" />
			<input type="hidden" name="no_pages" value="<c:out value="${orderEssayCommand.no_pages}" />" />
			<input type="hidden" name="level" value="<c:out value="${orderEssayCommand.level}" />" />		
			<input type="hidden" name="days" value="<c:out value="${orderEssayCommand.days}" />" />
			<input type="hidden" name="no_sources" value="<c:out value="${orderEssayCommand.no_sources}" />" />
			<input type="hidden" name="preferred_writer" value="<c:out value="${orderEssayCommand.preferred_writer}" />" />
			<input type="hidden" name="topic" value="<c:out value="${orderEssayCommand.topic}" />" />
			<input type="hidden" name="in_body" value="<c:out value="${orderEssayCommand.in_body}" />" />
			<input type="hidden" name="total_payment" value="<c:out value="${orderEssayCommand.total_payment}" />" />
			<input type="hidden" name="file" value="<c:out value="${orderEssayCommand.file }" />" />
			<input type="hidden" name="file_upload" value="<c:out value="${orderEssayCommand.file_upload }"/>" />
			<input type="hidden" name="price" value="${price }" />
			<input type="hidden" name="read_material" value="<c:out value="${orderEssayCommand.read_material}" />" />
			<input type="hidden" name="materials_text" value="<c:out value="${materials_text }" />" />
			<input type="hidden" name="format" value="<c:out value="${orderEssayCommand.format}" />" />
			<input type="hidden" name="deldate" value="<c:out value="${deldate }"/>" />
			<input type="hidden" name="end_date" value="<c:out value="${orderEssayCommand.end_date}" />" />
			<input type="hidden" name="user_id" value="<c:out value="${orderEssayCommand.user_id }" />" />
			<input type="hidden" name="pricewithcommission" value="<c:out value="${orderEssayCommand.pricewithcommission }" />" />
			<div class="form-col">
			    <span class="details">
			        <label>Category</label>
			        <span class="select-arrow-bg">${orderEssayCommand.category }</span>
				</span>
				<span class="details">
				    <label>Writing Format</label>
				    <span class="data">${orderEssayCommand.format }</span>
				</span>
				<span class="details">
				    <label>Level</label>
				    <span class="data">${orderEssayCommand.level }</span>
				</span>
				<span class="details">
				    <label>Deadline</label>
				    <span class="data">${orderEssayCommand.days } days&nbsp;&nbsp;-&nbsp;${deldate }</span>
				</span>
				<span class="details">
				    <label>Number of Pages</label>
				    <span class="data">${orderEssayCommand.no_pages }</span>
				</span>
				<span class="details">
				    <label>Required Reading</label>
				    <span class="data">${materials_text }</span>
				</span>
				<span class="details">
				    <label>Number of Sources</label>
				    <span class="data">${orderEssayCommand.no_sources }</span>
				</span>
				<span class="details">
				    <label>Topic</label>
				   	<span class="data">${orderEssayCommand.topic }</span>
				</span>                        
			</div>
	      	<div class="form-col">
	          <span class="details textbox2">
	              <label class="txtarea-label">
	                  Instructions
	              </label>
	              <span>
	                  <span class="data">${orderEssayCommand.in_body }</span>
	              </span>
	          </span>
	          <div class="details file-list">
	              <label class="txtarea-label">
	                  Files
	              </label>
	              <span class="file-list-name">${fn:replace(orderEssayCommand.file, ":", "</span><span class='file-list-name'>")}</span>
	          </div>
	          <span class="btns-sec">
	                                          
	              <span class="total-amt-hldr">
	                  <span class="label">Total</span>
	                  <span class="total-amt">
	                      <span class="dollar-sign">$</span>&nbsp;<span class="txt-total" id="total_text">${orderEssayCommand.pricewithcommission }</span>
	                  </span>                                
	              </span>
	              
	              <span class="writing-btns">
	                  <button type="submit" class="apply"><img src="${img_src }/stm/tit/tit_req_btn_apply_en.png" alt="신청"></button>
	                  <button type="button" class="cancel" onclick="javascript:location.href='/front/order/essay/insert.do'"><img src="${img_src }/stm/tit/tit_req_btn_cancel_en.png" alt="취소"></button>
                  </span>
              </span>
			</div>    
			</form>                                
	   	</div>
    </div>
</div>