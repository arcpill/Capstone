package com.npu.capstone.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import com.npu.capstone.dao.JobSeekerDao;
import com.npu.capstone.dao.PostJobDao;
import com.npu.capstone.domain.JobSeeker;
import com.npu.capstone.domain.PostJob;

@Service
public class JobSeekerServiceImp implements JobSeekerService{

	@Autowired
	@Qualifier("JobSeekerDaoJdbcImpl")
	private JobSeekerDao jobseekerDao;
	
	@Autowired
	@Qualifier("PostJobDaoJdbcImpl")
	private PostJobDao postjobDao;
	public void addNewJobSeeker(JobSeeker jobseeker) {
		jobseekerDao.insertJobSeeker(jobseeker);
		
	}

	public boolean CheckJobSeekerLogin(JobSeeker jobseeker) {
		return jobseekerDao.checkJobSeekerCrediential(jobseeker);

	}

	@Override
	public long getJobseekerID(JobSeeker jobseeker) {
		return jobseekerDao.getJobSeekerID(jobseeker);
	}
	
	@Override
	public void postjob(PostJob postjob) {
		postjobDao.insertPostJob(postjob);
	}

	@Override
	public long getOtherJobSeekerID(String  otherID) {
		JobSeeker otherJS = new JobSeeker();
		otherJS.setEmail(otherID);
		return jobseekerDao.getJobSeekerID(otherJS);
	}
	

}
