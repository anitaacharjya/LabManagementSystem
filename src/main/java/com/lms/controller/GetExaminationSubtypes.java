package com.lms.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;
import com.lms.daoimpl.ExaminationDaoImpl;

/**
 * Servlet implementation class GetExaminationSubtypes
 */
@WebServlet("/GetExaminationSubtypes")
public class GetExaminationSubtypes extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public GetExaminationSubtypes() {
        super();
        // TODO Auto-generated constructor stub
    }
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		     String examCoad = request.getParameter("examCoad");
		     System.out.println("examCoad "+examCoad);

	        // Call your DAO to get the examination subtypes based on the examCoad
	        ExaminationDaoImpl subexam = new ExaminationDaoImpl();
	        List<String> subtypes;
			try {
				subtypes = subexam.showExaminationSubtypeModal(examCoad);
				System.out.println("subtypes "+subtypes);
				 // Convert the list to JSON and send it back to the client
		        response.setContentType("application/json");
		        response.setCharacterEncoding("UTF-8");
		        response.getWriter().write(new Gson().toJson(subtypes));
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}

	       
	    }
        // Set response type to JSON
        
    }
	


