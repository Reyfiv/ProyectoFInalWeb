<%@ Page Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="rProductos.aspx.cs" Inherits="ReyfiBurgerWeb.Registros.rProductos" %>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
        <div class="panel" style = "background-color:#FF9021">
           <div class="panel-heading" style="font-family:Freestyle Script; font-size:25px; color:#ffffff" >Registro de Productos</div>
        </div>
        <div class="panel-body">
         <div class="form-horizontal col-md-12" role="form">
            <%--Producto Id--%>
            <div class="form-group">
                <label for="ProductoIdTextBox" class="col-md-3 control-label input-sm" style="font-size:medium">Producto Id</label>
                <div class="col-md-1 ">
                    <asp:TextBox ID="ProductoIdTextBox" runat="server" placeholder="0" class="form-control input-sm" Style="font-size:medium" TextMode="Number"></asp:TextBox>                  
                </div>
                    <asp:RegularExpressionValidator ID="ValidaID" runat="server" ControlToValidate="ProductoIdTextBox" ValidationExpression="^[0-9]*" Text="*" ForeColor="Red" Display="Dynamic" ToolTip="Entrada no valida" ValidationGroup="Guardar"></asp:RegularExpressionValidator>
                <div class="col-md-1 ">
                    <asp:Button ID="BuscarButton" runat="server" Text="Buscar" class="btn btn-info btn-sm" OnClick="BuscarButton_Click" />
                </div>
            </div>
            <%-- Nombre producto--%>
            <div class="form-group">
                <label for="NombreProductoTextBox" class="col-md-3 control-label input-sm" style="font-size:medium">Nombre del producto</label>
                <div class="col-md-6">
                    <asp:TextBox ID="NombreProductoTextBox" runat="server" class="form-control input-sm" style="font-size:medium"></asp:TextBox>
                </div>
                <asp:RequiredFieldValidator ID="Valida" runat="server" ControlToValidate="NombreProductoTextBox" ForeColor="Red" Display="Dynamic" ValidationGroup="Guardar">*</asp:RequiredFieldValidator>
            </div>
            <%--Tipo de producto--%>
            <div class="form-group">
                <label for="TipoProductoDropDownList" class="col-md-3 control-label input-sm" style="font-size:medium">Tipo de producto</label>
                <div class="col-md-6">
                    <asp:DropDownList ID="TipoProductoDropDownList" runat="server" Class="form-control input-sm" style="font-size:medium" >
                        <asp:ListItem Selected="True">Carne de Res</asp:ListItem>
                        <asp:ListItem>Filete de pollo</asp:ListItem>
                        <asp:ListItem>Papas Fritas</asp:ListItem>
                        <asp:ListItem>Soda</asp:ListItem>
                        <asp:ListItem>Helado</asp:ListItem>
                    </asp:DropDownList>
                </div>
             </div>
                <%--Precio--%>
             <div class="form-group">
                   <label for="PrecioTextBox" class="col-md-3 control-label input-sm" style="font-size:medium">Nombre del producto</label>
                   <div class="col-md-6">
                        <asp:TextBox ID="PrecioTextBox" runat="server" class="form-control input-sm" style="font-size:medium" TextMode="Number" placeholder="0.00"></asp:TextBox>
                   </div>
                   <asp:RegularExpressionValidator ID="ValidaNumPre" runat="server" ControlToValidate="PrecioTextBox" ValidationExpression="^[0.00-9.00]*" Text="*" ForeColor="Red" Display="Dynamic" ToolTip="Entrada no valida" ValidationGroup="Guardar"></asp:RegularExpressionValidator>
                   <asp:RequiredFieldValidator ID="ValidaCampo" runat="server" ControlToValidate="PrecioTextBox" ForeColor="Red" Display="Dynamic" ValidationGroup="Guardar">*</asp:RequiredFieldValidator>
              </div>
              <%--Descipcion--%>
              <div class="form-group">
                    <label for="DescripcionDropDownList" class="col-md-3 control-label input-sm" style="font-size:medium">Descripcion</label>
                    <div class="col-md-6">
                        <asp:DropDownList ID="DescripcionDropDownList" runat="server" Class="form-control input-sm" style="font-size:medium" >
                            <asp:ListItem Selected="True">A la parrilla</asp:ListItem>
                            <asp:ListItem>Fritos</asp:ListItem>
                            <asp:ListItem>Bebidas</asp:ListItem>
                            <asp:ListItem>Postres</asp:ListItem>
                        </asp:DropDownList>
                    </div>
              </div>
              <%--Fecha--%>
              <div class="form-group">
                    <div class="col-md-6">
                        <asp:TextBox ID="FechaTextBox" TextMode="Date" runat="server" class="form-control input-sm" Style="font-size:medium" Visible="false"></asp:TextBox>
                    </div>
              </div>
              <br />
              <%--Botones--%>
              <div class="panel">
                    <div class="text-center">
                        <div class="form-group">
                            <asp:Button ID="NuevoButton" runat="server" Text="Nuevo" class="btn btn-primary btn-lg" OnClick="NuevoButton_Click" />
                            <asp:Button ID="GuardarButton" runat="server" Text="Guardar" class="btn btn-success btn-lg"  ValidationGroup="Guardar" OnClick="GuardarButton_Click"  />
                            <asp:Button ID="EliminarButton" runat="server" Text="Eliminar" class="btn btn-danger btn-lg" OnClick="EliminarButton_Click"  />
                        </div>
                    </div>
              </div>
        </div>
     </div>
</asp:Content>
