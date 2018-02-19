package stm.com.program.order.service.impl;

import java.util.List;

import stm.com.generic.service.impl.GenericDao;
import stm.com.program.order.web.OrderCommand;

public interface OrderDao extends GenericDao<OrderCommand> {
	
	public int isFirstOrder(OrderCommand cmd);
	
	public int updateStatus(OrderCommand cmd);
	
	public int cancelUnpaidOrder(OrderCommand cmd);
	
	public int getListByUserCount(OrderCommand cmd);
	
	public List<OrderCommand> getListByUser(OrderCommand cmd);
	
}
