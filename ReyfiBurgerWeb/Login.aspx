<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="ReyfiBurgerWeb.Login" %>

<!DOCTYPE html>
<link href="//maxcdn.bootstrapcdn.com/bootstrap/3.3.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<script src="//maxcdn.bootstrapcdn.com/bootstrap/3.3.0/js/bootstrap.min.js"></script>
<script src="//code.jquery.com/jquery-1.11.1.min.js"></script>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
<html>
<head runat="server">
    <title></title>

      <%--Librerias para el toast--%>
    <link href="./Media/css/Grey/ListBox.Grey.css" rel="stylesheet" type="text/css" />
    <link href="./Media/css/WebTrack.css" rel="stylesheet" type="text/css" />
    <script src="http://code.jquery.com/jquery-1.9.1.min.js" type="text/javascript"></script>
    <link href="https://cdnjs.cloudflare.com/ajax/libs/toastr.js/2.0.1/css/toastr.css"
        rel="stylesheet" />
    <script src="https://cdnjs.cloudflare.com/ajax/libs/toastr.js/2.0.1/js/toastr.js"
        type="text/javascript"></script>
    <%--Programacion en Javascript para que funcione el toast--%>
    <script type="text/javascript">
        function Notify(msg, title, type, clear, pos, sticky) {
            if (clear == true) {
                toastr.clear();
            }
            if (sticky == true) {
                toastr.tapToDismiss = true;
                toastr.timeOut = 10000;
            }

            toastr.options.onclick = function () {
                //alert('You can perform some custom action after a toast goes away'); 
            }
            //"toast-top-left"; 
            toastr.options.positionClass = pos;
            if (type.toLowerCase() == 'info') {
                toastr.options.timeOut = 1000;
                toastr.tapToDismiss = true;
                toastr.info(msg, title);
            }
            if (type.toLowerCase() == 'success') {
                toastr.options.timeOut = 1500;
                toastr.success(msg, title);
            }
            if (type.toLowerCase() == 'warning') {
                toastr.options.timeOut = 3000;
                toastr.warning(msg, title);
            }
            if (type.toLowerCase() == 'error') {
                toastr.options.timeOut = 10000;
                toastr.error(msg, title);
            }
        }

    </script>

</head>
<body>
        
      <div id="login-button">
        <img src="/Resources/Hamburger.png" >
      </div>
      <div id="container" class="col-md-12">
        <h1>Reyfi´s Burger</h1>

        <form runat=server >
            <asp:TextBox ID="UsuarioTextBox" runat="server" placeholder="Usuario"></asp:TextBox>
            <asp:TextBox ID="ContraseñaTextBox" runat="server" placeholder="Contraseña" type="password"></asp:TextBox>
            <asp:Button ID="LoginButton" style="font-family: Freestyle Script; font-size:50px" runat="server" Text="Log In" OnClick="LoginButton_Click" />
        </form>
       </div>
    <script>
        $('#login-button').click(function () {
            $('#Saludo').fadeOut("slow");
            $('#login-button').fadeOut("slow", function () {  
                $("#container").fadeIn("slow");
                TweenMax.from("#container", .4, { scale: 0, ease:Sine.easeInOut});
                TweenMax.to("#container", .4, { scale: 1, ease:Sine.easeInOut});
        });
        });
    </script>

    <style>
        html
        { 
            background-image: url("/Resources/fondo.jpg");
            background-size: cover;
            overflow: hidden;
        }
        img
        {
          display: block;
          margin: auto;
          width: 100%;
          height: auto;
        }

        #login-button{
          cursor: pointer;
          position: absolute;
          top: 0;
          left: 0;
          right: 0;
          bottom: 0;
          padding: 30px;
          margin: auto;
          width: 150px;
          height: 150px;
          border-radius: 50%;
          background: #FF9021;
          overflow: hidden;
          /*opacity: 0.7;
          box-shadow: 10px 10px 30px #000*/;}

        /* Login container */
        #container{
          position: absolute;
          top: 0;
          left: 0;
          right: 0;
          bottom: 0;
          margin: auto;
          width: 340px;
          height: 340px;
          border-radius: 15px;
          background: #FF9021;
          box-shadow: 1px 1px 50px #000;
          display: none;
        }


        h1{
          font-family:Freestyle Script;
          position: relative;
          margin-top: 35px;
          text-align: center;
          font-size: 50px;
          color: #ddd;
          text-shadow: 3px 3px 10px #000;
        }

        /* Inputs */
        a,
        input{
          font-family: 'Open Sans Condensed', sans-serif;
          text-decoration: none;
          position: relative;
          width: 80%;
          display: block;
          margin: 9px auto;
          font-size: 17px;
          color: #fff;
          padding: 8px;
          border-radius: 6px;
          border: none;
          background: rgba(3,3,3,.1);
          -webkit-transition: all 2s ease-in-out;
          -moz-transition: all 2s ease-in-out;
          -o-transition: all 2s ease-in-out;
          transition: all 0.2s ease-in-out;
        }

        input:focus{
          outline: none;
          box-shadow: 3px 3px 10px #333;
          background: rgba(255,255,255,.5);
        }

        /* Placeholders */
        ::-webkit-input-placeholder {
           color: #ddd;  }
        :-moz-placeholder { /* Firefox 18- */
           color: red;  }
        ::-moz-placeholder {  /* Firefox 19+ */
           color: red;  }
        :-ms-input-placeholder {  
           color:#ddd;  }

        /* Link */
        button{
          font-family: Freestyle Script; font-size:50px;
          text-align: center;
          padding: 4px 8px;
          background: #ff4500;
        }

        a:hover{
          opacity: 0.7;
        }

        #remember-container{
          position: relative;
          margin: -5px 20px;
        }


        .orange-btn{
          background: #ddd;
        }
    </style>
</body>
</html>
