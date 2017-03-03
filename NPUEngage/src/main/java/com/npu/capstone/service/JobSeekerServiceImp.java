package com.npu.capstone.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import com.npu.capstone.dao.JobSeekerDao;
import com.npu.capstone.domain.JobSeeker;

@Service
public class JobSeekerServiceImp implements JobSeekerService{

	@Autowired
	@Qualifier("JobSeekerDaoJdbcImpl")
	private JobSeekerDao jobseekerDao;
	
	public void addNewJobSeeker(JobSeeker jobseeker) {
		jobseekerDao.insertJobSeeker(jobseeker);
		
	}

	public boolean CheckJobSeekerLogin(JobSeeker jobseeker) {
		return jobseekerDao.checkJobSeekerCrediential(jobseeker);

	}

}
