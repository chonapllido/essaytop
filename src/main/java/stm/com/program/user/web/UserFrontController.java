package stm.com.program.user.web;

import java.io.FileNotFoundException;
import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.support.SessionStatus;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.ModelAndViewDefiningException;
import org.springmodules.validation.commons.DefaultBeanValidator;

import egovframework.com.utl.sim.service.EgovFileScrty;
import egovframework.rte.fdl.property.EgovPropertyService;
import egovframework.rte.ptl.mvc.tags.ui.pagination.PaginationInfo;
import stm.com.generic.web.GenericController;
import stm.com.program.ceorder.service.CeOrderService;
import stm.com.program.ceorder.web.CeOrderCommand;
import stm.com.program.login.web.LoginCommand;
import stm.com.program.order.essay.service.OrderEssayService;
import stm.com.program.order.essay.web.OrderEssayCommand;
import stm.com.program.order.revision.service.OrderRevisionService;
import stm.com.program.order.revision.web.OrderRevisionCommand;
import stm.com.program.order.service.OrderService;
import stm.com.program.order.web.OrderCommand;
import stm.com.program.user.service.UserService;
import stm.com.support.mail.MailCommand;
import stm.com.support.mail.MailController;
import stm.com.support.util.ApplicationHelper;
import stm.com.sys.Constants;


@Controller
@RequestMapping("/front/user")
public class UserFrontController extends GenericController<UserService, UserCommand> {

	@Autowired
	private EgovPropertyService propertyService;
	private MailController mailUtil = new MailController();
	
	@Autowired
	private DefaultBeanValidator beanValidator;
	
	@RequestMapping(value="/signup/step1.do", method=RequestMethod.GET)
	public ModelAndView signupStep1(UserCommand cmd, HttpServletRequest req, HttpServletResponse res) throws Exception{
		
		ModelAndView mav = new ModelAndView();
		mav.setViewName("/front/user/signup_step1");
		
		return mav;
	}
	
	@RequestMapping(value="/signup/step2.do", method=RequestMethod.GET)
	public ModelAndView signupStep2(UserCommand cmd, HttpServletRequest req, HttpServletResponse res) throws Exception{
		
		ModelAndView mav = new ModelAndView();
		mav.setViewName("/front/user/signup_step2");
		
		return mav;
	}
	
	@RequestMapping(value="/signup/step3.do", method=RequestMethod.GET)
	public ModelAndView signupStep3(UserCommand cmd, HttpServletRequest req, HttpServletResponse res) throws Exception{
		
		ModelAndView mav = new ModelAndView();
		mav.setViewName("/front/user/signup_step3");
		
		return mav;
	}
	@SuppressWarnings("deprecation")
	@Override 
	public String insert(UserCommand cmd, final MultipartHttpServletRequest multireq, HttpServletRequest req, HttpServletResponse res, SessionStatus status, BindingResult bindingResult) throws FileNotFoundException, IOException, Exception {
		
		cmd.setUser_pass(EgovFileScrty.encryptPassword(cmd.getPassword()));
		
		beanValidator.validate(cmd, bindingResult); // validation 수행
		if (bindingResult.hasErrors()) { // 만일 validation 에러가 있으면...
			return redirectCallback("validator");
		}

		getService().insert(cmd, req, res);
	
		return "redirect:/front/user/signup/step3.do";
	}
	
	@RequestMapping(value = "/idcheck.do", method = RequestMethod.POST, produces="text/plain")
	@ResponseBody
	public String checkIdDplct(HttpServletRequest req, HttpServletResponse res) throws Exception {

		String user_login = (String) req.getParameter("user_login");
		String id = (String) req.getParameter("user_id");
		
		UserCommand cmd = new UserCommand();
		cmd.setUser_login(user_login);
		cmd.setId(id);
		
		int usedCnt;

		if (user_login == null || user_login.equals("")) {
			usedCnt = -1;
		} else {
			UserService userService = (UserService) ApplicationHelper.getService("userService", req.getSession().getServletContext());
			usedCnt = userService.checkEmailDuplicate(cmd, req, res);
		}
		
		return usedCnt+"";
	}
	
	@RequestMapping(value="/login.do", method=RequestMethod.GET)
	public ModelAndView login(UserCommand cmd, HttpServletRequest req, HttpServletResponse res) throws Exception{
		
		ModelAndView mav = new ModelAndView();
		mav.setViewName("/front/user/login");
		
		return mav;
	}
	
	@RequestMapping(value="/login.do", method=RequestMethod.POST)
	public String loginPost(UserCommand cmd, HttpServletRequest req, HttpServletResponse res) throws Exception{
		
		String url = "/front/main.do";
		
		UserService service = getService();
		UserCommand user = service.getLogin(cmd, req, res);
		
		if (user == null) {
			url = "/front/user/login.do?fail=Y"; 
			return "redirect:"+url;
		}
		
		LoginCommand loginUser = new LoginCommand();
		loginUser.setUser_login(user.getUser_email());
		loginUser.setId(user.getId());
		loginUser.setUser_id(user.getId());
		loginUser.setPosition_id(user.getPosition_id());
		loginUser.setEmail(user.getUser_email());
		
		req.getSession().setAttribute("loginUser", loginUser);
		
		return "redirect:"+url;
	}
	
