<%@ Page Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="rVentas.aspx.cs" Inherits="ReyfiBurgerWeb.Registros.rVentas" %>

<asp:Content ID="Content5" ContentPlaceHolderID="MainContent" runat="server">
    <div class="panel-body">
       <div class="form-horizontal col-md-12" role="form">
                <div class="form-group">
                    <label for="ProductoListView" class="col-md-3 control-label input-sm" style="font-size:medium">Productos</label>
                    <asp:ListView ID="ProductosListView" runat="server"></asp:ListView>
                    <label for="ProductoListView" class="col-md-3 control-label input-sm" style="font-size:medium">Combos</label>
                    <asp:ListView ID="CombosListView" runat="server"></asp:ListView>
                </div>
                <div class="form-group">
                    <div class="table-responsive">  
                    <asp:GridView ID="ProductosGridView" runat="server" class="table table-condensed table-responsive" CellPadding="6" ForeColor="#333333" GridLines="None" OnPageIndexChanging="DatosGridView_PageIndexChanging">
                    <AlternatingRowStyle BackColor="White" />
                        <Columns>
                                <asp:TemplateField ShowHeader="False" HeaderText="Opciones">
                                <ItemTemplate>
                                    <asp:Button ID="Remover" runat="server" CausesValidation="false" ComandName="Select"
                                        Text="Remover" class="btn btn-warning btn-sm"/>
                                </ItemTemplate>
                            </asp:TemplateField>
                        </Columns>
                        <HeaderStyle BackColor="#FF9021" Font-Bold="true" ForeColor="White" />
                        <RowStyle BackColor="#EFF3FB" />
                    </asp:GridView>

                    <div class="table-responsive">  
                    <asp:GridView ID="GridView1" runat="server" class="table table-condensed table-responsive" CellPadding="6" ForeColor="#333333" GridLines="None" OnPageIndexChanging="DatosGridView_PageIndexChanging">
                    <AlternatingRowStyle BackColor="White" />
                        <Columns>
                                <asp:TemplateField ShowHeader="False" HeaderText="Opciones">
                                <ItemTemplate>
                                    <asp:Button ID="Remover" runat="server" CausesValidation="false" ComandName="Select"
                                        Text="Remover" class="btn btn-warning btn-sm"/>
                                </ItemTemplate>
                            </asp:TemplateField>
                        </Columns>
                        <HeaderStyle BackColor="#FF9021" Font-Bold="true" ForeColor="White" />
                        <RowStyle BackColor="#EFF3FB" />
                    </asp:GridView>
                </div>
                <div class="form-group">

                </div>
            </div>
        </div>
    </div>
    </div>
</asp:Content>

