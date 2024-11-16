<jsp:include page="/WEB-INF/views/header.jsp">
    <jsp:param name="title" value="Home"/>
</jsp:include>

<%@page import="java.util.ArrayList"%>
<%@page import="model.user.User"%>

<!-- Full Page Image Header with Vertically Centered Content -->
<header class="masthead">
    <div class="container h-100">
        <div class="row h-100 align-items-center">
            <div class="col-12 text-center">
            
                <h1 class="text-7xl fw-light">Endless Events</h1>
                <br/>
                <p class="text-xl lead">We Create Your Imagination</p>
                
                <!-- DotLottie Player Script and Component -->
                <script src="https://unpkg.com/@dotlottie/player-component@latest/dist/dotlottie-player.mjs" type="module"></script>
                <div class="d-flex justify-content-center"> <!-- Centering container -->
                    <dotlottie-player src="https://lottie.host/50a2f4b5-993b-4235-b5be-ca6154590050/MhbWhdLfIN.json" 
                        background="transparent" speed="1" style="width: 300px; height: 300px;" loop autoplay>
                    </dotlottie-player>
                </div>

                <!-- Description Section with New Lottie Animation -->
                <p style="font-family: 'Arial', sans-serif; font-weight: bold; color: Gray; font-size: 18px; text-align: center; margin-top: 20px;">
                    "Endless Event Planning: Your One-Stop Solution for Unforgettable Events! Whether it's a birthday, wedding, anniversary, or corporate gathering, we make planning easy and stress-free. Explore custom packages, connect with top vendors, and create memories that last a lifetime. Let's make your dream event a reality!"
                </p>

                <!-- Second Lottie Animation after the description -->
                <script src="https://unpkg.com/@dotlottie/player-component@latest/dist/dotlottie-player.mjs" type="module"></script>
                <div class="d-flex justify-content-center"> <!-- Centering container -->
                    <dotlottie-player src="https://lottie.host/9b17edc5-9ef8-40a7-9dfb-203329313403/ypF6mSdEaU.json" 
                        background="transparent" speed="1" style="width: 300px; height: 300px;" loop autoplay>
                    </dotlottie-player>
                </div>
            </div>
        </div>
    </div>
</header>

<!-- Removed "Our Services" Section -->

<script src="${pageContext.request.contextPath}/js/home.js"></script>

<jsp:include page="/WEB-INF/views/footer.jsp"></jsp:include>