	@RequestMapping(value="/logout.do")
	public String doLogout(HttpServletRequest req, HttpServletResponse res) throws Exception{
		
		req.getSession().setAttribute("loginUser", null);
		return "redirect:/front/main.do";
	}
	
	@RequestMapping(value="/mypage.do")
	public ModelAndView mypage(OrderCommand cmd, HttpServletRequest req, HttpServletResponse res) throws Exception{
		
		ModelAndView mav = new ModelAndView();
		mav.setViewName("/front/user/mypage");
		
		LoginCommand login_cmd = getUserLogin(req, res);
		if (login_cmd == null) {
			ModelAndView modelAndView = new ModelAndView("redirect:/front/main.do");
			throw new ModelAndViewDefiningException(modelAndView);
		}
		
		OrderService order_service = (OrderService) ApplicationHelper.getService("orderService", req.getSession().getServletContext());
		cmd.setUser_id(login_cmd.getUser_id());
		cmd.setTotal_record_count(order_service.getListByUserCount(cmd, req, res));
		
		/** cancel unpaid orders **/
		cancelUnpaidOrders(req, res);
		
		/** paging setting */
		cmd.setPage_use_at("Y");
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
		paginationInfo.setTotalRecordCount(cmd.getTotal_record_count());
		cmd.setFirst_index(paginationInfo.getFirstRecordIndex());
		cmd.setLast_index(paginationInfo.getLastRecordIndex());
		cmd.setRecord_count_per_page(paginationInfo.getRecordCountPerPage());
		
		UserCommand user_cmd = new UserCommand();
		user_cmd.setId(login_cmd.getUser_id());
		UserService service = getService();
	
		mav.addObject(Constants.CMD_VALUE, order_service.getListByUser(cmd, req, res));
		mav.addObject("virtual_money", service.getUserVm(user_cmd, req, res).getVirtual_money());
		mav.addObject("paginationInfo", paginationInfo);
		
		return mav;
		
	}
	
	@RequestMapping(value="/forgot_password.do", method=RequestMethod.GET)
	public ModelAndView forgotpwd(UserCommand cmd, HttpServletRequest req, HttpServletResponse res) throws Exception{
		
		ModelAndView mav = new ModelAndView();
		mav.setViewName("/front/user/forgot_password");
		
		return mav;
	}
	
	@RequestMapping(value="/forgot_password.do", method=RequestMethod.POST)
	public ModelAndView forgotpwdPost(UserCommand cmd, HttpServletRequest req, HttpServletResponse res) throws Exception{
		
		ModelAndView mav = new ModelAndView();
		mav.setViewName("/front/user/forgot_password_msg");
		
		UserCommand login = getService().getPassword(cmd, req, res);
		String password = login.getPassword();
		String found = "no";

		if(password != null && !password.isEmpty()){
			MailCommand mail = new MailCommand();
			mail.setFromName("Essaytop");
			mail.setSendFrom("essaytopp@gmail.com");
			mail.setSendTo(cmd.getEmail());
			mail.setSubject("Essaytop Password");

			String message = "Your Essaytop password is:\n\n"+password+"\n\n";
			message += "Best Regards,\nEssaytop";
			mail.setMessage(message);
			mailUtil.sendMail(mail);

			found = "yes";
		}
		mav.addObject("found", found);
		
		return mav;
	}
	
	private void cancelUnpaidOrders(HttpServletRequest req, HttpServletResponse res) throws Exception{
		
		OrderCommand cmd = new OrderCommand();
		OrderService service = (OrderService) ApplicationHelper.getService("orderService", req.getSession().getServletContext());
		service.cancelUnpaidOrder(cmd, req, res);
		
		CeOrderCommand ce_cmd = new CeOrderCommand();
		CeOrderService ce_service = (CeOrderService) ApplicationHelper.getService("ceorderService", req.getSession().getServletContext());
		ce_service.cancelUnpaidOrder(ce_cmd, req, res);
		
		OrderEssayCommand essay_cmd = new OrderEssayCommand();
		OrderEssayService essay_service = (OrderEssayService) ApplicationHelper.getService("orderessayService", req.getSession().getServletContext());
		essay_service.cancelUnpaidOrder(essay_cmd, req, res);
		
		OrderRevisionCommand rev_cmd = new OrderRevisionCommand();
		OrderRevisionService rev_service = (OrderRevisionService) ApplicationHelper.getService("orderrevisionService", req.getSession().getServletContext());
		rev_service.cancelUnpaidOrder(rev_cmd, req, res);
	}
	
	private LoginCommand getUserLogin(HttpServletRequest req, HttpServletResponse res) throws Exception{
		
		LoginCommand cmd = (LoginCommand) req.getSession().getAttribute("loginUser");
		
		return cmd;
	}
}