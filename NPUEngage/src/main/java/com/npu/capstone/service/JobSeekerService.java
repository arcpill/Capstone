package com.npu.capstone.service;

import com.npu.capstone.domain.JobSeeker;
import com.npu.capstone.domain.PostJob;


public interface JobSeekerService {



	public void addNewJobSeeker(JobSeeker jobseeker);
	public boolean CheckJobSeekerLogin(JobSeeker jobseeker);
	public void postjob(PostJob postjob);
	public long getJobseekerID( JobSeeker jobseeker);
	public long getOtherJobSeekerID(String otherID);

}
