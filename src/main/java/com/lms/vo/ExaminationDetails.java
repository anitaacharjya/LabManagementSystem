package com.lms.vo;

public class ExaminationDetails {
	
	private String id;
	private String ex_code;
	private String ex_name;
	private String ex_price;
	private String ex_table;
	private String patient_id;
	private String sample_status;
	private String sample_id;
	private String group;
	private String normalValue;
	private String unit;
	private String sampleCollectionTime;
	public String recivedDate;
	public String testValue;
	
	public String getRecivedDate() {
		return recivedDate;
	}
	public void setRecivedDate(String recivedDate) {
		this.recivedDate = recivedDate;
	}
	

	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getUnit() {
		return unit;
	}
	public void setUnit(String unit) {
		this.unit = unit;
	}
	public String getGroup() {
		return group;
	}
	public void setGroup(String group) {
		this.group = group;
	}
	public String getEx_code() {
		return ex_code;
	}
	public void setEx_code(String ex_code) {
		this.ex_code = ex_code;
	}
	public String getEx_name() {
		return ex_name;
	}
	public void setEx_name(String ex_name) {
		this.ex_name = ex_name;
	}
	public String getEx_price() {
		return ex_price;
	}
	public void setEx_price(String ex_price) {
		this.ex_price = ex_price;
	}
	public String getPatient_id() {
		return patient_id;
	}
	public void setPatient_id(String patient_id) {
		this.patient_id = patient_id;
	}
	public String getSample_status() {
		return sample_status;
	}
	public void setSample_status(String sample_status) {
		this.sample_status = sample_status;
	}
	public String getSample_id() {
		return sample_id;
	}
	public void setSample_id(String sample_id) {
		this.sample_id = sample_id;
	}
	public String getEx_table() {
		return ex_table;
	}
	public void setEx_table(String ex_table) {
		this.ex_table = ex_table;
	}
	public String getSampleCollectionTime() {
		return sampleCollectionTime;
	}
	public void setSampleCollectionTime(String sampleCollectionTime) {
		this.sampleCollectionTime = sampleCollectionTime;
	}
	public String getNormalValue() {
		return normalValue;
	}
	public void setNormalValue(String normalValue) {
		this.normalValue = normalValue;
	}
	public String getTestValue() {
		return testValue;
	}
	public void setTestValue(String testValue) {
		this.testValue = testValue;
	}
	
	

}
