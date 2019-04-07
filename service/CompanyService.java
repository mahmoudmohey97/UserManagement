package com.jackrutorial.service;

import com.jackrutorial.model.Company;

public interface CompanyService 
{
	public Company findCompanyByEmail(String email);
	public void saveCompany(Company company);
}
