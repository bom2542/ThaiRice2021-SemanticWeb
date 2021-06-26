<%-- Navbar Footer --%>
<nav class="navbar navbar-light bg-info mt-5 justify-content-center">
    <a class="navbar-brand" href="index.jsp" style="font-size: 16px; color: aliceblue;">
        <img src="./jsp/img/Rice.png" width="20" class="d-inline-block align-top">
        ThaiRice2021 Project, IT @SUT
    </a>
</nav>

<script>
    function validateForm() {
      let x = document.forms["Search"]["qstring"].value;
      if (x == "") {
        alert("Enter word of search !!!");
        return false;
      }
    }
</script>