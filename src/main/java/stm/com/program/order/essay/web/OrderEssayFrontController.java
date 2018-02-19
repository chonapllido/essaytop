package stm.com.program.order.essay.web;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.support.SessionStatus;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.ModelAndViewDefiningException;

import egovframework.com.cmm.service.EgovProperties;

import java.io.FileNotFoundException;
import java.io.IOException;
import java.util.Calendar;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import stm.com.generic.web.GenericController;
import stm.com.program.category.service.CategoryService;
import stm.com.program.category.web.CategoryCommand;
import stm.com.program.ceorder.service.CeOrderService;
import stm.com.program.ceorder.web.CeOrderCommand;
import stm.com.program.level.service.LevelService;
import stm.com.program.level.web.LevelCommand;
import stm.com.program.login.web.LoginCommand;
import stm.com.program.order.essay.service.OrderEssayService;
import stm.com.program.order.essay.web.OrderEssayCommand;
import stm.com.program.order.service.OrderService;
import stm.com.program.order.web.OrderCommand;
import stm.com.program.priceessay.service.PriceEssayService;
import stm.com.program.priceessay.web.PriceEssayCommand;
import stm.com.program.priceresearch.service.PriceResearchService;
import stm.com.program.priceresearch.web.PriceResearchCommand;
import stm.com.program.readmaterial.service.ReadMaterialService;
import stm.com.program.readmaterial.web.ReadMaterialCommand;
import stm.com.program.user.service.UserService;
import stm.com.program.user.web.UserCommand;
import stm.com.program.writingformat.service.WritingFormatService;
import stm.com.program.writingformat.web.WritingFormatCommand;
import stm.com.support.fileio.FileMngUtil;
import stm.com.support.mail.MailController;
import stm.com.support.util.ApplicationHelper;

@Controller
@RequestMapping("/front/order/essay")
public class OrderEssayFrontController extends GenericController<OrderEssayService, OrderEssayCommand> {

