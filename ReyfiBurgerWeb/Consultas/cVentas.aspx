<%@ Page Language="C#"  MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="cVentas.aspx.cs" Inherits="ReyfiBurgerWeb.Consultas.cVentas"%>

<asp:Content ID="Content9" ContentPlaceHolderID="MainContent" runat="server">
          <div class="panel" style = "background-color:#FF9021">
           <div class="panel-heading" style="font-family:Freestyle Script; font-size:25px; color:#ffffff" >Consulta de Ventas</div>
     </div>
      <%--Entradas de las consulta--%>
        <div class="form-group">
                <div class="col-md-4">
                        <asp:DropDownList ID="FiltroDropDownList" runat="server" Class="form-control input-sm" style="font-size:medium">
                                <asp:ListItem Selected="True">Todo</asp:ListItem>
                                <asp:ListItem>VentaId</asp:ListItem>
                                <asp:ListItem>Efectivo</asp:ListItem>
                                <asp:ListItem>Devuelta</asp:ListItem>
                                <asp:ListItem>Fecha</asp:ListItem>
                        </asp:DropDownList>
                </div>
                <div class="col-md-6">
                     <asp:TextBox ID="CriterioTextBox" runat="server" class="form-control input-sm" style="font-size:medium"></asp:TextBox>
                </div>
                <div class="col-md-2">
                    <asp:Button ID="BuscarButton" runat="server" Text="Buscar" class="btn btn-info btn-md" OnClick="BuscarButton_Click"/>
                </div>
            </div>
         <br/>
         <br/>

         <%--Fechas para consulta--%>
        <div class="form-group">
            <div class="col-md-12">
                    <label for="DesdeTextBox" class="col-md-1 control-label input-sm" style="font-size: medium">Desde</label>
                    <div class="col-md-4">
                        <asp:TextBox ID="DesdeTextBox" TextMode="Date" runat="server" class="form-control input-sm" Style="font-size: medium" Visible="true" ></asp:TextBox>
                    </div>

                    <label for="HastaTextBox" class="col-md-1 control-label input-sm" style="font-size: medium">Hasta</label>
                    <div class="col-md-4">
                        <asp:TextBox ID="HastaTextBox" TextMode="Date" runat="server" class="form-control input-sm" Style="font-size: medium" Visible="true" ></asp:TextBox>
                    </div>
                    <asp:CheckBox ID="FechaCheckBox" runat="server" Checked="True" Visible="False"  />
            </div>
         </div>
        <br/>
        <br/>
        <%--Grid--%>
        <div class="table-responsive">
            <asp:GridView ID="DatosGridView" runat="server" class="table table-condensed  table-responsive" CellPadding="6" ForeColor="#333333" GridLines="None">
                <AlternatingRowStyle BackColor="White" />
                    <Columns>
                        <asp:HyperLinkField ControlStyle-ForeColor="#FF9021"
                            HeaderText="Opciones"
                            DataNavigateUrlFields="VentaId"
                            DataNavigateUrlFormatString="/Registros/rVentas.aspx?Id={0}"
                            Text="Editar">
                        </asp:HyperLinkField>
                    </Columns>
                    <HeaderStyle BackColor="#FF9021" Font-Bold="true" ForeColor="White" />
                    <RowStyle BackColor="#EFF3FB" />
            </asp:GridView>
            <div class="panel">
                <div class="text-center">
                    <div class="form-group">
                        <asp:Button ID="ImprimirButton" runat="server" Text="Imprimir" class="btn btn-warning btn-lg" />
                    </div>
                </div>
            </div>
        </div>
</asp:Content>
