<form action="index.jsp" name="Search" onsubmit="return validateForm()" method="POST">
    <div class="input-group mb-2 mt-5">
        <input type="text" class="form-control" placeholder="Enter word of search ..." name="qstring" value="${param.qstring}" >
        <div class="input-group-append">
            <input class="btn btn-primary" type="submit" value="Search">
        </div>
    </div>
</form>