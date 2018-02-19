package stm.com.program.order.revision.web;

import java.io.File;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;
import java.util.Scanner;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.support.SessionStatus;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.ModelAndViewDefiningException;

import egovframework.com.cmm.service.EgovProperties;
import stm.com.generic.web.GenericController;
import stm.com.program.ceorder.service.CeOrderService;
import stm.com.program.ceorder.web.CeOrderCommand;
import stm.com.program.level.service.LevelService;
import stm.com.program.level.web.LevelCommand;
import stm.com.program.login.web.LoginCommand;
import stm.com.program.order.essay.service.OrderEssayService;
import stm.com.program.order.essay.web.OrderEssayCommand;
import stm.com.program.order.revision.web.OrderRevisionCommand;
import stm.com.program.order.revision.service.OrderRevisionService;
import stm.com.program.order.service.OrderService;
import stm.com.program.order.web.OrderCommand;
import stm.com.program.pricerevision.service.PriceRevisionService;
import stm.com.program.pricerevision.web.PriceRevisionCommand;
import stm.com.program.user.service.UserService;
import stm.com.program.user.web.UserCommand;
import stm.com.support.fileio.FileMngUtil;
import stm.com.support.mail.MailController;
import stm.com.support.util.ApplicationHelper;

@Controller
@RequestMapping("/front/order/revision")
public class OrderRevisionFrontController extends GenericController<OrderRevisionService, OrderRevisionCommand> {


	@Override
	public ModelAndView insert(OrderRevisionCommand cmd, HttpServletRequest req, HttpServletResponse res) throws Exception {
	
		LoginCommand login_cmd = getUserLogin(req, res);
		if (login_cmd == null) {
			ModelAndView modelAndView = new ModelAndView("redirect:/front/main.do");
			throw new ModelAndViewDefiningException(modelAndView);
		}
		
		ModelAndView mav = super.insert(cmd, req, res);
		String default_days = "5"; // default deadline
		
		LevelCommand level_cmd = new LevelCommand();
		LevelService level_service = (LevelService) ApplicationHelper.getService("levelService", req.getSession().getServletContext());
		mav.addObject("level_list", level_service.getList(level_cmd, req, res));
		
		PriceRevisionCommand price_cmd = new PriceRevisionCommand();
		PriceRevisionService price_service = (PriceRevisionService) ApplicationHelper.getService("pricerevisionService", req.getSession().getServletContext());
		price_cmd.setDays(default_days);
		mav.addObject("min_days", price_service.getMinimumDays(price_cmd, req, res));
		mav.addObject("words", price_service.getMinWords(price_cmd, req, res));
		
		PriceRevisionCommand price_list_cmd = price_service.getListOrderByDays(price_cmd, req, res);
		String prices = "";
		
		for(Object pcmd: price_list_cmd.getList()){
			PriceRevisionCommand prev_cmd = (PriceRevisionCommand) pcmd;
			if(!prices.equals("")){
				prices += ",";
			}
			prices += prev_cmd.getDays() + "-" + prev_cmd.getPrice();	
		}
		
		mav.addObject("prices", prices);
		
		// Set deadline of order
		Date now = new Date();
		Calendar c = Calendar.getInstance();
		c.setTime(now);
		c.add(Calendar.DATE, Integer.parseInt(default_days));
		Date deadline = c.getTime();
		mav.addObject("deadline", deadline);
		
		OrderCommand order_cmd = new OrderCommand();
		OrderService order_service = (OrderService) ApplicationHelper.getService("orderService", req.getSession().getServletContext());
		order_cmd.setUser_id(login_cmd.getUser_id());
		order_cmd.setUser_email(login_cmd.getEmail());
		int hasorder = (order_service.isFirstOrder(order_cmd, req, res) > 0) ? 1:0;
		mav.addObject("hasorder", hasorder);
	
		
		
		if(cmd.getTotal_payment() == "" || cmd.getTotal_payment() == null) cmd.setTotal_payment("0");
		
		String content = (req.getParameterMap().containsKey("content")) ? req.getParameter("content") : "";
		String no_words = (req.getParameterMap().containsKey("no_words")) ? req.getParameter("no_words") : "0";
		mav.addObject("content", content);
		mav.addObject("no_words", no_words);
	
		
		return mav;
	}
	
