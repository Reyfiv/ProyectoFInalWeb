<%@ Page Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="rCombos.aspx.cs" Inherits="ReyfiBurgerWeb.Registros.rCombos" %>

<asp:Content ID="Content3" ContentPlaceHolderID="MainContent" runat="server">
   <div class="panel" style = "background-color:#FF9021">
        <div class="panel-heading" style="font-family:Freestyle Script; font-size:25px; color:#ffffff" >Registro de Combos</div>
    </div>

       
    <div class="panel-body">
       <div class="form-horizontal col-md-12" role="form">

            <%--Combos Id--%>
            <div class="form-group">
                <label for="CombosIdTextBox" class="col-md-3 control-label input-sm" style="font-size:medium">Combo Id</label>
                <div class="col-md-1">
                    <asp:TextBox ID="CombosIdTextBox" runat="server" placeholder="0" class="form-control input-sm" Style="font-size:medium" TextMode="Number"></asp:TextBox>                  
                </div>
                    <asp:RegularExpressionValidator ID="ValidaID" runat="server" ControlToValidate="CombosIdTextBox" ValidationExpression="^[0-9]*" Text="*" ForeColor="Red" Display="Dynamic" ToolTip="Entrada no valida" ValidationGroup="Guardar"></asp:RegularExpressionValidator>
                <div class="col-md-1">
                    <asp:Button ID="BuscarButton" runat="server" Text="Buscar" class="btn btn-info btn-sm" OnClick="BuscarButton_Click" />
                </div>
             </div>
             <%--Nombre del combo--%>
              <div class="form-group">
                <label for="NombreCombosTextBox" class="col-md-3 control-label input-sm" style="font-size:medium">Nombre del Combo</label>
                <div class="col-md-6">
                    <asp:TextBox ID="NombreCombosTextBox" runat="server" class="form-control input-sm" style="font-size:medium"></asp:TextBox>
                </div>
                <asp:RequiredFieldValidator ID="Valida" runat="server" ControlToValidate="NombreCombosTextBox" ForeColor="Red" Display="Dynamic" ValidationGroup="Guardar">*</asp:RequiredFieldValidator>
             </div>
            <%--ProductoId--%>
            <div class="form-group">
                <label for="ProductoIdDropDownList" class="col-md-3 control-label input-sm" style="font-size:medium">Producto</label>
                <div class="col-md-6">
                    <asp:DropDownList ID="ProductoIdDropDownList" runat="server" Class="form-control input-sm" style="font-size:medium" >   
                    </asp:DropDownList>
                </div>
                <div class="col-md-2" style="font-size:medium">
                    <asp:Button ID="AgregarButton" runat="server" Text="+" class="btn btn-success btn-sm" OnClick="AgregarButton_Click" />
                </div>
            </div>
             <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
            <asp:UpdatePanel ID="UpdatePanel2" runat="server">
            <ContentTemplate>
               <%--DetalleProductos--%>
                <div class="table-responsive">  
                    <asp:GridView ID="DatosGridView" runat="server" class="table table-condensed table-responsive" CellPadding="6" ForeColor="#333333" GridLines="None" OnPageIndexChanging="DatosGridView_PageIndexChanging">
                    <AlternatingRowStyle BackColor="White" />
                        <Columns>
                             <asp:TemplateField ShowHeader="False" HeaderText="Opciones">
                                <ItemTemplate>
                                    <asp:Button ID="Remover" runat="server" CausesValidation="false" CommandName="Select"
                                        Text="Remover" class="btn btn-warning btn-sm" data-toggle="modal" data-target=".bd-example-modal-lg" />
                                </ItemTemplate>
                            </asp:TemplateField>
                        </Columns>
                        <HeaderStyle BackColor="#FF9021" Font-Bold="true" ForeColor="White" />
                        <RowStyle BackColor="#EFF3FB" />
                    </asp:GridView>
                </div>
               </ContentTemplate>
               <Triggers>
                <asp:AsyncPostBackTrigger ControlID="DatosGridView" />
               </Triggers>
             </asp:UpdatePanel>
                <%--Fecha--%>
                <div class="form-group">
                    <div class="col-md-6">
                        <asp:TextBox ID="FechaTextBox" TextMode="Date" runat="server" class="form-control input-sm" Style="font-size:medium" Visible="false"></asp:TextBox>
                    </div>
                </div>
                <%--Precio Total--%>
                <div class="form-group" style="margin-left:244px">
                    <label for="PrecioTotalTextBox" class="col-sm-6 control-label input-sm" style="font-size:medium" >Precio Total</label>
                    <div class="col-sm-2">
                        <asp:TextBox  ID="PrecioTotalTextBox" runat="server" class="form-control input-sm" Style="font-size:medium; text-align:center" ReadOnly="true" ></asp:TextBox>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="" ControlToValidate="PrecioTotalTextBox" ForeColor="Red" Display="Dynamic" ValidationGroup="Guardar">*</asp:RequiredFieldValidator> 
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
        
           <!--Modal de confirmacion de eliminar-->
        <div class="modal fade bd-example-modal-lg" tabindex="-1" role="dialog" aria-labelledby="myLargeModalLabel" aria-hidden="true">
            <div class="modal-dialog modal-sm" role="document">
                <div class="modal-content ">
                    <div class="modal-header bg-danger">
                        <h5 class="modal-title">¡Atencion!</h5>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                    <div class="modal-body">
                        <p>Estas seguro de eliminar este Articulo?</p>
                    </div>
                    <div class="modal-footer">
                        <asp:Button ID="Eliminar" runat="server" CssClass="btn btn-danger" Text="Si" OnClick="Eliminar_Click" />
                        <button type="button" class="btn btn-secondary" data-dismiss="modal">No</button>
                    </div>
                </div>
            </div>
        </div>
   <%--  <!--Modal de confirmacion de Eliminar-->
        <div class="modal fade bd-example-modal-lg" tabindex="-1" role="dialog" aria-labelledby="myLargeModalLabel" aria-hidden="true">
                <div class="modal-dialog modal-sm" style="max-width: 600px!important; min-width: 300px!important">
                    <div class="modal-content">
                        <div class="modal-header">
                            <h5 class="modal-title" id="exampleModalLabel">Vista Rápida de Facturas</h5>
                            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                <span aria-hidden="true">&times;</span>
                            </button>
                        </div>
                        <div class="modal-body">
                        </div>
                        <div class="modal-footer">
                        </div>
                    </div>
                </div>
            </div>--%>
</asp:Content>
