package com.lms.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import java.util.Locale;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.xml.parsers.DocumentBuilder;
import javax.xml.parsers.DocumentBuilderFactory;
import java.io.ByteArrayInputStream;
import java.io.InputStream;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.io.IOException;
import org.w3c.dom.Document;
import org.w3c.dom.NodeList;

import org.w3c.dom.NodeList;

import com.google.gson.Gson;
import com.lms.daoimpl.SampleDaoImpl;
import com.lms.vo.SubmitData;

@WebServlet("/SubmitSamples")
public class SubmitSamples extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public SubmitSamples() {
        super();
        // TODO Auto-generated constructor stub
    }

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		 
		 
		 String selectedSamplesValue = request.getParameter("selectedSamples");
		 String selected = request.getParameter("from");
	     System.out.println("examCoad "+selectedSamplesValue);
	     System.out.println("selected "+selected);
	     
	     LocalDateTime now = LocalDateTime.now();
	     DateTimeFormatter formatter = DateTimeFormatter.ofPattern("dd-MMM-yyyy h:mm:ss a", Locale.ENGLISH);
	     String formattedDateTime = now.format(formatter);
	     System.out.println("formattedDateTime "+formattedDateTime);
	     SampleDaoImpl sampledao= new SampleDaoImpl();

	     String id[]=selectedSamplesValue.split(",");
	     for(String i : id) {
	    	 boolean flag=sampledao.addTestSampleDetails(i,formattedDateTime,selected);
	    	 System.out.println(" flag "+flag);
	     }
	     
         
      
	}

}
