package stm.com.program.ceorder.service.impl;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Service;

import stm.com.generic.service.impl.GenericServiceImpl;
import stm.com.program.ceorder.service.CeOrderService;
import stm.com.program.ceorder.web.CeOrderCommand;

@Service("ceorderService")
public class CeOrderServiceImpl extends GenericServiceImpl<CeOrderDao, CeOrderCommand> implements CeOrderService {

	public int updateStatus(CeOrderCommand cmd, HttpServletRequest req, HttpServletResponse res) throws Exception{
		
		 CeOrderDao dao = getDao();
		 return dao.updateStatus(cmd);
	}
	
	public int cancelUnpaidOrder(CeOrderCommand cmd, HttpServletRequest req, HttpServletResponse res) throws Exception{
		
		 CeOrderDao dao = getDao();
		 return dao.cancelUnpaidOrder(cmd);
	}
}
