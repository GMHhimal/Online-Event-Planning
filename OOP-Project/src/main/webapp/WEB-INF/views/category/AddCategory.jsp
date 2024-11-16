<jsp:include page="/WEB-INF/views/header.jsp">
    <jsp:param name="title" value="AddCategory"/>
</jsp:include>

<form class="flex justify-center" action="/AddCategory" method="post" onsubmit="return validateForm()">
    <div class="form-group">    
        <label for="name">Name</label>
        <input type="text" class="form-control" id="name" name="name" placeholder="Name">
        
        <label for="description">Description</label>
        <input type="text" class="form-control" id="description" name="description" placeholder="Description">

        <button type="submit" class="btn btn-primary">Submit</button>  
    </div>
</form>

<jsp:include page="/WEB-INF/views/footer.jsp"></jsp:include>

<script>
function validateForm() {
    const name = document.getElementById('name').value.trim();
    const description = document.getElementById('description').value.trim();

    if (name === "") {
        alert("Name is required.");
        return false;
    }

    if (description === "") {
        alert("Description is required.");
        return false;
    }

    return true; // Allow form submission if validation passes
}
</script>
