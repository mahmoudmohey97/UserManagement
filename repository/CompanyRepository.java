package com.jackrutorial.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.jackrutorial.model.Company;

@Repository("companyRepository")
public interface CompanyRepository extends JpaRepository<Company, Long>
{
	Company findCompanyByEmail(String email);
}
