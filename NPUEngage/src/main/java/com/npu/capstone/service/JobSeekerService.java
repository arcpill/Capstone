package com.npu.capstone.service;

import com.npu.capstone.domain.JobSeeker;

public interface JobSeekerService {



	public void addNewJobSeeker(JobSeeker jobseeker);
	public boolean CheckJobSeekerLogin(JobSeeker jobseeker);

}
