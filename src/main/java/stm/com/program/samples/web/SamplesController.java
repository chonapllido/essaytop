package stm.com.program.samples.web;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import stm.com.generic.web.GenericController;
import stm.com.program.samples.service.SamplesService;

@Controller
@RequestMapping("/back/samples")
public class SamplesController extends GenericController<SamplesService, SamplesCommand> {

	
}