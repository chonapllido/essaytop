package stm.com.program.ordunconfirm.web;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import stm.com.generic.web.GenericController;
import stm.com.program.ordcomplete.web.OrderCompleteCommand;
import stm.com.program.order.essay.service.OrderEssayService;
import stm.com.program.order.essay.web.OrderEssayCommand;
import stm.com.program.order.revision.service.OrderRevisionService;
import stm.com.program.order.revision.web.OrderRevisionCommand;
import stm.com.program.ordunconfirm.service.OrderUnconfirmService;
import stm.com.support.util.ApplicationHelper;

@Controller
@RequestMapping("/back/order/unconfirmed")
public class OrderUnconfirmController extends GenericController<OrderUnconfirmService, OrderUnconfirmCommand> {

}