package com.lms.vo;

public class Prerequisition {

	    private String clinicalHistory;
	    private String addiction;
	    private String allergicHistory;
	    private String other;
	    private String patientNo;
	    private String patientName;
	    private String sampleCollectedBy;

	    // Getters and Setters

	    public String getSampleCollectedBy() {
			return sampleCollectedBy;
		}

		public void setSampleCollectedBy(String sampleCollectedBy) {
			this.sampleCollectedBy = sampleCollectedBy;
		}

		public String getClinicalHistory() {
	        return clinicalHistory;
	    }

	    public void setClinicalHistory(String clinicalHistory) {
	        this.clinicalHistory = clinicalHistory;
	    }

	    public String getAddiction() {
	        return addiction;
	    }

	    public void setAddiction(String addiction) {
	        this.addiction = addiction;
	    }

	    public String getAllergicHistory() {
	        return allergicHistory;
	    }

	    public void setAllergicHistory(String allergicHistory) {
	        this.allergicHistory = allergicHistory;
	    }

	    public String getOther() {
	        return other;
	    }

	    public void setOther(String other) {
	        this.other = other;
	    }

	    public String getPatientNo() {
	        return patientNo;
	    }

	    public void setPatientNo(String patientNo) {
	        this.patientNo = patientNo;
	    }

	    public String getPatientName() {
	        return patientName;
	    }

	    public void setPatientName(String patientName) {
	        this.patientName = patientName;
	    }
	}



