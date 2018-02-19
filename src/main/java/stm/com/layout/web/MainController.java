package stm.com.layout.web;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import stm.com.generic.web.GenericMainController;
import stm.com.program.ordcomplete.service.OrderCompleteService;
import stm.com.program.ordcomplete.web.OrderCompleteCommand;
import stm.com.support.util.ApplicationHelper;

@Controller
public class MainController extends GenericMainController {
	@RequestMapping("/front/main.do")
	public ModelAndView front(HttpServletRequest req, HttpServletResponse res) throws Exception {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("layout.front.main");
		
		HttpSession session = req.getSession();
		
		if(req.getParameterMap().containsKey("lang")){
			String lang = req.getParameter("lang");
			session.setAttribute("lang", lang);
		} else {
			if(session.getAttribute("lang") == null || session.getAttribute("lang").equals("")){
				session.setAttribute("lang", "KO");
			}
		}

		return mav;
	}

	@RequestMapping("/back/main.do")
	public ModelAndView back(HttpServletRequest req, HttpServletResponse res) {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("layout.back.main");
		return mav;
	}
}
