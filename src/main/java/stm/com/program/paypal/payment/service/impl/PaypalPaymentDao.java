package stm.com.program.paypal.payment.service.impl;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import stm.com.generic.service.impl.GenericDao;
import stm.com.program.paypal.payment.web.PaypalPaymentCommand;

public interface PaypalPaymentDao extends GenericDao<PaypalPaymentCommand> {
	
	public List<PaypalPaymentCommand> getListByDate(PaypalPaymentCommand cmd);
	
}
