package stm.com.program.ordcomplete.web;

import java.util.ArrayList;
import java.util.Collections;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.ibm.icu.util.Calendar;

import stm.com.generic.web.GenericController;
import stm.com.program.ordcomplete.service.OrderCompleteService;
import stm.com.program.order.essay.service.OrderEssayService;
import stm.com.program.order.essay.web.OrderEssayCommand;
import stm.com.program.order.revision.service.OrderRevisionService;
import stm.com.program.order.revision.web.OrderRevisionCommand;
import stm.com.program.user.service.UserService;
import stm.com.program.user.web.UserCommand;
import stm.com.support.util.ApplicationHelper;

@Controller
@RequestMapping("/back/order/complete")
public class OrderCompleteController extends GenericController<OrderCompleteService, OrderCompleteCommand> {

}