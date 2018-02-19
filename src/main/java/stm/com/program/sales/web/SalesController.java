package stm.com.program.sales.web;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.lang.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;




import egovframework.rte.fdl.property.EgovPropertyService;
import egovframework.rte.ptl.mvc.tags.ui.pagination.PaginationInfo;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.GregorianCalendar;
import java.util.HashMap;
import java.util.Map;

import stm.com.generic.web.GenericController;
import stm.com.program.paypal.payment.service.PaypalPaymentService;
import stm.com.program.paypal.payment.web.PaypalPaymentCommand;
import stm.com.program.sales.service.SalesService;
import stm.com.support.util.ApplicationHelper;
import stm.com.sys.Constants;

@Controller
@RequestMapping("/back/sales")
public class SalesController extends GenericController<SalesService, SalesCommand> {

	@Autowired
	private EgovPropertyService propertyService;
	
	public ModelAndView list(SalesCommand cmd, HttpServletRequest req, HttpServletResponse res) throws Exception{
		
		ModelAndView mav = super.list(cmd, req, res);
		String user_email = "";
		
		if(cmd.getSearch_keyword() != null){
			user_email = cmd.getSearch_keyword();
		}

		mav.addObject(Constants.CMD_VALUE, cmd);
		mav.addObject("user_email", user_email);
		return mav;
	}
	
	@RequestMapping(value="/commission")
	public ModelAndView commission(SalesCommand cmd, HttpServletRequest req, HttpServletResponse res) throws Exception{
		
		ModelAndView mav = new ModelAndView();
		mav.setViewName("/back/sales/commission");
		
		Calendar c = new GregorianCalendar();
		c.setTime(new Date());
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		String to_date = sdf.format(c.getTime());
		c.add(Calendar.MONTH, -1);
		String from_date = sdf.format(c.getTime());
		
		if(req.getParameterMap().containsKey("from_date")){
			from_date = req.getParameter("from_date");
		}
		if(req.getParameterMap().containsKey("to_date")){
			to_date = req.getParameter("to_date");
		}
		
		mav.addObject("from_date", from_date);
		mav.addObject("to_date", to_date);
		
		cmd.setPage_use_at(StringUtils.defaultIfEmpty(cmd.getPage_use_at(), "Y"));
		cmd.setPage_count_use_at(StringUtils.defaultIfEmpty(cmd.getPage_count_use_at(), "Y"));

		/** pageing setting */
		if (cmd.getCurrent_page_no() <= 0) {
			cmd.setCurrent_page_no(1);
		}
		if (cmd.getRecord_count_per_page() <= 0) {
			cmd.setRecord_count_per_page(propertyService.getInt("pageUnit"));
		}
		if (cmd.getPage_size() <= 0) {
			cmd.setPage_size(propertyService.getInt("pageSize"));
		}

		PaginationInfo paginationInfo = new PaginationInfo();
		paginationInfo.setCurrentPageNo(cmd.getCurrent_page_no());
		paginationInfo.setRecordCountPerPage(cmd.getRecord_count_per_page());
		paginationInfo.setPageSize(cmd.getPage_size());

		cmd.setFirst_index(paginationInfo.getFirstRecordIndex());
		cmd.setLast_index(paginationInfo.getLastRecordIndex());
		cmd.setRecord_count_per_page(paginationInfo.getRecordCountPerPage());
		
		cmd.setStart_date(from_date);
		cmd.setDate(from_date);
		cmd.setEnd_date(to_date);
		SalesCommand new_cmd = getService().getListBetweenDates(cmd, req, res);
		mav.addObject(Constants.CMD_VALUE,  new_cmd);
		
		paginationInfo.setTotalRecordCount(cmd.getTotal_record_count());
		mav.addObject("paginationInfo", paginationInfo);
		
		int total = 0;
		for(int i=0; i<new_cmd.getList().size(); i++){
			SalesCommand s_cmd = (SalesCommand) new_cmd.getList().get(i);
			if(!s_cmd.getStatus().equals("4")){
				if(s_cmd.getUsed_refund().equals("1")){
					total = total - Integer.parseInt(s_cmd.getPricewithcommission());
				} else {
					total = total + Integer.parseInt(s_cmd.getPricewithcommission());
				}
			}
		}	
		
		PaypalPaymentCommand _cmd = new PaypalPaymentCommand();
		_cmd.setStart_date(from_date);
		_cmd.setEnd_date(to_date);
		PaypalPaymentService _service = (PaypalPaymentService) ApplicationHelper.getService("paypalpaymentService", req.getSession().getServletContext());
		PaypalPaymentCommand p_cmd = _service.getListByDate(_cmd, req, res);
		mav.addObject("payment_list",p_cmd);
		
		int total_payment = 0;
		for(int j=0; j<p_cmd.getList().size(); j++){
			PaypalPaymentCommand my_pp = (PaypalPaymentCommand) p_cmd.getList().get(j);
			total_payment = total_payment + Integer.parseInt(my_pp.getAmount());
		}
		
		mav.addObject("total", total);
		mav.addObject("total_payment", total_payment);
		
		double ce_share = (total/1.2) + (total_payment*0.8);
		double et_share = (total - (total/1.2)) + (total_payment*0.2);
		
		mav.addObject("ce_share", ce_share);
		mav.addObject("et_share", et_share);
		return mav;
	}
	
}