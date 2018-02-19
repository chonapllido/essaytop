package stm.com.program.paypal.payment.service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import stm.com.generic.service.GenericService;
import stm.com.program.paypal.payment.web.PaypalPaymentCommand;

public interface PaypalPaymentService extends GenericService<PaypalPaymentCommand> {
	
	public PaypalPaymentCommand getListByDate(PaypalPaymentCommand cmd, HttpServletRequest req, HttpServletResponse res) throws Exception;
}
