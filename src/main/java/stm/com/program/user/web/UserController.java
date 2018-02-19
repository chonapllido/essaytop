package stm.com.program.user.web;

import java.util.Calendar;

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
import stm.com.generic.web.GenericController;
import stm.com.program.user.service.UserService;
import stm.com.sys.Constants;

@Controller
@RequestMapping("/back/user")
public class UserController extends GenericController<UserService, UserCommand> {
	
	@Autowired
	private EgovPropertyService propertyService;
	
	@Override
	public ModelAndView list(UserCommand cmd, HttpServletRequest req, HttpServletResponse res) throws Exception{
		
		ModelAndView mav = super.list(cmd, req, res);
	
		return mav;
	}
	
	@RequestMapping(value="/register/figure.do", method=RequestMethod.GET)
	public ModelAndView registerFigureGet(UserCommand cmd, HttpServletRequest req, HttpServletResponse res) throws Exception{
		
		ModelAndView mav = new ModelAndView();
		mav.setViewName("/back/user/register/figure");
	
		Calendar now = Calendar.getInstance();
		int year = now.get(Calendar.YEAR);
		int month = now.get(Calendar.MONTH);
		now.set(year, month, 1);
		int week = now.get(Calendar.WEEK_OF_MONTH);
		
		mav.addObject("year", year);
		mav.addObject("month", month);
		mav.addObject("week", week);

		return mav;
	}
	
	@RequestMapping(value="/register/figure.do", method=RequestMethod.POST)
	public ModelAndView registerFigurePOST(UserCommand cmd, HttpServletRequest req, HttpServletResponse res) throws Exception{
		
		ModelAndView mav = new ModelAndView();
		mav.setViewName("/back/user/register/figure");
	
		Calendar now = Calendar.getInstance();
		int year = Integer.parseInt(req.getParameter("year").toString());
		int month = Integer.parseInt(req.getParameter("month").toString());
		now.set(year, month, 1);
		int week = now.get(Calendar.WEEK_OF_MONTH);
		
		mav.addObject("year", year);
		mav.addObject("month", month);
		mav.addObject("week", week);

		return mav;
	}
	
	@RequestMapping(value="/register/graph.do")
	public ModelAndView registerGraph(UserCommand cmd, HttpServletRequest req, HttpServletResponse res) throws Exception{
		
		ModelAndView mav = new ModelAndView();
		mav.setViewName("/back/user/register/graph");

		return mav;
	}
	
	@RequestMapping(value="/listvm.do")
	public ModelAndView listvm(UserCommand cmd, HttpServletRequest req, HttpServletResponse res) throws Exception{
		
		ModelAndView mav = new ModelAndView();
		mav.setViewName("/back/user/vm");
		
		UserCommand vm = getService().getUserWithVm(cmd, req, res);
		
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

		mav.addObject("paginationInfo", paginationInfo);
		
		mav.addObject(Constants.CMD_VALUE, vm);
		return mav;
	}
	
	
}