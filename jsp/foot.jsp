<%-- Navbar Footer --%>
<nav class="navbar navbar-light bg-info mt-5 justify-content-center" id="footer">
    <a class="navbar-brand" href="index.jsp" style="font-size: 16px; color: aliceblue;">
        <img src="./jsp/img/Rice.png" width="20" class="d-inline-block align-top">
        ThaiRice2021 Project, IT @SUT
    </a>
</nav>

<button id="topBtn"><i class="fas fa-arrow-up"></i></button>

<script>

    function TypeRice() {
        var x = document.getElementById("mySelect").value;
        if(x === "0" || x === "3")
            document.getElementById("keyword").innerHTML = "<b style='color: green;'>Advice keyword search : </b> Enter thai rice (english name) for search";
        else if(x === "1")
            document.getElementById("keyword").innerHTML = "<b style='color: #e74c3c;'>Type rice keyword search!! : </b> Barley,  Fragrant, Japan, MixedPaddy, Paddy and Sticky";
        else if(x === "2")
            document.getElementById("keyword").innerHTML = "<b style='color: #e74c3c;'>Zone made keyword search!! : </b> All, Center, East, Lower east north, Lower north, Lower south, Upper east north, Upper north, Upper south, and West";
        else
            document.getElementById("keyword").innerHTML = "You selected: 1";
    }

    function validateForm() {
      let x = document.forms["Search"]["qstring"].value;
      if (x == "") {
        alert("Enter word of search !!!");
        return false;
      }
    }

    window.addEventListener("load", function () {
        const loader = document.querySelector(".loader");
        loader.className += " hidden"; // class "loader hidden"
    });

    $(document).ready(function(){
        $(window).scroll(function(){
            if($(this).scrollTop() > 40){
                $('#topBtn').fadeIn();
            } else{
                $('#topBtn').fadeOut();
            }
        });

        $("#topBtn").click(function(){
            $('html ,body').animate({scrollTop : 0},800);
        });
    });

</script>