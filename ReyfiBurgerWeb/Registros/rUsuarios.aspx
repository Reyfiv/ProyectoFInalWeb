<%@ Page Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="rUsuarios.aspx.cs" Inherits="ReyfiBurgerWeb.Registros.rUsuarios" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <div class="panel" style="background-color: #FF9021">
        <div class="panel-heading" style="font-family: Freestyle Script; font-size: 25px; color: #ffffff">Registro de Usuarios</div>
    </div>
    <div class="panel-body">
        <div class="form-horizontal col-md-12" role="form">
            <%--UsuarioId--%>
            <div class="form-group">
                <label for="UsuarioIdTextBox" class="col-md-3 control-label input-sm" style="font-size: medium">Usuario Id</label>
                <div class="col-md-1 ">
                    <asp:TextBox ID="UsuarioIdTextBox" runat="server" placeholder="0" class="form-control input-sm" Style="font-size: medium" TextMode="Number"></asp:TextBox>
                </div>
                <asp:RegularExpressionValidator ID="ValidaID" runat="server" ErrorMessage='Campo "Usuario Id" solo acepta numeros' ControlToValidate="UsuarioIdTextBox" ValidationExpression="^[0-9]*" Text="*" ForeColor="Red" Display="Dynamic" ToolTip="Entrada no valida" ValidationGroup="Guardar"></asp:RegularExpressionValidator>
                <div class="col-md-1 ">
                    <asp:Button ID="BuscarButton" runat="server" Text="Buscar" class="btn btn-info btn-sm" OnClick="BuscarButton_Click" />
                </div>
            </div>
            <%-- Nombres--%>
            <div class="form-group">
                <label for="NombresTextBox" class="col-md-3 control-label input-sm" style="font-size: medium">Nombres</label>
                <div class="col-md-6">
                    <asp:TextBox ID="NombresTextBox" runat="server" class="form-control input-sm" Style="font-size: medium"></asp:TextBox>
                </div>
                <asp:RequiredFieldValidator ID="Valida" runat="server" ErrorMessage="El campo &quot;Nombres&quot; esta vacio" ControlToValidate="NombresTextBox" ForeColor="Red" Display="Dynamic" ToolTip="Campo Nombres es obligatorio" ValidationGroup="Guardar">*</asp:RequiredFieldValidator>
            </div>
            <%-- Nombre Usuario--%>
            <div class="form-group">
                <label for="NombreUsuarioTextBox" class="col-md-3 control-label input-sm" style="font-size: medium">Nombre de usuario</label>
                <div class="col-md-6">
                    <asp:TextBox ID="NombreUsuarioTextBox" runat="server" class="form-control input-sm" Style="font-size: medium"></asp:TextBox>
                </div>
                <asp:RequiredFieldValidator ID="ValidaUser" runat="server" ControlToValidate="NombreUsuarioTextBox" ForeColor="Red" Display="Dynamic" ValidationGroup="Guardar">*</asp:RequiredFieldValidator>
            </div>
            <%--Contraseña--%>
            <div class="form-group">
                <label for="ContraseñaTextBox" class="col-md-3 control-label input-sm" style="font-size: medium">Contraseña</label>
                <div class="col-md-6">
                    <asp:TextBox type="password" ID="ContraseñaTextBox" runat="server" class="form-control input-sm" Style="font-size: medium"></asp:TextBox>
                </div>
                <asp:RequiredFieldValidator ID="ValidaContraseña" runat="server" ErrorMessage="El campo &quot;Contraseña&quot; esta vacio" ControlToValidate="ContraseñaTextBox" ForeColor="Red" Display="Dynamic" ToolTip="Campo Contraseña obligatorio" ValidationGroup="Guardar">*</asp:RequiredFieldValidator>
            </div>
            <%--Confirmar Contraseña--%>
            <div class="form-group">
                <label for="ConfirmarContraseñaTextBox" class="col-md-3 control-label input-sm" style="font-size: medium">Confirmar Contraseña</label>
                <div class="col-md-6">
                    <asp:TextBox type="password" ID="ConfirmarContraseñaTextBox" runat="server" class="form-control input-sm" Style="font-size: medium"></asp:TextBox>
                </div>
                <asp:CompareValidator ID="ComparaContraseñas" runat="server" ErrorMessage="Las Contraseñas no son iguales" ControlToValidate="ConfirmarContraseñaTextBox" ControlToCompare="ContraseñaTextBox" ForeColor="Red" Display="Dynamic" ToolTip="Las Contraseñas no son iguales" ValidationGroup="Guardar">*</asp:CompareValidator>
                <asp:RequiredFieldValidator ID="ValidaConfirmarContraseña" runat="server" ErrorMessage="El campo &quot;Nombres&quot; estas vacio" ControlToValidate="ConfirmarContraseñaTextBox" ForeColor="Red" Display="Dynamic" ToolTip="Campo Confirmar Contraseña obligatorio" ValidationGroup="Guardar">*</asp:RequiredFieldValidator>
            </div>
            <%--Tipo Usuario--%>
            <div class="form-group">
                <label for="TipoUsuarioDropDownList" class="col-md-3 control-label input-sm" style="font-size: medium">Tipo Usuario</label>
                <div class="col-md-6">
                    <asp:DropDownList ID="TipoUsuarioDropDownList" runat="server" Class="form-control input-sm" Style="font-size: medium">
                        <asp:ListItem Selected="True">Administrador</asp:ListItem>
                        <asp:ListItem>Cajero</asp:ListItem>
                    </asp:DropDownList>
                </div>
            </div>
            <%--Total Vendido--%>
            <div class="form-group">
                <label for="TotalVendidoTextBox" class="col-md-3 control-label input-sm" style="font-size: medium">Total Vendido</label>
                <div class="col-md-6">
                    <asp:TextBox  ID="TotalVendidoTextBox" runat="server" class="form-control input-sm" Style="font-size: medium" ReadOnly="true"></asp:TextBox>
                </div>
            </div>
            <%--Fecha--%>
            <div class="form-group">
                <div class="col-md-6">
                    <asp:TextBox ID="FechaTextBox" TextMode="Date" runat="server" class="form-control input-sm" Style="font-size: medium" Visible="false"></asp:TextBox>
                </div>
            </div>
            <br />
            <%--Botones--%>
            <div class="panel">
                <div class="text-center">
                    <div class="form-group">
                        <asp:Button ID="NuevoButton" runat="server" Text="Nuevo" class="btn btn-primary btn-lg" OnClick="NuevoButton_Click" />
                        <asp:Button ID="GuardarButton" runat="server" Text="Guardar" class="btn btn-success btn-lg" ValidationGroup="Guardar" OnClick="GuardarButton_Click" />
                        <asp:Button ID="EliminarButton" runat="server" Text="Eliminar" class="btn btn-danger btn-lg" OnClick="EliminarButton_Click" />
                    </div>
                </div>
            </div>
        </div>
    </div>
</asp:Content>
