<form action="index.jsp" name="Search" onsubmit="return validateForm()" method="POST">
    <div class="input-group mb-2 mt-5">
        <div class="input-group-append">
            <select class="form-select font-weight-bold" aria-label="Default select example" name="fill" value="${param["fill"]}">
                <option selected value="0" class="font-weight-bold">Thai Rice</option>
                <option value="1" class="font-weight-bold">Type Rice</option>
                <option value="2" class="font-weight-bold">Zone Made</option>
            </select>
        </div>
        <input type="text" class="form-control" placeholder="Enter word of search ..." name="qstring" value="${param["qstring"]}" >
        <div class="input-group-append">
            <input class="btn btn-primary" type="submit" value="Search">
        </div>
    </div>
</form>