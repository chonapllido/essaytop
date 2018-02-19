<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ include file="../../../sys/taglibs.jspf"%>
<%@ include file="../../../sys/setCodes.jspf"%>

<div id="contents">
	<div id="content-area" class="my-page">
	    <div class="single page-title">
	        <h1>My Page</h1>
	    </div>                   
	    <div class="virtual-money">
	        <span class="label">Your Virtual Money:&nbsp;&nbsp;</span>
	        <span class="amount-money">${virtual_money }</span>
			<a href="profile" class="prof">Update Profile <br/><img src="${img_src }/stm/icon/profile.png" alt="My Profile" /></a>
	        </div>                
	        <div class="order-detail">                    
	            <table>
	      			<thead>
	                	<tr>
	                        <th>No</th>
	                        <th>Order No</th>                                
	                        <th>Type</th>
	                        <th>Date</th>
	                        <th>Deadline</th>
							<th>Price</th>
	                        <th>Result</th>
	                        <th>Status</th>
	                        <th>Process</th>
	                    </tr>
	                </thead>  
	               	<tbody>
	                <c:if test="${fn:length(cmd.list) gt 0}">
					<c:forEach var="row" items="${cmd.list }" varStatus="i">
	              	<tr>
	                   <td>${i.index+1 }</td>
	                   <td>${row.ce_order_id }</td>
	                   <td>
							<c:if test="${row.type_id eq '1' }">Essay</c:if>
							<c:if test="${row.type_id eq '2' }">Revision</c:if>
						</td>
	                   <td>${row.date }</td>
	                   <td>${row.end_date }</td>
					   <td>${row.pricewithcommission }</td>
	                   <td>
	                   		<c:if test="${!empty row.result && row.status eq 'Finished'}">
	                   		<button type="button" class="btn-img" onclick="fnDownloadResult('${row.type_id}', '${row.result }')"><img src="${img_src }/stm/icon/icon_download.png" /></button>
	                   		</c:if>
	                   </td>
	                   <td>${row.status }</td>
	                   <td><a href="/front/order/${row.type_id eq '1' ? 'essay' : 'revision' }/view.do?order_id=${row.ce_order_id}""><img src="${img_src }/stm/icon/icon_process.png" alt="i"/></a>
	                   </td>
	               	</tr>
				 	</c:forEach>
					</c:if>
					<c:if test="${fn:length(cmd.list) lt 1}">
	               	<tr>
	                   <td colspan="9" align="center">
	                       <span>No results</span>
	                   </td>
	               	</tr>
					</c:if>
	           </tbody>                        
	       </table>
	  	</div>
	   
	  	<div class="order-search-paging">
		<stmfn:paging1/>
	   	</div>
	   	<form:form name="Form_mypage_search" method="post" action="${url }" >
	   	<input type="hidden" name="search_field" value="order_id" />
	   	<div class="order-number">
	       <img src="${img_src }/stm/tit/tit_order_no.png" alt="Order No:"/>                    
	       <input type="text" name="search_keyword" value="${cmd.search_keyword }" title="Order No"/>
	       <span class="order-num-btns">
	           <button class="search" type="submit">
	               <img src="${img_src }/stm/tit/tit_btn_search02.png" alt="SEARCH"/>
	           </button>
	       </span>
	   </div>
	   </form:form>
	   
	   <div class="legends">
	       <img src="${img_src }/stm/tit/tit_legend.png" alt="Legend"/>
	       <div class="legend-details">
	           <p>Type
	               <span class="legend-desc">The type of order. It Could be essay or revision.</span>
	           </p>
	           <p>Date
	               <span class="legend-desc">The date it has been ordered.</span>
	           </p>
	           <p>Deadline
	               <span class="legend-desc">The deadline of the order to be submitted.</span>
	           </p>
	           <p>Result
	               <span class="legend-desc">The finished essay or revision. The file EssayTop uploaded.</span>
	           </p>
	           <p>Status
	               <span class="legend-desc">The status of the order. It could be pending, paid working, finished or cancelled.</span>
	           </p>
	           <p>Process
	               <span class="legend-desc">Click the information <img src="<?php bloginfo('stylesheet_directory'); ?>/images/icon/icon_legend01.png" alt="i"/> button to show the the order details.</span>
	                </p>
	                
	            </div>
	        </div>
	    </div>
	</div>