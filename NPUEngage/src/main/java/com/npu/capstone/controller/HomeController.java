package com.npu.capstone.controller;

import java.util.Locale;

import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.npu.capstone.domain.JobSeeker;
import com.npu.capstone.service.JobSeekerService;

/**
 * Handles requests for the application home page.
 */
@Controller
public class HomeController {
	
	private static final Logger logger = Logger.getLogger(HomeController.class);
	@Autowired
	JobSeekerService jobseekerService;
	/**
	 * Simply selects the home view to render by returning its name.
	 */
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home(Locale locale, Model model) {
		
		return "login";
	}
	
	
	@RequestMapping(value = "/processJobSeekerRegistrationRequest", method = RequestMethod.POST)
	public ModelAndView processJobSeekerRegistrationRequest(@ModelAttribute("jobseeker") JobSeeker jobseeker, HttpSession session) 
	{
		
		ModelAndView modelView;
		
		jobseekerService.addNewJobSeeker(jobseeker);		
 		modelView = new ModelAndView("home");
 		session.setAttribute("jobseeker", jobseeker);
 		modelView.addObject("jobseeker", jobseeker);
		
		return modelView;
	}
	
	@RequestMapping(value = "/processLoginRequest", method = RequestMethod.POST)
	public ModelAndView processLoginRequest(@ModelAttribute("jobseeker") JobSeeker jobseeker ,BindingResult result , HttpSession session) 
	{
		
		ModelAndView modelView;
			/*  Re-present the form with error messages */
			if(!jobseekerService.CheckJobSeekerLogin(jobseeker)) {
				System.out.println("================================");
				modelView = new ModelAndView("login");
				modelView.addObject("errors", "Invalid Credentials");
				return modelView;

			} else {
				modelView = new ModelAndView("home");
		 		session.setAttribute("jobseeker", jobseeker);
		 		modelView.addObject("jobseeker", jobseeker);
				}
		
		return modelView;
	
 		
	}
	
	@RequestMapping(value = "/gotoLoginProfile", method = RequestMethod.GET)
	public String profile(Locale locale, Model model) {
		
		return "profile";
	}
	

	
	
	
	/*  GET AJAX REQ from UI & return Response <EXTRA>
	  @RequestMapping(value = "/processLoginRequest", method = RequestMethod.POST)
	public ResponseEntity<String> login(@RequestBody JobSeeker jobseeker) {

		if(!jobseekerService.CheckJobSeekerLogin(jobseeker)) {
			return new ResponseEntity<String>("Invalid Credentials", HttpStatus.OK);
		}
		
	    return new ResponseEntity<String>("Success"+jobseeker.getFirstName(), HttpStatus.OK);
	}*/
	
	
	

	
}
