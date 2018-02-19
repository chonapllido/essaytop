package stm.com.program.order.web;

import java.io.FileNotFoundException;
import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import egovframework.com.cmm.service.EgovProperties;
import stm.com.generic.web.GenericController;
import stm.com.program.ceorder.service.CeOrderService;
import stm.com.program.ceorder.web.CeOrderCommand;
import stm.com.program.order.essay.service.OrderEssayService;
import stm.com.program.order.essay.web.OrderEssayCommand;
import stm.com.program.order.revision.service.OrderRevisionService;
import stm.com.program.order.revision.web.OrderRevisionCommand;
import stm.com.program.order.service.OrderService;
import stm.com.program.user.service.UserService;
import stm.com.program.user.web.UserCommand;
import stm.com.support.fileio.FileCommand;
import stm.com.support.fileio.FileMngUtil;
import stm.com.support.mail.MailCommand;
import stm.com.support.mail.MailController;
import stm.com.support.util.ApplicationHelper;


@Controller
@RequestMapping("/back/order")
public class OrderController extends GenericController<OrderService, OrderCommand> {

	MailController mailControl;
	
	@Override
	public ModelAndView list(OrderCommand cmd, HttpServletRequest req, HttpServletResponse res) throws Exception{
	
		ModelAndView mav = super.list(cmd, req, res);
		
		// cancel overdue orders
		cancelUnpaidOrders(req, res);
		
		return mav;
	}
	
	@RequestMapping(value="/updateStatus.do", method=RequestMethod.GET, produces="text/plain")
	@ResponseBody
	public void updateStatus(HttpServletRequest req, HttpServletResponse res) throws Exception{
		
		String type = req.getParameter("type");
		String order_id = req.getParameter("order_id");
		String status = req.getParameter("status");
		String email = req.getParameter("email");
		String action = req.getParameter("do");
		String topic = req.getParameter("topic");
		String result = (req.getParameterMap().containsKey("result")) ? req.getParameter("result") : "";
		
		OrderCommand cmd = new OrderCommand();
		cmd.setCe_order_id(order_id);
		cmd.setStatus(status);
		
		OrderService service = getService();
		service.updateStatus(cmd, req, res);
		
		// email user 
		MailCommand mail = new MailCommand();
		mail.setFromName("EssayTop");
		mail.setSendFrom("essaytopp@gmail.com");
		mail.setSendTo(email);
	
		if(action.equals("finish")){
			String filePath = EgovProperties.getProperty("Globals.orderFilesPath") + "/results/" + type.toLowerCase() + "/" + result;
			String message =  "Dear customer,\n\nAttached is your order "+order_id+" from EssayTop for the topic: "+topic+".\nIf you have questions, you may email us at essaytopp@gmail.com.\n\nBest Regards,\nEssayTop\r\n\r\n";
			mail.setSubject("Essaytop Submission of Order "+order_id);
			mail.setMessage(message);;
			mailControl.sendMailAttach(mail, filePath);
			
		}
	}
	
	@RequestMapping(value="/downloadResult.do", method=RequestMethod.POST)
	public void downloadResult(HttpServletRequest req, HttpServletResponse res) throws Exception{
		
		String fileName = req.getParameter("result");
		String type = req.getParameter("type_id");
		String folderDest = "/results/";
		
		FileCommand cmd = new FileCommand();
		cmd.setNew_name(fileName);
		cmd.setOrig_name(fileName);
		
		if(type.equals("1")){
			folderDest += "essay/";
		} else {
			folderDest += "revision/";
		}
		
		FileMngUtil fileUtil = new FileMngUtil();
		fileUtil.downloadFile(cmd, folderDest, req, res);
	}
	
	@RequestMapping(value="/downloadFile.do", method=RequestMethod.POST)
	public void downloadFile(HttpServletRequest req, HttpServletResponse res) throws Exception{
		
		String fileNameOrig = req.getParameter("file");
		String fileNameNew 	= req.getParameter("file_upload");
		String type = req.getParameter("type_id");
		String folderDest = "/uploads/";
		
		FileCommand cmd = new FileCommand();
		cmd.setNew_name(fileNameNew);
		cmd.setOrig_name(fileNameOrig);
		
		if(type.equals("1")){
			folderDest += "essay/";
		} else {
			folderDest += "revision_upload/";
		}
		
		FileMngUtil fileUtil = new FileMngUtil();
		fileUtil.downloadFile(cmd, folderDest, req, res);
	}
	
	private void cancelUnpaidOrders(HttpServletRequest req, HttpServletResponse res) throws Exception{
		
		OrderCommand cmd = new OrderCommand();
		OrderService service = getService();
		service.cancelUnpaidOrder(cmd, req, res);
		
		OrderEssayCommand essay_cmd = new OrderEssayCommand();
		OrderEssayService essay_service = (OrderEssayService) ApplicationHelper.getService("orderessayService", req.getSession().getServletContext());
		essay_service.cancelUnpaidOrder(essay_cmd, req, res);
		
		OrderRevisionCommand rev_cmd = new OrderRevisionCommand();
		OrderRevisionService rev_service = (OrderRevisionService) ApplicationHelper.getService("orderrevisionService", req.getSession().getServletContext());
		rev_service.cancelUnpaidOrder(rev_cmd, req, res);
		
		CeOrderCommand ce_cmd = new CeOrderCommand();
		CeOrderService ce_service = (CeOrderService) ApplicationHelper.getService("ceorderService", req.getSession().getServletContext());
		ce_service.cancelUnpaidOrder(ce_cmd, req, res);
	}
}