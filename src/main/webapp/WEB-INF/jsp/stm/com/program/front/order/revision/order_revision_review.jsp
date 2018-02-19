<%@ page language="java" contentType="text/html; charset=utf-8"	pageEncoding="utf-8"%>
<%@ include file="../../../../sys/taglibs.jspf"%>
<%@ include file="../../../../sys/setCodes.jspf"%>

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
			<form name="Form_revision" commandName="orderRevisionCommand" action="insert.do" method="post" enctype="multipart/form-data">
			<input type="hidden" name="topic" value="<c:out value="${orderRevisionCommand.topic }" />"/>
			<input type="hidden" name="days" value="<c:out value="${orderRevisionCommand.days }" />"/>
			<input type="hidden" name="level" value="<c:out value="${orderRevisionCommand.level }" />"/>											
			<input type="hidden" name="content" value="<c:out value="${content }" />"/>
			<input type="hidden" name="no_pages" value="<c:out value="${orderRevisionCommand.no_pages }" />"/>
			<input type="hidden" name="total_payment" value="<c:out value="${orderRevisionCommand.total_payment }" />"/>
			<input type="hidden" name="file_upload" value="<c:out value="${orderRevisionCommand.file_upload }" />"/>
			<input type="hidden" name="file_upload_tmp" value="<c:out value="${orderRevisionCommand.file_upload_tmp }" />"/>
			<input type="hidden" name="end_date" value="<c:out value="${orderRevisionCommand.end_date }" />" />
			<input type="hidden" name="no_words" value="${no_words }" />
			<input type="hidden" name="pricewithcommission" value="<c:out value="${orderRevisionCommand.pricewithcommission}" />" />
			<input type="hidden" name="user_id" value="${orderRevisionCommand.user_id }" />
			<div class="form-col">                                      
			    <span class="details">
			        <label>Main Topic</label>
			        <span class="data"><c:out value="${orderRevisionCommand.topic}" /></span>
		        </span>
				<span class="details">
				    <label>Level</label>
				    <span class="data">${orderRevisionCommand.level }</span>
				</span>  
				<span class="details">
				    <label>Deadline</label>
				    <span class="data">${orderRevisionCommand.days } days&nbsp;&nbsp;-&nbsp;${deldate }</span>
				</span>
				<span class="details word-count-details">
				    <span class="no-label">
				        <textarea name="content" id="pasteinfo" rows="10" cols="10"><c:out value="${content }" /></textarea>
				    </span>
				</span>
				<span class="details file-list">
				    <label class="txtarea-label">Files</label>
				   ${orderRevisionCommand.file_upload}
				</span>
				<span class="btns-sec">
				    <span class="total-amt-hldr">
				        <img src="${img_src }/stm/tit/tit_total.png" alt="Total"/><br/>
				        <span class="total-amt">
				            <img src="${img_src }/stm/tit/tit_dollar_sign.png" alt="$" class="dollar-sign"/><span id="total_text">${orderRevisionCommand.pricewithcommission }
				        </span>
				   	</span>                                
				</span>
			    <span class="writing-btns">
			        <button type="submit" class="apply" ><img src="${img_src }/stm/tit/tit_req_btn_apply_en.png" alt="신청"></button>
			        <button type="button" class="cancel" onclick="javascript:location.href='/front/order/revision/insert.do';"><img src="${img_src }/stm/tit/tit_req_btn_cancel_en.png" alt="취소"></button>
			   	</span>
			</div>  
			</form>                                  
        </div>
    </div>
</div>