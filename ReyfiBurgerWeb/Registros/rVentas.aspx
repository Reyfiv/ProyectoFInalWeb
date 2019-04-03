<%@ Page Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="rVentas.aspx.cs" Inherits="ReyfiBurgerWeb.Registros.rVentas" %>

<asp:Content ID="Content5" ContentPlaceHolderID="MainContent" runat="server">
    <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
    <div class="panel col-lg-12" style="background-color: #FF9021">
        <div class="panel-heading" style="font-family: Freestyle Script; font-size: 25px; color: #ffffff">Registro de Ventas</div>
    </div>

    <div class="panel-body">
        <div class="form-horizontal col-md-12" role="form">
            <asp:UpdatePanel ID="UpdatePanel4" runat="server">
                <ContentTemplate>
                    <div style="text-align: right">
                        <asp:Button ID="Carrito" runat="server" CausesValidation="false" Text="Orden" class="btn btn-success btn-md" data-toggle="modal" data-target=".bd-example-modal-lg" />
                    </div>
                </ContentTemplate>
                <Triggers>
                    <asp:AsyncPostBackTrigger ControlID="Carrito" />
                </Triggers>
            </asp:UpdatePanel>
            <br />
            <div class="form-group">
                <div class="col-sm-2" style="margin-left: 200px">
                    <asp:TextBox ID="CriterioTextBox" runat="server" class="form-control input-sm" Style="font-size: medium" PlaceHolder="Productos" TextMode="Search"></asp:TextBox>
                </div>
                <div class="col-sm-1">
                    <asp:Button ID="BuscarButton" runat="server" Text="Buscar" class="btn btn-info btn-sm" />
                </div>
                <div class="col-sm-2" style="margin-left: 100px">
                    <asp:TextBox ID="Criterio2TextBox" runat="server" class="form-control input-sm" Style="font-size: medium" PlaceHolder="Combos" TextMode="Search"></asp:TextBox>
                </div>
                <div class="col-sm-1">
                    <asp:Button ID="BucarButtonCombos" runat="server" Text="Buscar" class="btn btn-info btn-sm" />
                </div>
                <br />
                <br />
                <div class="col-lg-12" style="margin-left: 160px">
                    <asp:UpdatePanel ID="UpdatePanel2" runat="server">
                        <ContentTemplate>
                            <%--Productos--%>
                            <div class="table-responsive">
                                <asp:GridView ID="ProductosGridView" runat="server" class="table table-condensed table-responsive col-lg-6" CellPadding="6" ForeColor="#333333" GridLines="None" AutoGenerateColumns="False" DataSourceID="SqlDataSource1" ControlStyle-Width="300px" Width="300px" OnRowCommand="ProductosGridView_RowCommand">
                                    <AlternatingRowStyle BackColor="White" />
                                    <Columns>
                                        <asp:TemplateField ShowHeader="False" HeaderText="Opciones">
                                            <ItemTemplate>
                                                <img src="/Resources/ImgProductos/Producto.png" width="70" height="70" style="margin-left: 19px" />
                                                <asp:Button ID="AgregarOrdenProductos" runat="server" CausesValidation="false" CommandName="Select" CommandArgument="<%# ((GridViewRow) Container).DataItemIndex %>"
                                                    Text="Agregar a la orden" class="btn btn-success btn-sm" data-toggle="modal" data-target=".bd-example-modal-lg" />
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:BoundField DataField="NombreProducto" HeaderText="NombreProducto" SortExpression="NombreProducto" />
                                        <asp:BoundField DataField="Precio" HeaderText="Precio" SortExpression="Precio" />
                                    </Columns>
                                    <HeaderStyle BackColor="#FF9021" Font-Bold="true" ForeColor="White" />
                                </asp:GridView>
                                <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:ConStr %>" SelectCommand="SELECT [NombreCombo], [PrecioTotalCombo] FROM [Combos]"></asp:SqlDataSource>
                                <%--Combos--%>
                                <div class="col-lg-6" style="margin-left: 40px">
                                    <asp:GridView ID="CombosGridView" runat="server" class="table table-condensed table-responsive col-lg-6" CellPadding="6" ForeColor="#333333" GridLines="None" AutoGenerateColumns="False" DataSourceID="SqlDataSource2" ControlStyle-Width="300px" ControlStyle-Margin-Left="100px" OnRowCommand="CombosGridView_RowCommand">
                                        <AlternatingRowStyle BackColor="White" />
                                        <Columns>
                                            <asp:TemplateField ShowHeader="False" HeaderText="Opciones">
                                                <ItemTemplate>
                                                    <img src="/Resources/ImgCombos/Combo.png" width="70" height="70" style="margin-left: 19px" />
                                                    <asp:Button ID="AgregarOrdenCombos" runat="server" CausesValidation="false" CommandName="Select" CommandArgument="<%# ((GridViewRow) Container).DataItemIndex %>"
                                                        Text="Agregar a la orden" class="btn btn-success btn-sm" data-toggle="modal" data-target=".bd-example-modal-lg" />
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:BoundField DataField="NombreCombo" HeaderText="NombreCombo" SortExpression="NombreCombo" />
                                            <asp:BoundField DataField="PrecioTotalCombo" HeaderText="PrecioTotalCombo" SortExpression="PrecioTotalCombo" />
                                        </Columns>
                                        <HeaderStyle BackColor="#FF9021" Font-Bold="true" ForeColor="White" />
                                    </asp:GridView>
                                    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConStr %>" SelectCommand="SELECT [NombreProducto], [Precio] FROM [Productos]"></asp:SqlDataSource>
                                </div>
                        </ContentTemplate>
                        <Triggers>
                            <asp:AsyncPostBackTrigger ControlID="ProductosGridView" />
                            <asp:AsyncPostBackTrigger ControlID="CombosGridView" />
                        </Triggers>
                    </asp:UpdatePanel>
                </div>
            </div>
        </div>
        <%--Fecha--%>
        <div class="form-group">
            <div class="col-md-6">
                <asp:TextBox ID="FechaTextBox" TextMode="Date" runat="server" class="form-control input-sm" Style="font-size: medium" Visible="false"></asp:TextBox>
            </div>
        </div>
    </div>

    <!--Modal de confirmacion de eliminar-->
    <div class="modal fade bd-example-modal-lg" tabindex="-1" role="dialog" aria-labelledby="myLargeModalLabel" aria-hidden="true">
        <div class="modal-dialog modal-sm" role="document" style="max-width: 800px!important; min-width: 800px!important">
            <div class="modal-content ">
                <div class="modal-header bg-success">
                    <h5 class="modal-title">Orden</h5>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-body">
                    <%--Cuerpo de la compra de productos--%>
                    <div class="panel-body">
                        <div class="form-horizontal col-md-12" role="form">
                            <div class="table-responsive">
                                <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                                    <ContentTemplate>
                                        <asp:GridView ID="CarritodeProductosGridView" runat="server" class="table table-condensed table-responsive col-lg-6" CellPadding="6" ForeColor="#333333" GridLines="None" ControlStyle-Width="300px" Width="300px" OnPageIndexChanged="CarritodeProductosGridView_PageIndexChanged" OnRowCommand="CarritodeProductosGridView_RowCommand" OnPageIndexChanging="CarritodeProductosGridView_PageIndexChanging">
                                            <AlternatingRowStyle BackColor="White" />
                                            <Columns>
                                                <asp:TemplateField ShowHeader="False" HeaderText="Opciones">
                                                    <ItemTemplate>
                                                        <asp:Button ID="RemoverProductos" runat="server" CausesValidation="false" CommandName="Select" CommandArgument="<%# ((GridViewRow) Container).DataItemIndex %>"
                                                            Text="X" class="btn btn-danger btn-sm" />
                                                    </ItemTemplate>
                                                </asp:TemplateField>
                                            </Columns>
                                            <HeaderStyle BackColor="#FF9021" Font-Bold="true" ForeColor="White" />
                                        </asp:GridView>
                                        <%--Combos--%>
                                        <asp:GridView ID="CarritodeCombosGridView" runat="server" class="table table-condensed table-responsive col-lg-6" CellPadding="6" ForeColor="#333333" GridLines="None" ControlStyle-Width="300px" ControlStyle-Margin-Left="100px" OnPageIndexChanged="CarritodeCombosGridView_PageIndexChanged" OnRowCommand="CarritodeCombosGridView_RowCommand" OnPageIndexChanging="CarritodeCombosGridView_PageIndexChanging">
                                            <AlternatingRowStyle BackColor="White" />
                                            <Columns>
                                                <asp:TemplateField ShowHeader="False" HeaderText="Opciones">
                                                    <ItemTemplate>
                                                        <asp:Button ID="RemoverCombos" runat="server" CausesValidation="false" CommandName="Select" CommandArgument="<%# ((GridViewRow) Container).DataItemIndex %>"
                                                            Text="X" class="btn btn-danger btn-sm" />
                                                    </ItemTemplate>
                                                </asp:TemplateField>
                                            </Columns>
                                            <HeaderStyle BackColor="#FF9021" Font-Bold="true" ForeColor="White" />
                                        </asp:GridView>
                                    </ContentTemplate>
                                    <Triggers>
                                        <asp:AsyncPostBackTrigger ControlID="CarritodeProductosGridView" />
                                        <asp:AsyncPostBackTrigger ControlID="CarritodeCombosGridView" />
                                    </Triggers>
                                </asp:UpdatePanel>
                            </div>
                        </div>
                    </div>
                    <%--Entradas--%>
                    <div class="panel-body">
                        <div class="form-horizontal col-sm-12" role="form">
                            <asp:UpdatePanel ID="UpdatePanel3" runat="server">
                                <ContentTemplate>
                                    <div class="form-group" style="margin-left: 50px">
                                        <label for="TotalTextBox" class="col-sm-1 control-label input-sm" style="font-size: medium">Total</label>
                                        <div class="col-sm-2">
                                            <asp:TextBox ID="TotalTextBox" runat="server" placeholder="0" class="form-control input-sm" Style="font-size: medium" TextMode="Number" ReadOnly="true"></asp:TextBox>
                                        </div>

                                        <label for="EfectivoTextBox" class="col-sm-2 control-label input-sm" style="font-size: medium">Efectivo</label>
                                        <div class="col-sm-2">
                                            <asp:TextBox ID="EfectivoTextBox" runat="server" placeholder="0" class="form-control input-sm" Style="font-size: medium" TextMode="Number" OnTextChanged="EfectivoTextBox_TextChanged" AutoPostBack="true"></asp:TextBox>
                                        </div>
                                        <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="EfectivoTextBox" ValidationExpression="^[0-9]*" Text="*" ForeColor="Red" Display="Dynamic" ToolTip="Entrada no valida" ValidationGroup="Pagar"></asp:RegularExpressionValidator>
                                        <label for="DevueltaTextBox" class="col-sm-2 control-label input-sm" style="font-size: medium">Devuelta</label>
                                        <div class="col-sm-2">
                                            <asp:TextBox ID="DevueltaTextBox" runat="server" placeholder="0" class="form-control input-sm" Style="font-size: medium" TextMode="Number" ReadOnly="true"></asp:TextBox>
                                        </div>
                                        <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" ControlToValidate="DevueltaTextBox" ValidationExpression="^[0.00-9.00]*" Text="*" ForeColor="Red" Display="Dynamic" ToolTip="Entrada no valida" ValidationGroup="Pagar"></asp:RegularExpressionValidator>
                                    </div>
                                    </div>
                                </ContentTemplate>
                                <Triggers>
                                    <asp:AsyncPostBackTrigger ControlID="TotalTextBox" />
                                    <asp:AsyncPostBackTrigger ControlID="DevueltaTextBox" />
                                </Triggers>
                            </asp:UpdatePanel>
                        </div>
                    </div>
                    <div class="modal-footer">
                        <asp:Button runat="server" class="btn btn-secondary" data-dismiss="modal" Text="Cerrar" />
                        <asp:Button runat="server" ID="Pagar" class="btn btn-success" ValidationGroup="Pagar" Text="Pagar" OnClick="Pagar_Click" />
                    </div>
                </div>
            </div>
        </div>
    </div>
</asp:Content>