	@Override
	public ModelAndView insert(OrderEssayCommand cmd, HttpServletRequest req, HttpServletResponse res) throws Exception {

		double commission = 0.20;
		String default_days = "10"; //default deadline

		ModelAndView mav = super.insert(cmd, req, res);
		PriceEssayService price_service = (PriceEssayService) ApplicationHelper.getService("priceessayService", req.getSession().getServletContext());
		
		LoginCommand login_cmd = getUserLogin(req, res);
		if (login_cmd == null) {
			ModelAndView modelAndView = new ModelAndView("redirect:/front/main.do");
			throw new ModelAndViewDefiningException(modelAndView);
		}
		
		CategoryCommand category_cmd = new CategoryCommand();
		CategoryService category_service = (CategoryService) ApplicationHelper.getService("categoryService", req.getSession().getServletContext());
		mav.addObject("category_list", category_service.getList(category_cmd, req, res));
		
		WritingFormatCommand format_cmd = new WritingFormatCommand();
		WritingFormatService format_service = (WritingFormatService) ApplicationHelper.getService("writingformatService", req.getSession().getServletContext());
		mav.addObject("format_list", format_service.getList(format_cmd, req, res));
		
		LevelCommand level_cmd = new LevelCommand();
		LevelService level_service = (LevelService) ApplicationHelper.getService("levelService", req.getSession().getServletContext());
		mav.addObject("level_list", level_service.getList(level_cmd, req, res));
		
		PriceEssayCommand price_cmd = new PriceEssayCommand();
		price_cmd.setDays(default_days);
		int temp_maxpage = price_service.getMaxPage(price_cmd, req, res);
		int maxpage = (temp_maxpage == 0) ? 40 : temp_maxpage;
		int min_days = price_service.getMinimumDays(price_cmd, req, res);
		
		mav.addObject("maxpage", maxpage);
		mav.addObject("words", price_service.getMinWords(price_cmd, req, res));
		mav.addObject("min_days", min_days);
		
		ReadMaterialCommand material_cmd = new ReadMaterialCommand();
		ReadMaterialService material_service = (ReadMaterialService) ApplicationHelper.getService("readmaterialService", req.getSession().getServletContext());
		ReadMaterialCommand new_material_cmd = material_service.getList(material_cmd, req, res);
		String pages = "0", price = "0", free_pages = "0", has_free = "0";
		List<ReadMaterialCommand> myList = (List<ReadMaterialCommand>) new_material_cmd.getList();
		
		for(int i=0; i<myList.size(); i++){
			ReadMaterialCommand myCmd = (ReadMaterialCommand) myList.get(i);
			
			if(myCmd.getPrice().equals("0")){
				free_pages = myCmd.getPages();
				has_free = "1";
			}
			if(myCmd.getDays().equals(default_days)){
				pages = myCmd.getPages();
				price = myCmd.getPrice();
			}
		}
		if(pages == "0"){
			ReadMaterialCommand myCurCmd = (ReadMaterialCommand) myList.get(myList.size()-1);
			pages = myCurCmd.getPages();
			price = myCurCmd.getPrice();
		}
		
		mav.addObject("has_free", has_free);
		mav.addObject("free_pages", free_pages);
		mav.addObject("pages", pages);
		mav.addObject("price", price);
		
		OrderCommand order_cmd = new OrderCommand();
		OrderService order_service = (OrderService) ApplicationHelper.getService("orderService", req.getSession().getServletContext());
		order_cmd.setUser_id(login_cmd.getUser_id());
		order_cmd.setUser_email(login_cmd.getEmail());
		int hasorder = order_service.isFirstOrder(order_cmd, req, res);
		mav.addObject("hasorder", hasorder);
		
		// Set deadline of order
		Date now = new Date();
		Calendar c = Calendar.getInstance();
		c.setTime(now);
		c.add(Calendar.DATE, Integer.parseInt(default_days));
		Date deadline = c.getTime();
		mav.addObject("deadline", deadline);
		
		// set initial total price
		double total = 0;
		double pricewithcommission = 0;
		if(hasorder != 0){
			total = price_service.getPriceByDays(Integer.parseInt(default_days), req, res);
			// add 1 with or without citation
			total = total + 1;
			pricewithcommission = total + (total * commission);
			
		}
		mav.addObject("total", total);
		mav.addObject("pricewithcommission", pricewithcommission);
		
		// get default price 
		PriceEssayCommand default_price_cmd = new PriceEssayCommand();
		default_price_cmd.setSpecial("0");
		PriceEssayCommand default_price = price_service.getDefaultPrice(default_price_cmd, req, res);
		
		mav.addObject("default_days", default_price.getDays());
		mav.addObject("default_price", default_price.getPrice());
		
		return mav;
	}
	
	@RequestMapping(value = "/review.do", method = RequestMethod.POST)
	public ModelAndView review(OrderEssayCommand cmd, final MultipartHttpServletRequest multireq, HttpServletRequest req, HttpServletResponse res, SessionStatus status, BindingResult bindingResult) throws FileNotFoundException, IOException, Exception {
	
		ModelAndView mav = new ModelAndView();
		mav.setViewName("/front/order/essay/review");
		
		String oth_format = req.getParameter("etc_format");
		mav.addObject("deldate", req.getParameter("deldate"));
		mav.addObject("materials_text", req.getParameter("materials_text"));
		mav.addObject("price", req.getParameter("price"));

		if(oth_format != null && !oth_format.equals("")){
			cmd.setFormat(oth_format);
		}
		HashMap<String, String> _result = new HashMap<String, String>(); 
		
		FileMngUtil fileUtil = new FileMngUtil();
		Map<String, MultipartFile> files = multireq.getFileMap();
		if (!files.isEmpty()) {
			_result = fileUtil.parseFileInf(files, "/uploads/essay/");
			cmd.setFile(_result.get("originFileNameList"));
			cmd.setFile_upload(_result.get("newFileNameList"));
		} 

		return mav;
	}
	
