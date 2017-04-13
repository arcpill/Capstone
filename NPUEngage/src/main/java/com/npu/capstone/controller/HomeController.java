package com.npu.capstone.controller;

import java.util.List;
import java.util.Locale;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.commons.CommonsMultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.npu.capstone.domain.JobSeeker;
import com.npu.capstone.domain.PostJob;
import com.npu.capstone.domain.PostReq;
import com.npu.capstone.domain.Profile;
import com.npu.capstone.domain.Project;
import com.npu.capstone.service.JobSeekerService;
import com.npu.capstone.service.JobSeekerServiceImp;
import com.npu.capstone.service.PostRequestServiceImpl;
import com.npu.capstone.service.PostJobService;
import com.npu.capstone.service.ProfilePageService;

/**
 * Handles requests for the application home page.
 */
@Controller
public class HomeController {

	// private static final Logger logger =
	// Logger.getLogger(HomeController.class);
	@Autowired
	JobSeekerService jobseekerService;

	@Autowired
	ProfilePageService profilePageService;
	
	@Autowired
	PostRequestServiceImpl postRequestServiceImpl;
	
	@Autowired
	PostJobService postjobService;

	/**
	 * Simply selects the home view to render by returning its name.
	 */
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home(Locale locale, Model model) {

		return "login";
	}

	@RequestMapping(value = "/postJobRequest", method = RequestMethod.GET)
	public String SearchJob(Model model) {

		return "postjob";
	}
	
	@RequestMapping(value = "/gotoStudentBoard", method = RequestMethod.GET)
	public ModelAndView StudentBoard(Model model,HttpSession session) {

		ModelAndView modelView = new ModelAndView("studBoard");
		
		List<PostReq> listOfPosts = postRequestServiceImpl.getAllPosts();
		
		if( listOfPosts.isEmpty() )
		{
			modelView.addObject("postReq", "No Posts Found");
		}
		else{
			modelView.addObject("postReq", listOfPosts);
			session.setAttribute("postReq", listOfPosts);
		}
		session.setAttribute("jobseeker", session.getAttribute("jobseeker"));
		modelView.addObject("jobseeker", session.getAttribute("jobseeker"));

		session.setAttribute("jobseeker", session.getAttribute("jobseeker"));
		return modelView;
	}
	
	@RequestMapping(value = "/gotoJobListing", method = RequestMethod.GET)
	public ModelAndView JobListing(Model model,HttpSession session) {

		ModelAndView modelView = new ModelAndView("home");
		
		session.setAttribute("jobseeker", session.getAttribute("jobseeker"));
		modelView.addObject("jobseeker", session.getAttribute("jobseeker"));

		session.setAttribute("jobseeker", session.getAttribute("jobseeker"));
		return modelView;
	}

	@RequestMapping(value = "/postRequest", method = RequestMethod.GET)
	public String PostRequest(Model model) {

		return "postRequest";
	}
	
	// Post Job Process Request
	@RequestMapping(value = "/processPostJobRequest", method = RequestMethod.POST)

	public ModelAndView processPostJobRequest(@ModelAttribute("postjob") PostJob postjob, HttpSession session) {

		ModelAndView modelView;

		jobseekerService.postjob(postjob);
		modelView = new ModelAndView("home");
		
		session.setAttribute("jobseeker", session.getAttribute("jobseeker"));
		modelView.addObject("jobseeker", session.getAttribute("jobseeker"));

		session.setAttribute("postjob", postjob);
		modelView.addObject("postjob", postjob);

		return modelView;

	}

	@RequestMapping(value = "/processJobSeekerRegistrationRequest", method = RequestMethod.POST)
	public ModelAndView processJobSeekerRegistrationRequest(@ModelAttribute("jobseeker") JobSeeker jobseeker,
			HttpSession session) {

		ModelAndView modelView;

		jobseekerService.addNewJobSeeker(jobseeker);
		modelView = new ModelAndView("home");
		session.setAttribute("jobseeker", jobseeker);
		modelView.addObject("jobseeker", jobseeker);

		return modelView;
	}

	@RequestMapping(value = "/processLoginRequest", method = RequestMethod.POST)
	public ModelAndView processLoginRequest(@ModelAttribute("jobseeker") JobSeeker jobseeker, BindingResult result,
			HttpSession session) {

		ModelAndView modelView;
		/* Re-present the form with error messages */
		if (!jobseekerService.CheckJobSeekerLogin(jobseeker)) {
			modelView = new ModelAndView("login");
			modelView.addObject("errors", "Invalid Credentials <br> New User Click Register");
			return modelView;

		} else {
			modelView = new ModelAndView("home");
			session.setAttribute("jobseeker", jobseeker);
			modelView.addObject("jobseeker", jobseeker);
		}

		return modelView;

	}

