package stm.com.program.order.service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import stm.com.generic.service.GenericService;
import stm.com.program.order.essay.web.OrderEssayCommand;
import stm.com.program.order.web.OrderCommand;

public interface OrderService extends GenericService<OrderCommand> {

	public int isFirstOrder(OrderCommand cmd, HttpServletRequest req, HttpServletResponse res) throws Exception;
	
	public int updateStatus(OrderCommand cmd, HttpServletRequest req, HttpServletResponse res) throws Exception;

	public int cancelUnpaidOrder(OrderCommand cmd, HttpServletRequest req, HttpServletResponse res) throws Exception;
	
	public int getListByUserCount(OrderCommand cmd, HttpServletRequest req, HttpServletResponse res) throws Exception;
	
	public OrderCommand getListByUser(OrderCommand cmd, HttpServletRequest req, HttpServletResponse res) throws Exception;
	
}
