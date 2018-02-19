package stm.com.program.paypal.payment.web;

import org.springframework.stereotype.Controller;

import org.springframework.web.bind.annotation.RequestMapping;

import stm.com.generic.web.GenericController;
import stm.com.program.paypal.payment.service.PaypalPaymentService;

@Controller
@RequestMapping("/back/paypalpayment")
public class PaypalPaymentController extends GenericController<PaypalPaymentService, PaypalPaymentCommand> {

	
}