	@RequestMapping(value = "/gotoLoginProfile", method = RequestMethod.GET)
	public ModelAndView profile(Locale locale, Model model, HttpSession session) {

		ModelAndView modelView = new ModelAndView("profile");
		// search for profile
		session.setAttribute("jobseeker", session.getAttribute("jobseeker"));
		Profile profileFromDb = profilePageService.getProfileDetailsForUser(
				jobseekerService.getJobseekerID((JobSeeker) session.getAttribute("jobseeker")));
		modelView.addObject("profile", profileFromDb);
		session.setAttribute("profile", profileFromDb);

		modelView.addObject("jobseeker", session.getAttribute("jobseeker"));

		return modelView;
	}

	/**
	 * Upload Resume
	 * 
	 * @param file
	 * @param session
	 * @return profile page
	 */

	@RequestMapping(value = "/uploadResume", method = RequestMethod.POST)
	public ModelAndView uploadFile(@ModelAttribute("file") MultipartFile file, HttpSession session) {

		String success = profilePageService.uploadResume(file);
		ModelAndView modelView = new ModelAndView("profile");

		session.setAttribute("jobseeker", session.getAttribute("jobseeker"));

		modelView.addObject("jobseeker", session.getAttribute("jobseeker"));
		modelView.addObject("resumeStatus", success);

		return modelView;
	}

	/**
	 * 
	 * @return
	 */
	@RequestMapping(value = "/saveProfileDetails", method = RequestMethod.POST)
	public ModelAndView saveProfileDetails(@ModelAttribute("profile") Profile profile, HttpSession session) {

		JobSeeker jobseeker = (JobSeeker) session.getAttribute("jobseeker");
		// call profile service to update profile
		profile.setJobseeker_id(jobseekerService.getJobseekerID(jobseeker));
		profilePageService.saveProfileForUser(profile);
		session.setAttribute("profile", profile);

		ModelAndView modelView = new ModelAndView("profile");
		modelView.addObject("profile", profile);
		
		session.setAttribute("jobseeker", session.getAttribute("jobseeker"));
		modelView.addObject("jobseeker", jobseeker);

		return modelView;
	}

	/*
	 * GET AJAX REQ from UI & return Response <EXTRA>
	 * 
	 * @RequestMapping(value = "/processLoginRequest", method =
	 * RequestMethod.POST) public ResponseEntity<String> login(@RequestBody
	 * JobSeeker jobseeker) {
	 * 
	 * if(!jobseekerService.CheckJobSeekerLogin(jobseeker)) { return new
	 * ResponseEntity<String>("Invalid Credentials", HttpStatus.OK); }
	 * 
	 * return new ResponseEntity<String>("Success"+jobseeker.getFirstName(),
	 * HttpStatus.OK); }
	 */

	/**
	 * 
	 * @param projectDet
	 *            Json
	 * @return
	 */
	@RequestMapping(value = "/processProjectDetReq", method = RequestMethod.POST)
	public ResponseEntity<Project> project(@RequestBody Project projectDet, HttpSession session) {

		JobSeeker jobseeker = (JobSeeker) session.getAttribute("jobseeker");
		Profile sessionProfile = (Profile) session.getAttribute("profile");
		sessionProfile.setProject_det(projectDet.getPrjt_desc());
		profilePageService.saveProjectDetails(projectDet, jobseekerService.getJobseekerID(jobseeker));

		session.setAttribute("profile", sessionProfile);

		ModelAndView modelView = new ModelAndView("profile");
		modelView.addObject("profile", sessionProfile);

		return new ResponseEntity<Project>(projectDet, HttpStatus.OK);

	}


	/**
	 * 
	 * @param locale
	 * @param model
	 * @param session
	 * @return
	 */
	@RequestMapping(value = "/gotoOtherProfile", method = RequestMethod.GET)
	public ModelAndView getOtherprofile( @RequestParam("id")  String id, Locale locale, Model model,HttpSession session) {

		// search for profile

		Profile profileFromDb = profilePageService.getProfileDetailsForUser(
				jobseekerService.getOtherJobSeekerID(id));
		
		if(profileFromDb == null){
			
			ModelAndView modelView = new ModelAndView("home");
			session.setAttribute("jobseeker", session.getAttribute("jobseeker"));
			modelView.addObject("jobseeker", session.getAttribute("jobseeker"));
			modelView.addObject("errors", "Profile Not Found");

			return modelView;
		}
		
		ModelAndView modelView = new ModelAndView("profile");
		session.setAttribute("jobseeker", session.getAttribute("jobseeker"));
		modelView.addObject("jobseeker", session.getAttribute("jobseeker"));
		modelView.addObject("profile", profileFromDb);
		modelView.addObject("other", "YES");

		return modelView;
	}
	
	
	/**
	 * 
	 * @param seachAutoComplete
	 *            Json
	 * @return
	 */
	@RequestMapping(value = "/AutoCompleteNameList", method = RequestMethod.POST)
	public ResponseEntity<List> searchAutoComplete(@RequestBody String term, HttpSession session) {

		List<String> names = profilePageService.getAutoCompleteNameDetails(term);
		return new ResponseEntity<List>(names, HttpStatus.OK);

	}
	
