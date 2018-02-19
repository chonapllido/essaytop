package stm.com.program.ceorder.web;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import stm.com.generic.web.GenericController;
import stm.com.program.ceorder.service.CeOrderService;

@Controller
@RequestMapping("/back/ceorder")
public class CeOrderController extends GenericController<CeOrderService, CeOrderCommand> {

}