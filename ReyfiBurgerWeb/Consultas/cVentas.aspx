<%@ Page Language="C#"  MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="cVentas.aspx.cs" Inherits="ReyfiBurgerWeb.Consultas.cVentas"%>

<asp:Content ID="Content9" ContentPlaceHolderID="MainContent" runat="server">
          <%@ Register Assembly="Microsoft.ReportViewer.WebForms, Version=15.0.0.0, Culture=neutral, PublicKeyToken=89845dcd8080cc91" Namespace="Microsoft.Reporting.WebForms" TagPrefix="rsweb" %>
          <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
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
       <!--Button--->
        <div class="panel">
            <div class="text-center">
                <div class="form-group" style="display: inline-block">
                    <button type="button" class="btn btn-warning mt-4" data-toggle="modal" data-target=".bd-example-modal-lg">Imprimir</button>
                </div>
            </div>
        </div>
    <%-- El  Modal para el Reporte--%>
    <div class="modal fade bd-example-modal-lg" tabindex="-1" role="dialog" aria-labelledby="myLargeModalLabel" aria-hidden="true">
        <div class="modal-dialog modal-sm" style="max-width: 600px!important; min-width: 600px!important">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="ModalLebel">Reporte de Ventas</h5>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                 </div>
                   <div class="modal-body">
                    <%--Viewer--%>
                    <rsweb:ReportViewer ID="CombosReportViewer" runat="server" ProcessingMode="Remote" Height="577px" Width="550px">
                        <ServerReport ReportPath="" ReportServerUrl="" />
                    </rsweb:ReportViewer>
                  </div>
                <div class="modal-footer">
                 </div>
             </div>
         </div>
     </div>

</div>
</asp:Content>
