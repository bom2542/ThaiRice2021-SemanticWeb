<!-- Default html s-->
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>[ Welcome ] - ThaiRice2021</title>
<!-- icon title file -->
<link rel = "icon" href = "./jsp/img/Rice.png" type = "image/x-icon">
<!-- google font-->
<link rel="preconnect" href="https://fonts.gstatic.com">
<link href="https://fonts.googleapis.com/css2?family=Kanit:wght@200&family=Sarabun:wght@300&display=swap" rel="stylesheet">
<!-- boostrap v4 -->
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<!-- font awesome v5 -->
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.9.0/css/all.min.css">
<!-- jquery-->
<script src="https://code.jquery.com/jquery-2.1.3.min.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<style>
    body {
        font-family: 'Kanit', sans-serif;
        background-color: rgba(248, 248, 248, 0.973);
    }

    html {
        scroll-behavior: smooth;
    }

    .loader {
        position: fixed;
        z-index: 99;
        top: 0;
        left: 0;
        width: 100%;
        height: 100%;
        background: white;
        display: flex;
        justify-content: center;
        align-items: center;
    }

    .loader > img {
        width: 100px;
    }

    .loader.hidden {
        animation: fadeOut 1s;
        animation-fill-mode: forwards;
    }

    @keyframes fadeOut {
        100% {
            opacity: 0;
            visibility: hidden;
        }
    }

    .thumb {
        height: 100px;
        border: 1px solid black;
        margin: 10px;
    }

    #topBtn{
        position: fixed;
        bottom: 40px;
        right: 40px;
        font-size: 22px;
        width: 50px;
        height: 50px;
        background: #e74c3c;
        color: white;
        border: none;
        cursor: pointer;
        display: none;
    }

    td.img {
        align-content: center;
    }

</style>