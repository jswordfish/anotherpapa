package com.infrasofttech.domain.entities;

import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

@Entity
public class CustomerKYCFamily extends Base {

	private static final long serialVersionUID = 1701926931204630606L;

	@Column(length = 50, nullable = true)
	private String familyMemberName = "";

	@Column(length = 30, nullable = true)
	private String relationship1 = "";

	@Column(nullable = true, length = 30)
	private String gender = "";

	@Temporal(TemporalType.DATE)
	private Date dob;

	@Column(length = 50, nullable = true)
	private String profession = "";

	@Column(length = 50, nullable = true)
	private String education = "";

	public String getFamilyMemberName() {
		return familyMemberName;
	}

	public void setFamilyMemberName(String familyMemberName) {
		this.familyMemberName = familyMemberName;
	}

	public String getRelationship1() {
		return relationship1;
	}

	public void setRelationship1(String relationship1) {
		this.relationship1 = relationship1;
	}

	public String getGender() {
		return gender;
	}

	public void setGender(String gender) {
		this.gender = gender;
	}

	public Date getDob() {
		return dob;
	}

	public void setDob(Date dob) {
		this.dob = dob;
	}

	public String getProfession() {
		return profession;
	}

	public void setProfession(String profession) {
		this.profession = profession;
	}

	public String getEducation() {
		return education;
	}

	public void setEducation(String education) {
		this.education = education;
	}

}