	@Override
	public String insert(OrderRevisionCommand cmd, final MultipartHttpServletRequest multireq, HttpServletRequest req, HttpServletResponse res, SessionStatus status, BindingResult bindingResult) throws FileNotFoundException, IOException, Exception {
		
		LoginCommand login_cmd = getUserLogin(req, res);
		
		CeOrderCommand ce_cmd = new CeOrderCommand();
		CeOrderService ce_service = (CeOrderService) ApplicationHelper.getService("ceorderService", req.getSession().getServletContext());
		ce_cmd.setUser_id("1195"); //user id of essaytop in cebuessay
		ce_cmd.setUser_email(EgovProperties.getProperty("Globals.essaytopAdminEmail"));
		ce_cmd.setType_id("2"); // 1 for Essay
		ce_cmd.setTotal_payment(cmd.getTotal_payment());
		ce_cmd.setDays(cmd.getDays());
		ce_cmd.setEnd_date(cmd.getEnd_date());
		ce_cmd.setStatus("1");
	
		ce_service.insert(ce_cmd, req, res);
		
		OrderCommand _cmd = new OrderCommand();
		OrderService _service = (OrderService) ApplicationHelper.getService("orderService", req.getSession().getServletContext());
		_cmd.setUser_id(cmd.getUser_id());
		_cmd.setCe_order_id(ce_cmd.getOrder_id());
		_cmd.setUser_email(login_cmd.getEmail());
		_cmd.setType_id("2"); // 1 for Essay
		_cmd.setTotal_payment(cmd.getTotal_payment());
		_cmd.setDays(cmd.getDays());
		_cmd.setEnd_date(cmd.getEnd_date());
		_cmd.setStatus("1");
		_cmd.setSubtotal(cmd.getTotal_payment());
		_cmd.setPricewithcommission(cmd.getPricewithcommission());
		_service.insert(_cmd, req, res);
		
		cmd.setUser_id("1195");
		cmd.setOrder_id(ce_cmd.getOrder_id());
		
		FileMngUtil fileUtil = new FileMngUtil();
		DateFormat dateFormat = new SimpleDateFormat("yyyyMMdd_HHmmss");
		Date date = new Date();
		String mydate = dateFormat.format(date);
		String newFileName = mydate + "_" + "revision.txt";
		fileUtil.createFile(req.getParameter("content"), "/uploads/revision/", newFileName);
		
		cmd.setFile(newFileName);
		super.insert(cmd, multireq, req, res, status, bindingResult);
		
		// send order notice email
		MailController mailUtil = new MailController();
		mailUtil.sendOrderNotice(_cmd, cmd.getTopic());
		
		return "redirect:/front/order/revision/confirm.do?oid="+ce_cmd.getOrder_id()+"&tot="+cmd.getPricewithcommission();
	
	}
	
	@RequestMapping(value = "/review.do", method = RequestMethod.POST)
	public ModelAndView review(OrderRevisionCommand cmd, final MultipartHttpServletRequest multireq, HttpServletRequest req, HttpServletResponse res, SessionStatus status, BindingResult bindingResult) throws FileNotFoundException, IOException, Exception {
	
		ModelAndView mav = new ModelAndView();
		mav.setViewName("/front/order/revision/review");
		
		mav.addObject("deldate", req.getParameter("deldaterev"));
		mav.addObject("content", req.getParameter("content"));
		mav.addObject("no_words", req.getParameter("no_words"));
		
		HashMap<String, String> _result = new HashMap<String, String>(); 
		
		/* FILE_UPLOAD = original file name (folder: uploads/revision_upload)
		 * FILE_UPLOAD_TMP = new file name of file_upload
		 * FILE	= file created from content input (folder: uploads/revision)
		 */
		
		FileMngUtil fileUtil = new FileMngUtil();
		Map<String, MultipartFile> files = multireq.getFileMap();
		if (!files.isEmpty()) {
			_result = fileUtil.parseFileInf(files, "/uploads/revision_upload/");
			cmd.setFile_upload(_result.get("originFileNameList"));
			cmd.setFile_upload_tmp(_result.get("newFileNameList"));
		} 
		
		return mav;
	}
	
	@Override
	public ModelAndView view(OrderRevisionCommand cmd, HttpServletRequest req, HttpServletResponse res) throws Exception {
	
		LoginCommand login_cmd = getUserLogin(req, res);
		if (login_cmd == null) {
			ModelAndView modelAndView = new ModelAndView("redirect:/front/main.do");
			throw new ModelAndViewDefiningException(modelAndView);
		}
		
		ModelAndView mav = super.view(cmd, req, res);
		
		OrderRevisionService service = getService();
		OrderRevisionCommand order_cmd = service.getView(cmd, req, res);
		
		Date now = new Date();
		Calendar c = Calendar.getInstance();
		c.setTime(now);
		c.add(Calendar.DATE, Integer.parseInt(order_cmd.getDays()));
		Date deadline = c.getTime();
		mav.addObject("deadline", deadline);
		
		String dir = EgovProperties.getProperty("Globals.orderFilesPath") + "/uploads/revision/"+order_cmd.getFile();
		String data = new Scanner(new File(dir)).useDelimiter("\\A").next();
		mav.addObject("content", data);
		
		return mav;
	}
	
	@RequestMapping(value = "/insertEdit.do", method=RequestMethod.POST)
	public ModelAndView insertEdit(OrderRevisionCommand cmd, HttpServletRequest req, HttpServletResponse res) throws Exception {
		
		ModelAndView mav = this.insert(cmd, req, res);
		return mav;
	
	}
	
	@RequestMapping(value="/confirm.do", method=RequestMethod.GET)
	public ModelAndView confirm(OrderRevisionCommand cmd, HttpServletRequest req, HttpServletResponse res)throws Exception {
		
		ModelAndView mav = new ModelAndView();
		mav.setViewName("/front/order/revision/confirm");
		
		mav.addObject("order_id", req.getParameter("oid"));
		mav.addObject("total_payment", req.getParameter("tot"));

		return mav;
	}
	
	private LoginCommand getUserLogin(HttpServletRequest req, HttpServletResponse res) throws Exception{
		
		LoginCommand cmd = (LoginCommand) req.getSession().getAttribute("loginUser");
		
		return cmd;
	}
}