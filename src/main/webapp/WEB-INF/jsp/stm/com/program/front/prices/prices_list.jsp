<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ include file="../../../sys/taglibs.jspf"%>
<%@ include file="../../../sys/setCodes.jspf"%>

<script type="text/javascript">

	fnUpdatePrice = function(){
		var f = document.Form_price,
			category = f.category.value,
			ordinary = $("#price-essay-ordinary"),
			masteral = $("#price-essay-masteral"),
			undergrad = $("#price-essay-undergraduate")
			
		if(category == "Dissertation (Undergraduate)" || category == "Thesis (Undergraduate)"){
			ordinary.hide();
			masteral.hide();
			undergrad.show();
			
		} else if(category == "Dissertation (Masteral)" || category == "Thesis (Masteral)" ){
			ordinary.hide();
			masteral.show();
			undergrad.hide();
		
		} else {
			ordinary.show();
			masteral.hide();
			undergrad.hide();
			
			if(category == "Business" || category == "Law"){
				$('#wc, #woc').hide();	
				$('#wcb, #wocb').show();
			} else {
				$('#wc, #woc').show();
				$('#wcb, #wocb').hide();
			}
		}
	}
</script>
<c:set var="commission" value="0.20" />
<div id="contents">
	<div id="content-area" class="price-service">
	    <div class="page-title">
	         <h1>Price Service</h1>
	    </div>             
		<c:if test="${lang eq 'CN' }">
		<div class="pricepage-upper-content">
	        <span class="page-subtitle align-left">Best service guaranteed <br/> 在最短时间内把最专业、高水准的结果交到您手中.</span> 
			<p class="guide-subtext">ESSAYTOP采用自动化订单处理系统，以合理的价格提供迅速准确的Essay撰写服务。为缩短时间，付款后立即开始工作。节假日不包含在工作日中.</p>   
			<div class="upper-content-box">
				<ul>
				    <li>交付时间：24小时x 365天（周末和节假日除外）</li>
				    <li>所需时间：确认付款后立即开工。</li>
				    <li>费用：以单词计算，比按页数计算合理。</li>
				    <li>计算：单词数可在Word页面下方的状态栏或者进入审阅→字数统计确认。</li> 
				</ul>
			</div>
		</div> 
		<span class="red-title2"><span>报价单（按时间计算）</span></span> 
		</c:if>
		<c:if test="${lang ne 'CN' }">
		<div class="pricepage-upper-content">
			<span class="page-subtitle align-left">Best service guaranteed <br/> 전문적인 최상의 결과물을 빠른 시간내에 작성해 드립니다.</span> 
	      	<p class="guide-subtext">ESSAYTOP은 자동화된 주문처리 시스템을 이용하여 합리적인 가격에 신속하고 정확한 빠른 Essay 작성 서비스를 제공합니다. 고객님들의 편의를 위하여 견적 후 결제 시점에 바로 서비스가 시작됩니다.  단, 공휴일/주말은 작업일에 포함되지 않습니다.</p>   
	      	<div class="upper-content-box">
		        <ul>
		            <li>의뢰 가능 시간: 365일 24시간 (주말/공휴일 제외)</li>
		            <li>소요시간은 의뢰시간 기준이며 결제확인 시점부터입니다.</li>
		            <li>실제 작성료는 페이지가 아닌 단어 단위로 계산되어 합리적입니다.</li>
		            <li>워드의 단어수는 창 맨아래 - 상태 표시줄이나 상단메뉴의 검토탭 - 단어개수에서 확인 하실 수</li> 
		            <li>있습니다.</li>
		        </ul>
	      	</div>
		</div>  
		<span class="red-title2"><span>시간당 가격표</span></span>
	    </c:if>
		<form name="Form_price" method="post">
        	<div class="essay-category-box">
				<label for="category">Category: </label>
				<select name="category" onchange="fnUpdatePrice()">
					<c:forEach var="category" items="${category_list.list}" varStatus="i">
					<option value="${category.title }" <c:if test="${category_selected == category.title}">selected="selected"</c:if>>${category.title}</option>
					</c:forEach> 
				</select>
			</div>
		</form>
		<div  class="price-detail" id="price-essay-undergraduate">
			<div class="price-boxes">
				<div>
				  <span class="first-tab"><img src="${img_src}/stm/tit/tit_price_list.png" alt="가격표"/></span> 
				</div>
				<div>
				   <span class="second-tab"><img src="${img_src}/stm/tit/tit_250_words.png" alt="가격표"/></span> 
				</div>
				<div>
					<span class="third-tab"><img src="${img_src}/stm/tit/tit_500_words.png" alt="가격표"/></span> 
				</div>
				<div>
					<span class="fourth-tab"><img src="${img_src}/stm/tit/tit_750_words.png" alt="가격표"/></span> 
				</div>
				<div>
					<span class="fifth-tab"><img src="${img_src}/stm/tit/tit_1000_words.png" alt="가격표"/></span> 
				</div>
			</div>
			<table class="tbl-price">
				<colgroup>
	                <col width="150px"/>
	                <col width="191px"/>
	                <col width="191px"/>
	                <col width="191px"/>
	                <col width="191px"/>
	            </colgroup> 
	            <fmt:formatNumber var="p" value="${18*1.2 }" maxFractionDigits="1"/>
				<tr>
					<td><div>15 days or more</div></td>
					<td><div><fmt:formatNumber var="pprice1" value="${p}" maxFractionDigits="1"/>${pprice1 } US $</div></td>
					<td><div><fmt:formatNumber var="pprice2" value="${p*2 }" maxFractionDigits="1"/>${pprice2 } US $</div></td>
					<td><div><fmt:formatNumber var="pprice3" value="${p*3 }" maxFractionDigits="1"/>${pprice3 } US $</div></td>
					<td><div><fmt:formatNumber var="pprice4" value="${p*4 }" maxFractionDigits="1"/>${pprice4 } US $</div></td>
				</tr>
			</table>
		</div>
		<div class="price-detail" id="price-essay-masteral">
			<div class="price-boxes">
				<div>
			  		<span class="first-tab"><img src="${img_src}/stm/tit/tit_price_list.png" alt="가격표"/></span> 
				</div>
				<div>
				   <span class="second-tab"><img src="${img_src}/stm/tit/tit_250_words.png" alt="가격표"/></span> 
				</div>
				<div>
					<span class="third-tab"><img src="${img_src}/stm/tit/tit_500_words.png" alt="가격표"/></span> 
				</div>
				<div>
					<span class="fourth-tab"><img src="${img_src}/stm/tit/tit_750_words.png" alt="가격표"/></span> 
				</div>
				<div>
					<span class="fifth-tab"><img src="${img_src}/stm/tit/tit_1000_words.png" alt="가격표"/></span> 
				</div>
			</div>
			<table class="tbl-price">
				<colgroup>
					<col width="150px"/>
					<col width="191px"/>
					<col width="191px"/>
					<col width="191px"/>
					<col width="191px"/>
	            </colgroup> 
	            <fmt:formatNumber var="q" value="${25*1.2 }" maxFractionDigits="0"/>
				<tr>
					<td><div>15 days or more</div></td>
					<td><div>${q } US $</div></td>
					<td><div>${q*2 } US $</div></td>
					<td><div>${q*3 } US $</div></td>
					<td><div>${q*4 } US $</div></td>
				</tr>
			</table>
		</div>
		<!-- Without Citation Table -->
	    <div class="price-detail" id="price-essay-ordinary">   
			<span class="essay-table-title"><span class="etitle-left">&nbsp;</span></span>
			<div class="price-boxes">
				<div>
				  	<span class="first-tab"><img src="${img_src}/stm/tit/tit_price_list.png" alt="가격표"/></span> 
				</div>
				<div>
				   <span class="second-tab"><img src="${img_src}/stm/tit/tit_250_words.png" alt="가격표"/></span> 
				</div>
				<div>
					<span class="third-tab"><img src="${img_src}/stm/tit/tit_500_words.png" alt="가격표"/></span> 
				</div>
				<div>
					<span class="fourth-tab"><img src="${img_src}/stm/tit/tit_750_words.png" alt="가격표"/></span> 
				</div>
			  	<div>
					<span class="fifth-tab"><img src="${img_src}/stm/tit/tit_1000_words.png" alt="가격표"/></span> 
				</div>
			</div>
			<table id="wc">
	            <colgroup>
	                <col width="150px"/>
	                <col width="191px"/>
	                <col width="191px"/>
	                <col width="191px"/>
	                <col width="191px"/>
	            </colgroup> 
	            <tbody>
				<c:forEach var="row" items="${essay_prices }" varStatus="i">
					<c:set var="eprice" value="${row.price+1}" />
					<c:set var="eprice_wcommission3" value="${eprice + (eprice*commission) }" />
					<c:if test="${i.index > 0 }">	
					<tr<c:if test="${i.index % 2 eq 0 }"> class="even"</c:if>>
						<td><div>${row.title }</div></td>
						<td><div><fmt:formatNumber var="eprice1" value="${eprice_wcommission3}" maxFractionDigits="1" />${eprice1 }US $</div></td>
						<td><div><fmt:formatNumber var="eprice2" value="${eprice_wcommission3 * 2}" maxFractionDigits="1" />${eprice2 } US $</div></td>
						<td><div><fmt:formatNumber var="eprice3" value="${eprice_wcommission3 * 3}" maxFractionDigits="1" />${eprice3 } US $</div></td>
						<td><div><fmt:formatNumber var="eprice4" value="${eprice_wcommission3 * 4}" maxFractionDigits="1" />${eprice4 } US $</div></td>
					</tr>
					</c:if>
				</c:forEach>
	            </tbody>                        
	      	</table>
			<table id="wcb">
	            <colgroup>
	                <col width="150px"/>
	                <col width="191px"/>
	                <col width="191px"/>
	                <col width="191px"/>
	                <col width="191px"/>
	            </colgroup> 
	            <tbody>
				<c:forEach var="row" items="${essay_prices }" varStatus="i">
					<c:set var="eprice" value="${row.price+3}" />
					<c:set var="eprice_wcommission4" value="${eprice + (eprice*commission)}" />
					<c:if test="${i.index > 0 }">
					<tr<c:if test="${i.index % 2 eq 0 }"> class="even"</c:if>>
						<td><div>${row.title }</td>
						<td><div><fmt:formatNumber var="eeprice1" value="${eprice_wcommission4}" maxFractionDigits="1"/>${eeprice1} US $</div></td>
						<td><div><fmt:formatNumber var="eeprice2" value="${eprice_wcommission4 * 2}" maxFractionDigits="1"/>${eeprice2} US $</div></td>
						<td><div><fmt:formatNumber var="eeprice3" value="${eprice_wcommission4 * 3}" maxFractionDigits="1"/>${eeprice3} US $</div></td>
						<td><div><fmt:formatNumber var="eeprice4" value="${eprice_wcommission4 * 4}" maxFractionDigits="1"/>${eeprice4} US $</div></td>
					</tr>
					</c:if>
				</c:forEach>
	            </tbody>                        
	      	</table>
	  	</div>        
		<div class="price-detail">
			<span class="essay-table-title">REVISION</span>
			<div class="price-boxes">
				<div>
			  		<span class="first-tab"><img src="${img_src}/stm/tit/tit_price_list.png" alt="가격표"/></span> 
				</div>
				<div>
				   <span class="second-tab"><img src="${img_src}/stm/tit/tit_250_words.png" alt="가격표"/></span> 
				</div>
				<div>
					<span class="third-tab"><img src="${img_src}/stm/tit/tit_500_words.png" alt="가격표"/></span> 
				</div>
				<div>
					<span class="fourth-tab"><img src="${img_src}/stm/tit/tit_750_words.png" alt="가격표"/></span> 
				</div>
				<div>
					<span class="fifth-tab"><img src="${img_src}/stm/tit/tit_1000_words.png" alt="가격표"/></span> 
				</div>
			</div>
			<table>
	            <colgroup>
	                <col width="150px"/>
	                <col width="191px"/>
	                <col width="191px"/>
	                <col width="191px"/>
	                <col width="191px"/>
	            </colgroup> 
	            <tbody>
				<c:forEach var="row" items="${revision_prices }" varStatus="i">
					<c:set var="price" value="${row.price }" />
					<c:set var="price_wcommission" value="${price + (price*commission)}" />
					<fmt:formatNumber var="price_wcommission" value="${price + (price*commission)}" maxFractionDigits="0" />
					<tr<c:if test="${i.index % 2 eq 0 }"> class="even"</c:if>>
						<td><div>${row.title } (${row.days } days)</div></td>
					<td><div>${price_wcommission*1} US $</div></td>
					<td><div>${price_wcommission*2} US $</div></td>
					<td><div>${price_wcommission*3} US $</div></td>
					<td><div>${price_wcommission*4} US $</div></td>
				</tr>
				</c:forEach>
	           	</tbody>                        
	      	</table>       
		</div> 
	</div>
</div>