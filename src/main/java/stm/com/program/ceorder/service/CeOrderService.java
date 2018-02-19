package stm.com.program.ceorder.service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import stm.com.generic.service.GenericService;
import stm.com.program.ceorder.web.CeOrderCommand;

public interface CeOrderService extends GenericService<CeOrderCommand> {
	
	public int updateStatus(CeOrderCommand cmd, HttpServletRequest req, HttpServletResponse res) throws Exception;
	
	public int cancelUnpaidOrder(CeOrderCommand cmd, HttpServletRequest req, HttpServletResponse res) throws Exception;
}
