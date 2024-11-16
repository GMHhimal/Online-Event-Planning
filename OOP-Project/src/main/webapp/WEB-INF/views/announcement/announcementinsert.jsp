<jsp:include page="/WEB-INF/views/header.jsp">
	<jsp:param name="title" value="Add Announcement"/>
</jsp:include>

<form class="flex justify-center" action="/create-announcement" method="post" onsubmit="return validateForm()">
    <div class="form-group">
        <label for="title">Announcement Title</label>
        <input type="text" class="form-control" id="title" name="title" placeholder="Announcement Title" required minlength="5" maxlength="100">

        <label for="description">Announcement Description</label>
        <input type="text" class="form-control" id="description" name="description" placeholder="Announcement Description" required minlength="10" maxlength="255">
        
        <button type="submit" class="btn btn-primary">Add Announcement</button>
    </div>
</form>

<script>
    function validateForm() {
        let title = document.getElementById("title").value;
        let description = document.getElementById("description").value;

        if (title.length < 5) {
            alert("Title must be at least 5 characters long.");
            return false;
        }
        if (description.length < 10) {
            alert("Description must be at least 10 characters long.");
            return false;
        }
        return true;
    }
</script>

<jsp:include page="/WEB-INF/views/footer.jsp"></jsp:include>
