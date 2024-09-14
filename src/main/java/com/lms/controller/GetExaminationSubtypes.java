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

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String examCoad = request.getParameter("examCoad");
        System.out.println(" examCoad in servlet "+examCoad);
        // Initialize your DAO or service to get the subtype list
        ExaminationDaoImpl subexam = new ExaminationDaoImpl();
        List<String> subtypeList;
		try {
			subtypeList = subexam.showExaminationSubtype(examCoad);
			response.setContentType("application/json");
	        PrintWriter out = response.getWriter();

	        // Convert list to JSON array
	        Gson gson = new Gson();
	        String json = gson.toJson(subtypeList);
	        System.out.println(" json in servlet "+json);
	        out.print(json);
	        out.flush();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

        // Set response type to JSON
        
    }
	}


