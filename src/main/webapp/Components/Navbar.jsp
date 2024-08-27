
<%@ page import="com.lms.dbconnect.Dbconnect"%>
<%@ page import="java.util.List"%>
<%@ page import="com.lms.vo.UserAccess"%>
<%@ page import="com.lms.daoimpl.UserDaoImpl"%>
<%@ page import="java.sql.Connection"%>
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.1/css/all.min.css"
	integrity="sha512-DTOQO9RWCH3ppGqcWaEA1BIZOC6xxalwEsw9c2QQeAIftl+Vegovlnee1c9QX4TctnWMn13TZye+giMm8e2LwA=="
	crossorigin="anonymous" referrerpolicy="no-referrer" />

<div class="w-64 bg-blue-500 text-white p-6 h-screen overflow-y-auto">
    <nav>
        <ul>
            <li class="mb-6">
                <h2 style="font-weight:bold;font-size:20px">&nbsp;&nbsp;&nbsp;<i class="fa-solid fa-user"></i> ${user.username}</h2>
            </li>
            <%
      
            String adminUser="";
            String pre_analysis="";
            String analysis="";
            String Post_analysis="";
           String admin=(String)request.getSession().getAttribute("username");
           System.out.println(" User name "+admin);
           UserDaoImpl userdao1 = new UserDaoImpl();
           UserAccess userAccess=userdao1.chekingAcess(admin);
           if(userAccess!=null){
        	   adminUser= userAccess.getAdmin();
        	   pre_analysis= userAccess.getPre_analysis();
        	   analysis= userAccess.getAnalysis();
        	   Post_analysis= userAccess.getPost_analysis();
           }
           System.out.println("User adminUser "+adminUser+" pre_analysis "+pre_analysis+" analysis "+analysis + " Post_analysis "+Post_analysis);
            if(adminUser.equals("Y")){ %>
            <li class="mb-4">
                <button id="admin-dropdown-btn" class="block py-2 px-4 w-full text-left" style="font-weight:bold;font-size:15px">
                    <i class="fa-solid fa-user-shield"></i> Admin
                </button>
                <ul id="admin-dropdown-menu" class="ml-4 hidden">
                    <li class="mb-2">
                        <a href="AllUserList.jsp" class="block py-2 px-4" style="font-weight:bold;font-size:15px">
                             Users
                        </a>
                    </li>
                     <li class="mb-2">
                        <a href="User.jsp" class="block py-2 px-4" style="font-weight:bold;font-size:15px">
                             Examination
                        </a>
                    </li>
                     <li class="mb-2">
                        <a href="User.jsp" class="block py-2 px-4" style="font-weight:bold;font-size:15px">
                             Test
                        </a>
                    </li>
                    <!-- Add more admin-related links here -->
                </ul>
            </li>
            <li class="mb-4">
                <a href="home.jsp" class="block py-2 px-4" style="font-weight:bold;font-size:15px"><i class="fa-solid fa-gauge"></i> Dashboard</a>
            </li>
            <li class="mb-4">
                <a href="PreAnalysis.jsp" class="block py-2 px-4" style="font-weight:bold;font-size:15px"><i class="fa-solid fa-vials"></i> Pre Analysis</a>
            </li>
            <li class="mb-4">
                <a href="Analysis.jsp" class="block py-2 px-4" style="font-weight:bold;font-size:15px"><i class="fa-solid fa-flask"></i> Analysis</a>
            </li>
            <li class="mb-4">
                <a href="PostAnalysis.jsp" class="block py-2 px-4" style="font-weight:bold;font-size:15px"><i class="fa-solid fa-scroll"></i> Post Analysis</a>
            </li>
            <%} else{%>
            <li class="mb-4">
                <a href="home.jsp" class="block py-2 px-4" style="font-weight:bold;font-size:15px"><i class="fa-solid fa-gauge"></i> Dashboard</a>
            </li>
            <li class="mb-4">
                <a href="PreAnalysis.jsp" class="block py-2 px-4" style="font-weight:bold;font-size:15px"><i class="fa-solid fa-vials"></i> Pre Analysis</a>
            </li>
            <li class="mb-4">
                <a href="Analysis.jsp" class="block py-2 px-4" style="font-weight:bold;font-size:15px"><i class="fa-solid fa-flask"></i> Analysis</a>
            </li>
            <li class="mb-4">
                <a href="PostAnalysis.jsp" class="block py-2 px-4" style="font-weight:bold;font-size:15px"><i class="fa-solid fa-scroll"></i> Post Analysis</a>
            </li>
            <% } %>
        </ul>
    </nav>
