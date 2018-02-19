package stm.com.program.order.service.impl;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.lang.StringUtils;
import org.springframework.stereotype.Service;

import stm.com.generic.service.impl.GenericServiceImpl;
import stm.com.program.order.service.OrderService;
import stm.com.program.order.web.OrderCommand;

@Service("orderService")
public class OrderServiceImpl extends GenericServiceImpl<OrderDao, OrderCommand> implements OrderService {

	public int isFirstOrder(OrderCommand cmd, HttpServletRequest req, HttpServletResponse res) throws Exception{
		
		OrderDao dao = getDao();
		return dao.isFirstOrder(cmd);
	}
	
	public int updateStatus(OrderCommand cmd, HttpServletRequest req, HttpServletResponse res) throws Exception{
		
		OrderDao dao = getDao();
		return dao.updateStatus(cmd);
	}
	
	public int cancelUnpaidOrder(OrderCommand cmd, HttpServletRequest req, HttpServletResponse res) throws Exception{
		
		OrderDao dao = getDao();
		return dao.cancelUnpaidOrder(cmd);
	}
	
	public int getListByUserCount(OrderCommand cmd, HttpServletRequest req, HttpServletResponse res) throws Exception{
		
		OrderDao dao = getDao();	
		return dao.getListByUserCount(cmd);
	}
	
	public OrderCommand getListByUser(OrderCommand cmd, HttpServletRequest req, HttpServletResponse res) throws Exception{
		
		OrderDao dao = getDao();	
		cmd.setList(dao.getListByUser(cmd));
		cmd.setTotal_record_count(cmd.getList().size());
		
		return cmd;
	}
	
}
