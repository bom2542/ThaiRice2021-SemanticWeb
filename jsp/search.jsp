<form action="index.jsp" name="Search" onsubmit="return validateForm()" method="POST">
    <div class="input-group mb-2 mt-5">
        <div class="input-group-append">
            <select id="mySelect" onchange="TypeRice()" class="form-select font-weight-bold" aria-label="Default select example" name="fill" value="${param["fill"]}">
                <option value="0" selected>Thai Rice</option>
                <option value="1">Type Rice</option>
                <option value="2">Zone Made</option>
                <option value="3">Physical</option>
            </select>
        </div>
        <input type="text" class="form-control" placeholder="Enter word of search ..." name="qstring" value="${param["qstring"]}" >
        <div class="input-group-append">
            <input class="btn btn-primary" type="submit" value="Search">
        </div>
    </div>
</form>