package com.npu.capstone.dao;

import com.npu.capstone.domain.JobSeeker;

public interface JobSeekerDao {

	public void insertJobSeeker(JobSeeker jobseeker);
	public boolean checkJobSeekerCrediential(JobSeeker jobseeker);
}
