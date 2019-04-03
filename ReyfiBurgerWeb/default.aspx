<%@ Page Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="default.aspx.cs" Inherits="ReyfiBurgerWeb._default" %>

<asp:Content ID="Content4" ContentPlaceHolderID="MainContent" runat="server">

    <div class="panel" style="background-color: #FF9021; text-align: center">
        <div class="panel-heading" style="font-family: Freestyle Script; font-size: 70px; color: #ffffff">Bienvenidos</div>
    </div>
    <div id="myCarousel" class="carousel slide" data-ride="carousel">
        <!-- Indicators -->
        <ol class="carousel-indicators">
            <li data-target="#myCarousel" data-slide-to="0" class="active"></li>
            <li data-target="#myCarousel" data-slide-to="1"></li>
            <li data-target="#myCarousel" data-slide-to="2"></li>
        </ol>

        <!-- Wrapper for slides -->
        <div class="carousel-inner">
            <div class="item active" style="text-align:center">
                <img src="/Resources/Logo.png" alt="">
            </div>
            <div class="item" style="text-align:center">
                <img src="/Resources/Hamburger.png" alt="">
            </div>
            <div class="item" style="text-align:center">
                <img src="/Resources/fondo.jpg" alt="">
            </div>
        </div>

        <!-- Controls -->
        <a class="left carousel-control" href="#myCarousel" data-slide="prev">
            <span class="glyphicon glyphicon-chevron-left"></span>
            <span class="sr-only">Previous</span>
        </a>
        <a class="right carousel-control" href="#myCarousel" data-slide="next">
            <span class="glyphicon glyphicon-chevron-right"></span>
            <span class="sr-only">Next</span>
        </a>
    </div>
    <br />
    <br />
</asp:Content>