	@Override
	public String insert(OrderEssayCommand cmd, final MultipartHttpServletRequest multireq, HttpServletRequest req, HttpServletResponse res, SessionStatus status, BindingResult bindingResult) throws FileNotFoundException, IOException, Exception {
		
		LoginCommand login_cmd = getUserLogin(req, res);
		
		CeOrderCommand ce_cmd = new CeOrderCommand();
		CeOrderService ce_service = (CeOrderService) ApplicationHelper.getService("ceorderService", req.getSession().getServletContext());
		ce_cmd.setUser_id("1195"); //user id of essaytop in cebuessay
		ce_cmd.setUser_email(EgovProperties.getProperty("Globals.essaytopAdminEmail"));
		ce_cmd.setType_id("1"); // 1 for Essay
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
		_cmd.setType_id("1"); // 1 for Essay
		_cmd.setTotal_payment(cmd.getTotal_payment());
		_cmd.setDays(cmd.getDays());
		_cmd.setEnd_date(cmd.getEnd_date());
		_cmd.setStatus("1");
		_cmd.setSubtotal(cmd.getTotal_payment());
		_cmd.setPricewithcommission(cmd.getPricewithcommission());
		_service.insert(_cmd, req, res);
			
		
		cmd.setUser_id("1195");
		cmd.setOrder_id(ce_cmd.getOrder_id());
		cmd.setRead_material(req.getParameter("materials_text"));
		super.insert(cmd, multireq, req, res, status, bindingResult);
		
		// send order notice email
		MailController mailUtil = new MailController();
		mailUtil.sendOrderNotice(_cmd, cmd.getTopic());
		
		return "redirect:/front/order/essay/confirm.do?oid="+ce_cmd.getOrder_id()+"&tot="+cmd.getPricewithcommission();
	
	}
	
	@Override
	public ModelAndView view(OrderEssayCommand cmd, HttpServletRequest req, HttpServletResponse res) throws Exception {
	
		LoginCommand login_cmd = getUserLogin(req, res);
		if (login_cmd == null) {
			ModelAndView modelAndView = new ModelAndView("redirect:/front/main.do");
			throw new ModelAndViewDefiningException(modelAndView);
		}
		
		ModelAndView mav = super.view(cmd, req, res);
		
		OrderEssayService service = (OrderEssayService) ApplicationHelper.getService("orderessayService", req.getSession().getServletContext());
		OrderEssayCommand order_cmd = service.getView(cmd, req, res);
		
		Date now = new Date();
		Calendar c = Calendar.getInstance();
		c.setTime(now);
		c.add(Calendar.DATE, Integer.parseInt(order_cmd.getDays()));
		Date deadline = c.getTime();
		mav.addObject("deadline", deadline);
		
		return mav;
	}
	
	@RequestMapping(value="/confirm.do", method=RequestMethod.GET)
	public ModelAndView confirm(OrderEssayCommand cmd, HttpServletRequest req, HttpServletResponse res)throws Exception {
		
		ModelAndView mav = new ModelAndView();
		mav.setViewName("/front/order/essay/confirm");
		
		mav.addObject("order_id", req.getParameter("oid"));
		mav.addObject("total_payment", req.getParameter("tot"));
	
		return mav;
	}
	
	@RequestMapping(value="/updateDeadlineSelect.do", method=RequestMethod.GET)
	public ModelAndView updateDeadline(PriceEssayCommand cmd, HttpServletRequest req, HttpServletResponse res) throws Exception {
		
		String category = req.getParameter("category");
		ModelAndView mav = new ModelAndView();
		mav.setViewName("/front/order/essay/deadline_options");
		
		PriceEssayService service = (PriceEssayService) ApplicationHelper.getService("priceessayService", req.getSession().getServletContext());
		int min_days = service.getMinimumDays(cmd, req, res);
		
		mav.addObject("category_type", category);
		mav.addObject("min_days", min_days);
		
		return mav;
	}
	
