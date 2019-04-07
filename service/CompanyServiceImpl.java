package com.jackrutorial.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;

import com.jackrutorial.model.Company;
import com.jackrutorial.model.User;
import com.jackrutorial.repository.CompanyRepository;

@Service("companyService")
public class CompanyServiceImpl implements CompanyService
{
	
	@Autowired
	 private BCryptPasswordEncoder bCryptPasswordEncoder;
	@Autowired
	private CompanyRepository companyRepository;
	
	@Override
	 public Company findCompanyByEmail(String email) 
	{
	  return companyRepository.findCompanyByEmail(email);
	}
	
	public void saveCompany(Company company)
	{
		company.setPassword(bCryptPasswordEncoder.encode(company.getPassword()));
		companyRepository.save(company);
	}

}
