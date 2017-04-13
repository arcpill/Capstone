package com.npu.capstone.dao;

import java.util.HashMap;
import java.util.Map;

import javax.annotation.PostConstruct;
import javax.sql.DataSource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.namedparam.MapSqlParameterSource;
import org.springframework.jdbc.core.namedparam.NamedParameterJdbcTemplate;
import org.springframework.jdbc.core.simple.SimpleJdbcInsert;
import org.springframework.stereotype.Repository;

import com.npu.capstone.domain.JobSeeker;



@Repository("JobSeekerDaoJdbcImpl")
public class JobSeekerDaoJdbcImpl implements JobSeekerDao {

	@Autowired
	private DataSource dataSource;
	private JdbcTemplate dbTemplate;
	private SimpleJdbcInsert jdbcInsert;
	private JobSeekerRowMapper jobSeekerRowMapper;
	
	@PostConstruct
	public void setup() {
		dbTemplate = new JdbcTemplate(dataSource);
		jdbcInsert = new SimpleJdbcInsert(dataSource);
		jdbcInsert.withTableName("userinfo");
		jdbcInsert.usingGeneratedKeyColumns("id");
		jobSeekerRowMapper = new JobSeekerRowMapper();
		
		
	}
	
	public Map<String, Object> getJobSeekParams(JobSeeker jobseeker) {
		Map<String, Object> jobsekerParams = new HashMap<String, Object>();
		
		
		jobsekerParams.put("lastName", jobseeker.getLastName());
		jobsekerParams.put("firstName", jobseeker.getFirstName());
		jobsekerParams.put("email", jobseeker.getEmail());
		jobsekerParams.put("password", jobseeker.getPassword());

		return jobsekerParams;
	}
	
	public void insertJobSeeker(JobSeeker jobseeker) {
		long id;
		Map<String, Object> jobParams = getJobSeekParams(jobseeker);
		Number newId = jdbcInsert.executeAndReturnKey(jobParams);
		id = newId.longValue();
		jobseeker.setId(id);		
	}

	public boolean checkJobSeekerCrediential(JobSeeker jobseeker) {
		boolean validuser = false;
		String sql = "Select firstname from userinfo where email= ? and password= ? ";
		String email = jobseeker.getEmail();
		String password = jobseeker.getPassword();
		try{
		String firstName = dbTemplate.queryForObject(sql,new String[]{email,password}, String.class );
		if( firstName != null){
			validuser = true;
			jobseeker.setFirstName(firstName);
		}
		}
		catch(Exception ex){
			return validuser;
		}
		
		/*int count = dbTemplate.queryForInt(sql,email,password);
		System.out.println(sql+"======="+count);
		if(count==1){
			validuser = true;
		}*/
		return validuser;
	}

	public long getJobSeekerID(JobSeeker jobseeker) {
		
		JobSeeker jobseekerRow;
		String sql = "Select * from userinfo where email= ? and password= ? ";
		String email = jobseeker.getEmail();
		String password = jobseeker.getPassword();
		
		try{
		if( password == null){
			
			sql = "Select * from userinfo where firstName= ?";
			jobseekerRow  = dbTemplate.queryForObject(sql,new String[]{email}, jobSeekerRowMapper );
		}
		else
		{
			jobseekerRow  = dbTemplate.queryForObject(sql,new String[]{email,password}, jobSeekerRowMapper );
		}
		if( jobseekerRow!= null){
			return jobseekerRow.getId();
		}
		}
		catch(Exception ex){
			 return 0;
		}
		return 0;
	}
	
	

}