	/**
	 * 
	 * @param postReq
	 * @param session
	 * @return
	 */
	@RequestMapping(value = "/saveRequest", method = RequestMethod.POST)
	public ModelAndView saveRequest(@ModelAttribute("postReq") PostReq postReq, HttpSession session) {
	
		ModelAndView modelView = new ModelAndView("studBoard");
		
		if( postReq.getContact() != null && postReq.getCreatorName() != null){
			postRequestServiceImpl.savePostReq(postReq);
		}
		
		List<PostReq> listOfPosts = postRequestServiceImpl.getAllPosts();
		
		if( listOfPosts.isEmpty() )
		{
			modelView.addObject("postReq", "No Posts Found");
		}
		else{
			modelView.addObject("postReq", listOfPosts);
			session.setAttribute("postReq", listOfPosts);
		}
		session.setAttribute("jobseeker", session.getAttribute("jobseeker"));
		modelView.addObject("jobseeker", session.getAttribute("jobseeker"));
		
		return modelView;

	}
	
	/**
	 * 
	 * @param request
	 * @param session
	 * @return
	 */
	@RequestMapping(value = "/searchJobForm", method = RequestMethod.GET)
	public ModelAndView viewAvailableProductForm(HttpServletRequest request,HttpSession session)
	{
	
		List<PostJob> searchjobList;
		ModelAndView modelView;
		String jobtitle  =  (String) request.getParameter("jobtitle");
		String joblocation  =  (String) request.getParameter("joblocation");
		
		System.out.println(jobtitle+" ======"+joblocation);
		searchjobList = postjobService.getJobList(jobtitle,joblocation);	
		
 		modelView = new ModelAndView("viewJobsList");
 		modelView.addObject("searchjobList", searchjobList);
 		session.setAttribute("searchjobList",searchjobList);

 		session.setAttribute("joblocation",joblocation);
 		session.setAttribute("jobtitle",jobtitle);
 		
 		session.setAttribute("jobseeker", session.getAttribute("jobseeker"));
		modelView.addObject("jobseeker", session.getAttribute("jobseeker"));
		
		return modelView;
	}
	
	/**
	 * 
	 * @param request
	 * @param session
	 * @return
	 */
	
	@RequestMapping(value = "/homeForm", method = RequestMethod.GET)
	public ModelAndView viewJob(HttpServletRequest request,HttpSession session)
	{
		List<PostJob> searchjobList;
		ModelAndView modelView;
		String jobtitle  =  (String) request.getParameter("jobtitle");
		String joblocation  =  (String) request.getParameter("joblocation");
		searchjobList = postjobService.getJobList(jobtitle,joblocation);	

 		modelView = new ModelAndView("home");

 		modelView.addObject("searchjobList", searchjobList);
 		session.setAttribute("searchjobList",searchjobList);


 		session.setAttribute("joblocation",joblocation);
 		session.setAttribute("jobtitle",jobtitle);
 		
 		session.setAttribute("jobseeker", session.getAttribute("jobseeker"));
		modelView.addObject("jobseeker", session.getAttribute("jobseeker"));
 		
		return modelView;
	}	
	
	/**
	 * 
	 * @param request
	 * @param session
	 * @return
	 */
	
	@RequestMapping(value = "/SubmitApplication", method = RequestMethod.POST)
	public ModelAndView SubmitApplication(HttpServletRequest request,HttpSession session)
	{
		List<PostJob> searchjobList;
		ModelAndView modelView;
		String jobtitle  =  (String) request.getParameter("jobtitle");
		String joblocation  =  (String) request.getParameter("joblocation");
		searchjobList = postjobService.getJobList(jobtitle,joblocation);	

		
 		modelView = new ModelAndView("home");
 		modelView.addObject("searchjobList", searchjobList);
 		session.setAttribute("searchjobList",searchjobList);


 		session.setAttribute("joblocation",joblocation);
 		session.setAttribute("jobtitle",jobtitle);
 		
 		session.setAttribute("jobseeker", session.getAttribute("jobseeker"));
		modelView.addObject("jobseeker", session.getAttribute("jobseeker"));
 		
		return modelView;
	}
}
