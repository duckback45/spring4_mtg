package web.main.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class MainController {
	@RequestMapping("/main.mtg")
	public ModelAndView mainView() {
		ModelAndView mav = new ModelAndView();
		
		mav.setViewName("main");
		
		return mav;
	}
	
	@RequestMapping("/aboutUs.mtg")
	public ModelAndView aboutUslist(){
		
		ModelAndView mav = new ModelAndView();
		mav.setViewName("aboutUs");
		return mav;
	}
	
	@RequestMapping("/faq.mtg")
	public ModelAndView faqlist(){
		
		ModelAndView mav = new ModelAndView();
		mav.setViewName("faq");
		return mav;
	}
	
	@RequestMapping("/features.mtg")
	public ModelAndView featureslist(){
		
		ModelAndView mav = new ModelAndView();
		mav.setViewName("features");
		return mav;
	}
	
	@RequestMapping("/notice.mtg")
	public ModelAndView noticelist(){
		
		ModelAndView mav = new ModelAndView();
		mav.setViewName("notice");
		return mav;
	}
	
	@RequestMapping("/privacy.mtg")
	public ModelAndView privacylist(){
		
		ModelAndView mav = new ModelAndView();
		mav.setViewName("privacy");
		return mav;
	}
	
	@RequestMapping("/terms.mtg")
	public ModelAndView termslist(){
		
		ModelAndView mav = new ModelAndView();
		mav.setViewName("terms");
		return mav;
	}
}
