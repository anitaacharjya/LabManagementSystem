package com.lms.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.lms.daoimpl.UserDaoImpl;
import com.lms.daoimpl.CommonFuction;
import com.lms.vo.User;


@WebServlet("/UserRegisterServlet")
public class UserRegisterServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
   
    public UserRegisterServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	
	 protected void doPost(HttpServletRequest request, HttpServletResponse response) 
	            throws ServletException, IOException {
		 boolean isPassword=false;
		 HttpSession session = request.getSession();
		 CommonFuction common =new CommonFuction();
	        // Retrieve form data from the request object
	        String name = request.getParameter("name");
	        String dob = request.getParameter("dob");
	        String gender = request.getParameter("gender");
	        String address = request.getParameter("address");
	        String city = request.getParameter("city");
	        String state = request.getParameter("state");
	        String country = request.getParameter("country");
	        String maritalStatus = request.getParameter("marital_status");
	        String nationality = request.getParameter("nationality");
	        String email = request.getParameter("email");
	        String mobile = request.getParameter("mobile");
	        String telephone = request.getParameter("telephone");
	        String identityDocument = request.getParameter("identity_document");
	        String identityNumber = request.getParameter("identity_number");
	        String employmentType = request.getParameter("employment_type");
	        String joiningDate = request.getParameter("joining_date");
	        String bloodGroup = request.getParameter("blood_group");
	        String designation = request.getParameter("designation");
	        String username = request.getParameter("username");
	        String password = request.getParameter("password");
	        String adminAccess = request.getParameter("admin_access");
	        String preanalysisAccess = request.getParameter("preanalysis_access");
	        String analysisAccess = request.getParameter("analysis_access");
	        String postanalysisAccess = request.getParameter("postanalysis_access");
	        //Password check 
	        try {
	        	if(password!=null) {
				password=common.passwordencryptdecrypted(password, "ENC");
				isPassword=true;
	        	}
			} catch (Exception e) {

			}
	        // Create a new User object and set the retrieved data
	        User user = new User();
	        user.setName(name);
	        user.setDob(dob);
	        user.setGender(gender);
	        user.setAddress(address);
	        user.setCity(city);
	        user.setState(state);
	        user.setCountry(country);
	        user.setMaritalStatus(maritalStatus);
	        user.setNationality(nationality);
	        user.setEmail(email);
	        user.setMobile(mobile);
	        user.setTelephone(telephone);
	        user.setIdentityDocument(identityDocument);
	        user.setIdentityNumber(identityNumber);
	        user.setEmploymentType(employmentType);
	        user.setJoiningDate(joiningDate);
	        user.setBloodGroup(bloodGroup);
	        user.setDesignation(designation);
	        user.setUsername(username);
	        user.setPassword(password);
	        user.setAdminAccess(adminAccess);
	        user.setPreanalysisAccess(preanalysisAccess);
	        user.setAnalysisAccess(analysisAccess);
	        user.setPostanalysisAccess(postanalysisAccess);
	        boolean isRegistered=false;
	        // Create an instance of UserDaoImpl to handle database operations
	        if(isPassword) {
	        UserDaoImpl userDao = new UserDaoImpl();
	        isRegistered = userDao.registerUser(user);
	        }

	        // Redirect based on the registration result
	        if (isRegistered) {
	        	session.setAttribute("Success", "User registration successful");
	            response.sendRedirect("User.jsp");
	        } else {
	        	session.setAttribute("Failed", "Something went wrong");
	            response.sendRedirect("User.jsp");
	        }
	    }

}
