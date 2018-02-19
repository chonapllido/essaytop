package stm.com.program.paypal.payment.service.impl;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Service;

import stm.com.generic.service.impl.GenericServiceImpl;
import stm.com.program.paypal.payment.service.PaypalPaymentService;
import stm.com.program.paypal.payment.web.PaypalPaymentCommand;

@Service("paypalpaymentService")
public class PaypalPaymentServiceImpl extends GenericServiceImpl<PaypalPaymentDao, PaypalPaymentCommand> implements PaypalPaymentService {

	public PaypalPaymentCommand getListByDate(PaypalPaymentCommand cmd, HttpServletRequest req, HttpServletResponse res) throws Exception{
	
		PaypalPaymentDao dao = getDao();
		cmd.setList(dao.getListByDate(cmd));
		
		return cmd;
	}
}
