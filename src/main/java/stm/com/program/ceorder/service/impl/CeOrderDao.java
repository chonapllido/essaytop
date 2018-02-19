package stm.com.program.ceorder.service.impl;

import stm.com.generic.service.impl.GenericDao;
import stm.com.program.ceorder.web.CeOrderCommand;

public interface CeOrderDao extends GenericDao<CeOrderCommand> {
	
	public int updateStatus(CeOrderCommand cmd);
	
	public int cancelUnpaidOrder(CeOrderCommand cmd);
}