</div>
<script>
    document.addEventListener("DOMContentLoaded", function() {
        // Existing code here...

        // Dropdown functionality for Admin menu
        const adminDropdownButton = document.getElementById("admin-dropdown-btn");
        const adminDropdownMenu = document.getElementById("admin-dropdown-menu");

        adminDropdownButton.addEventListener("click", function() {
            adminDropdownMenu.classList.toggle("hidden");
        });
    });
</script>
<!-- Modal -->
<div id="popup-modal" tabindex="-1" class="hidden overflow-y-auto overflow-x-hidden fixed top-4rem right-0 left-0 z-50 justify-center items-center w-full md:inset-0 h-[calc(100%-1rem)] max-h-full">
    <div class="relative p-4 w-full max-w-md max-h-full">
        <div class="relative bg-white rounded-lg shadow dark:bg-gray-700 transition-transform transform translate-y-0 opacity-100 scale-100">
            <button type="button" class="absolute top-3 right-2.5 text-gray-400 bg-transparent hover:bg-gray-200 hover:text-gray-900 rounded-lg text-sm w-8 h-8 ms-auto inline-flex justify-center items-center dark:hover:bg-gray-600 dark:hover:text-white" data-modal-hide="popup-modal">
                <svg class="w-3 h-3" aria-hidden="true" xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 14 14">
                    <path stroke="currentColor" stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="m1 1 6 6m0 0 6 6M7 7l6-6M7 7l-6 6"/>
                </svg>
                <span class="sr-only">Close modal</span>
            </button>
            <div class="p-4 md:p-5 text-center">
                <svg class="mx-auto mb-4 text-gray-400 w-12 h-12 dark:text-gray-200" aria-hidden="true" xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 20 20">
                    <path stroke="currentColor" stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M10 11V6m0 8h.01M19 10a9 9 0 1 1-18 0 9 9 0 0 1 18 0Z"/>
                </svg>
                <h3 class="mb-5 text-lg font-normal text-gray-500 dark:text-gray-400">Are you sure you want to log out?</h3>
                <a href="LogoutServlet" data-modal-hide="popup-modal" class="text-white bg-red-600 hover:bg-red-800 focus:ring-4 focus:outline-none focus:ring-red-300 dark:focus:ring-red-800 font-medium rounded-lg text-sm inline-flex items-center px-5 py-2.5 text-center">
                    Yes, I'm sure
                </a>
                <button data-modal-hide="popup-modal" type="button" class="py-2.5 px-5 ms-3 text-sm font-medium text-gray-900 focus:outline-none bg-white rounded-lg border border-gray-200 hover:bg-gray-100 hover:text-blue-700 focus:z-10 focus:ring-4 focus:ring-gray-100 dark:focus:ring-gray-700 dark:bg-gray-800 dark:text-gray-400 dark:border-gray-600 dark:hover:text-white dark:hover:bg-gray-700">No, cancel</button>
            </div>
        </div>
    </div>
</div>

<c:if test="${empty userobj}">
    <c:redirect url="Index.jsp"></c:redirect>
</c:if>

<script>
    document.addEventListener("DOMContentLoaded", function() {
        const currentPage = window.location.pathname.split("/").pop();
        const links = document.querySelectorAll("nav a, nav button");

        links.forEach(link => {
            const href = link.getAttribute("href");
            if (href === currentPage) {
                link.classList.add("active");
            } else {
                link.classList.remove("active");
            }
        });

        const logoutButton = document.getElementById("logout-btn");
        const modal = document.getElementById("popup-modal");

        logoutButton.addEventListener("click", function() {
            modal.classList.remove("hidden");
            modal.classList.add("flex");
        });

        document.querySelectorAll("[data-modal-hide]").forEach(button => {
            button.addEventListener("click", function() {
                modal.classList.add("hidden");
                modal.classList.remove("flex");
            });
        });

        const dropdownButton = document.getElementById("dropdown-btn");
        const dropdownMenu = document.getElementById("dropdown-menu");

        dropdownButton.addEventListener("click", function() {
            dropdownMenu.classList.toggle("hidden");
        });
    });
</script>

<style>
    /* Modal style adjustments */
    #popup-modal {
        top: 4rem; /* Adjust the top position to avoid overlapping with the navbar */
        z-index: 999; /* Ensure modal appears above the navbar */
    }
    
    /* Smooth transition for modal */
    .transition-transform {
        transition-property: transform, opacity;
        transition-duration: 300ms;
        transition-timing-function: ease-out;
    }
    
    /* Hide and show styles */
    .hidden {
        display: none;
        transform: translateY(-50px); /* Initial off-screen position */
        opacity: 0;
    }
    
    .flex {
        display: flex;
        transform: translateY(0);
        opacity: 1;
    }
    
    /* Active link style */
    .active {
        background-color: #2563eb; /* Tailwind's blue-600 */
    }
</style>
