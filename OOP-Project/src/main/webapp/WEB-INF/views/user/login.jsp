<jsp:include page="/WEB-INF/views/header.jsp">
    <jsp:param name="title" value="Login"/>
</jsp:include>

<!-- Include Lottie Player Script -->
<script src="https://unpkg.com/@dotlottie/player-component@latest/dist/dotlottie-player.mjs" type="module"></script>

<form action="/login" method="post">
    <div class="flex flex-col items-center justify-center h-screen">
        <div class="w-full max-w-sm">
            <div class="bg-white shadow-md rounded px-8 pt-6 pb-8 mb-4">
                
                <!-- Add Lottie animation for the logo -->
                <div class="flex justify-center mb-4">
                    <dotlottie-player src="https://lottie.host/e8f8de7a-d734-4790-8fa9-0b41ef5a3436/7jS4fLjL9v.json" background="transparent" speed="1" style="width: 150px; height: 150px;" loop autoplay></dotlottie-player>
                </div>

                <div class="mb-4">
                    <label class="block text-gray-700 text-sm font-bold mb-2" for="email">   
                        Email
                    </label>
                    <input class="shadow appearance-none border rounded w-full py-2 px-3 text-gray-700 leading-tight focus:outline-none focus:shadow-outline" id="email" type="email" placeholder="Email" name="email">
                </div>
                <div class="mb-6">
                    <label class="block text-gray-700 text-sm font-bold mb-2" for="password">
                        Password
                    </label>
                    <input class="shadow appearance-none border border-red-500 rounded w-full py-2 px-3 text-gray-700 mb-3 leading-tight focus:outline-none focus:shadow-outline" id="password" type="password" placeholder="******************" name="password">
                    <p class="text-red-500 text-xs italic">Please type your password.</p>
                </div>
                <div class="flex items-center justify-between">
                    <!-- Modify the Sign In button to include animation -->
                    <button class="bg-blue-500 hover:bg-blue-700 text-white font-bold py-2 px-4 rounded focus:outline-none focus:shadow-outline flex items-center" type="submit">
                        <span>Sign In</span>
                        <!-- Add the Lottie animation next to the text -->
                        <dotlottie-player src="https://lottie.host/6f0d49f5-33d9-4691-962b-b7bcb56012bd/l4udD43ni6.json" background="transparent" speed="1" style="width: 30px; height: 30px; margin-left: 10px;" loop autoplay></dotlottie-player>
                    </button>
                    <a class="inline-block align-baseline font-bold text-sm text-blue-500 hover:text-blue-800" href="/add-user">
                        Don't have an account?
                    </a>
                </div>
            </div>
        </div>
    </div>
</form>

<jsp:include page="/WEB-INF/views/footer.jsp"></jsp:include>
