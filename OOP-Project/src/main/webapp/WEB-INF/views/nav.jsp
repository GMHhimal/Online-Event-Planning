<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Endless Events</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css">
    <!-- Ionicons script -->
    <script type="module" src="https://unpkg.com/ionicons@5.5.2/dist/ionicons/ionicons.esm.js"></script>
    <script nomodule src="https://unpkg.com/ionicons@5.5.2/dist/ionicons/ionicons.js"></script>
    <style>
        /* Updated navbar with new colors */
        nav {
            background-color: #cddcfd; /* Background color */
        }
        nav a {
            color: #3d43fb; /* Font color */
        }
        nav a:hover {
            color: #fff; /* Font color on hover */
            background-color: #3d43fb; /* Background on hover */
        }
        /* Mobile menu button */
        .toggle-menu svg {
            fill: #3d43fb;
        }
        .toggle-menu svg:hover {
            fill: #fff;
        }
        /* Profile and icon colors */
        .dark:hover:text-green-300 {
            color: #3d43fb !important;
        }
        /* Announcement icon position */
        .announcement-icon {
            position: absolute;
            right: 1rem; /* Adjust as needed */
            top: 50%; /* Center vertically */
            transform: translateY(-50%); /* Center the icon */
        }
    </style>
</head>
<body>
    
    <!-- Navigation -->
    <nav class="shadow fixed top-0 w-full z-10">
        <div class="container px-6 py-3 mx-auto relative"> <!-- Added 'relative' to the container -->
            <div class="md:flex md:items-center md:justify-between">
                <div class="flex items-center justify-between">
                    <div class="text-xl font-semibold">
                        <a href="/" class="flex items-center">
                            <img src="${pageContext.request.contextPath}/images/logo.png" alt="Endless Events Logo" class="h-12"> <!-- Logo Image -->
                        </a>
                    </div>
                    <!-- Mobile menu button -->
                    <div class="flex md:hidden">
                        <button type="button" class="toggle-menu" aria-label="toggle menu">
                            <svg viewBox="0 0 24 24" class="w-6 h-6">
                                <path fill-rule="evenodd" d="M4 5h16a1 1 0 0 1 0 2H4a1 1 0 1 1 0-2zm0 6h16a1 1 0 0 1 0 2H4a1 1 0 1 1 0-2zm0 6h16a1 1 0 0 1 0 2H4a1 1 0 1 1 0-2z"></path>
                            </svg>
                        </button>
                    </div>
                </div>
                
                <!-- Mobile Menu open: "block", Menu closed: "hidden" -->
                <div class="flex-1 md:flex md:items-center md:justify-between hidden mobile-menu">
                    <div class="flex flex-col -mx-4 md:flex-row md:items-center md:mx-8">
                        <a href="/events" class="px-2 py-1 mx-2 mt-2 text-sm font-medium transition-colors duration-200 transform rounded-md md:mt-0 hover:text-white hover:bg-#3d43fb">
                            <ion-icon name="calendar-outline"></ion-icon> Events
                        </a>
                        <a href="/contact-us" class="px-2 py-1 mx-2 mt-2 text-sm font-medium transition-colors duration-200 transform rounded-md md:mt-0 hover:text-white hover:bg-#3d43fb">
                            <ion-icon name="mail-outline"></ion-icon> Contact Us
                        </a>
                        <a href="/categories" class="px-2 py-1 mx-2 mt-2 text-sm font-medium transition-colors duration-200 transform rounded-md md:mt-0 hover:text-white hover:bg-#3d43fb">
                            <ion-icon name="list-outline"></ion-icon> Categories
                        </a>
                        
                        <!-- Session Check for Login/Logout and Admin Panel -->
                        <%
                            String role = (String)session.getAttribute("role");

                            if(session.getAttribute("id") == null){
                                out.print("<a href='/login' class='px-2 py-1 mx-2 mt-2 text-sm font-medium transition-colors duration-200 transform rounded-md md:mt-0 hover:text-white hover:bg-#3d43fb'>");
                                out.print("<ion-icon name='log-in-outline'></ion-icon> Login</a>");
                                out.print("<a href='/add-user' class='px-2 py-1 mx-2 mt-2 text-sm font-medium transition-colors duration-200 transform rounded-md md:mt-0 hover:text-white hover:bg-#3d43fb'>");
                                out.print("<ion-icon name='person-add-outline'></ion-icon> Register</a>");
                            }
                            else if (role.equals("admin")) {
                                out.print("<a href='/dashboard' class='px-2 py-1 mx-2 mt-2 text-sm font-medium transition-colors duration-200 transform rounded-md md:mt-0 hover:text-white hover:bg-#3d43fb'>");
                                out.print("<ion-icon name='settings-outline'></ion-icon> Admin Panel</a>");
                            }
                            else {
                                out.print("<a href='/dashboard' class='px-2 py-1 mx-2 mt-2 text-sm font-medium transition-colors duration-200 transform rounded-md md:mt-0 hover:text-white hover:bg-#3d43fb'>");
                                out.print("<ion-icon name='home-outline'></ion-icon> Dashboard</a>");
                            }
                        %>
                        
                        <!-- Profile and Logout -->
                        <div class="flex items-center mt-3 md:mt-0">
                            <%
                                if(session.getAttribute("id") != null){
                                    out.print("<a class='mx-4 text-green-600 md:block dark:text-green-200 hover:text-green-700 dark:hover:text-green-400 focus:text-green-700 dark:focus:text-green-400 focus:outline-none' href='/logout'>");
                                    out.print("<ion-icon name='log-out-outline'></ion-icon></a>");

                                    out.print("<a href='/profile' class='flex items-center focus:outline-none' aria-label='toggle profile dropdown'>");
                                    out.print("    <div class='w-8 h-8 overflow-hidden border-2 border-green-400 rounded-full'>");
                                    out.print("        <img src='https://avatars.dicebear.com/api/micah/" + session.getAttribute("fname") +".svg' class='object-cover w-full h-full' alt='avatar'>");
                                    out.print("    </div>");
                                    out.print("    <h3 class='mx-2 text-sm font-medium text-green-700 dark:text-green-200'>" + session.getAttribute("fname") +"</h3>");
                                    out.print("</a>");
                                }
                            %>
                        </div>
                    </div>
                </div>
            </div>

            <!-- Announcement Icon Positioned at Right Corner -->
            <a href="/announcements" class="announcement-icon" aria-label="show notifications">
                <ion-icon name="notifications-outline" class="w-6 h-6 text-green-600 hover:text-green-700"></ion-icon>
            </a>
        </div>
    </nav>

    <script src="${pageContext.request.contextPath}/js/header/nav.js"></script>
</body>
</html>