	@SuppressWarnings("unchecked")
	@RequestMapping(value="/updateMaterialSelect.do", method=RequestMethod.GET)
	public ModelAndView updateDeadline(ReadMaterialCommand cmd, HttpServletRequest req, HttpServletResponse res) throws Exception {
		
		String days = req.getParameter("days");
		String selected = req.getParameter("selected");
		
		ModelAndView mav = new ModelAndView();
		mav.setViewName("/front/order/essay/readmaterial_options");
		
		ReadMaterialService service = (ReadMaterialService) ApplicationHelper.getService("readmaterialService", req.getSession().getServletContext());
		ReadMaterialCommand list = service.getList(cmd, req, res);
		
		String pages = "0", price = "0", free_pages = "0", has_free = "0";
		List<ReadMaterialCommand> myList = (List<ReadMaterialCommand>) list.getList();
		
		for(int i=0; i<myList.size(); i++){
			ReadMaterialCommand myCmd = (ReadMaterialCommand) myList.get(i);
			
			if(myCmd.getPrice().equals("0")){
				free_pages = myCmd.getPages();
				has_free = "1";
			}
			if(myCmd.getDays().equals(days)){
				pages = myCmd.getPages();
				price = myCmd.getPrice();
			}
		}
		
		if(pages == "0"){
			ReadMaterialCommand myCurCmd = (ReadMaterialCommand) myList.get(myList.size()-1);
			pages = myCurCmd.getPages();
			price = myCurCmd.getPrice();
		}
		
		mav.addObject("has_free", has_free);
		mav.addObject("free_pages", free_pages);
		mav.addObject("pages", pages);
		mav.addObject("price", price);
		mav.addObject("selected", selected);
		
		return mav;
	}
	
	@RequestMapping(value="/checkMaxPage.do", method=RequestMethod.GET, produces="text/plain")
	@ResponseBody
	public String checkMaxPage(HttpServletRequest req, HttpServletResponse res) throws Exception{
		String days = req.getParameter("days");
		String etype = req.getParameter("etype");
		
		PriceEssayCommand price_cmd = new PriceEssayCommand();
		PriceEssayService price_service = (PriceEssayService) ApplicationHelper.getService("priceessayService", req.getSession().getServletContext());
		PriceResearchCommand research_cmd = new PriceResearchCommand();
		PriceResearchService research_service = (PriceResearchService) ApplicationHelper.getService("priceresearchService", req.getSession().getServletContext());
		int words = price_service.getMinWords(price_cmd, req, res);
		int maxpage = 0;
		
		if(etype == "research"){
			research_cmd.setDays(days);
			maxpage = research_service.getMaxPage(research_cmd, req, res);
		} else {
			price_cmd.setDays(days);
			maxpage = price_service.getMaxPage(price_cmd, req, res);
		}
		
		return maxpage+"&words="+words;
		
	}
	
	@RequestMapping(value="/calculatePrice.do", method=RequestMethod.GET, produces="text/plain")
	@ResponseBody
	public String calculatePrice(HttpServletRequest req, HttpServletResponse res) throws Exception{
		
		String days = req.getParameter("days");
		String user_price = req.getParameter("user_price");

		
		PriceEssayCommand price_cmd = new PriceEssayCommand();
		PriceEssayService price_service = (PriceEssayService) ApplicationHelper.getService("priceessayService", req.getSession().getServletContext());
		price_cmd.setDays(days);
		price_cmd.setSpecial(user_price);
		
		String price = price_service.getDefaultPriceByDays(price_cmd, req, res);
		
		return price;
		
	}
	
	private LoginCommand getUserLogin(HttpServletRequest req, HttpServletResponse res) throws Exception{
		
		LoginCommand cmd = (LoginCommand) req.getSession().getAttribute("loginUser");
		
		return cmd;
	}
	
}