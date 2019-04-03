using BLL;
using Entities;
using ReyfiBurgerWeb.Utiles;
using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Linq.Expressions;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ReyfiBurgerWeb.Registros
{
    public partial class rVentas : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
             
            }
        }

        protected void LlenaUsuario()
        {

        }

        protected void LimpiaOrden()
        {
            CarritodeProductosGridView.DataSource = null;
            CarritodeProductosGridView.DataBind();

            CarritodeCombosGridView.DataSource = null;
            CarritodeCombosGridView.DataBind();
        }

        private void Limpiar()
        {
            TotalTextBox.Text = string.Empty;
            EfectivoTextBox.Text = string.Empty;
            DevueltaTextBox.Text = string.Empty;
            this.LimpiaOrden();
        }

        private Ventas LlenaClase(Ventas ventas)
        {
            ventas.TotalAPagar = Utils.ToDecimal(TotalTextBox.Text);
            ventas.Efectivo = Utils.ToDecimal(EfectivoTextBox.Text);
            ventas.Devuelta = Utils.ToDecimal(DevueltaTextBox.Text);
            bool resultado = DateTime.TryParse(FechaTextBox.Text, out DateTime date);
            if (resultado == true)
                ventas.Fecha = date;
            ventas.DetalleProducto = (List<VentaProductosDetalle>)ViewState["VentaProductosDetalle"];
            ventas.DetalleCombo = (List<CombosDetalle>)ViewState["CombosDetalle"];
            return ventas;
        }

        public bool Validar()
        {
            bool validar = false;
            if (EfectivoTextBox.Text == string.Empty || EfectivoTextBox.Text == null || EfectivoTextBox.Text == "0")
            {
                Utils.ShowToastr(this.Page, "No puede Pagar en 0.00", "Revisar", "error");
                validar = true;
            }
            return validar;
        }

        protected void Pagar_Click(object sender, EventArgs e)
        {
            Ventas ventas = new Ventas();
            RepositorioBase<Ventas> repositorio = new RepositorioBase<Ventas>();
            bool paso = false;
            if (IsValid == false)
            {
                Utils.ShowToastr(this.Page, "Revisar todos los campo", "Error", "error");
                return;
            }
            if (Validar())
            {
                Utils.ShowToastr(this.Page, "Revisar todos los campo", "Error", "error");
                return;
            }
            ventas = LlenaClase(ventas);
            paso = repositorio.Guardar(ventas);
            Limpiar();
            if (paso)
                Utils.ShowToastr(this.Page, "La Orden fue pagada", "Pagado", "success");
            else
                Utils.ShowToastr(this.Page, "El Pago no fue efectuado", "Error", "error");


        }

        //Agrega Productos a la orden
        protected void ProductosGridView_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName == "Select")
            {
                int index = Convert.ToInt32(e.CommandArgument);

                Expression<Func<Productos, bool>> filtro = p => true;
                RepositorioBase<Productos> repositorio = new RepositorioBase<Productos>();
                var lista = repositorio.GetList(c => true);

                Ventas ventas = new Ventas();
                var productos = repositorio.Buscar(lista[index].ProductoId);

                if (CarritodeProductosGridView.Rows.Count != 0)
                {
                    ventas.DetalleProducto = (List<VentaProductosDetalle>)ViewState["VentaProductosDetalle"];
                }

                ventas.DetalleProducto.Add(new VentaProductosDetalle(productos.NombreProducto, productos.TipoProducto, productos.Precio, productos.Descripcion));

                Decimal.TryParse(TotalTextBox.Text, out decimal calculo);
                calculo = calculo + productos.Precio;
                TotalTextBox.Text = calculo.ToString();

                ViewState["VentaProductosDetalle"] = ventas.DetalleProducto;
                CarritodeProductosGridView.DataSource = ViewState["VentaProductosDetalle"];
                CarritodeProductosGridView.DataBind();
            }

        }

        protected void EfectivoTextBox_TextChanged(object sender, EventArgs e)
        {
            if (TotalTextBox.Text != null && EfectivoTextBox.Text != null)
            {
                decimal calculo;
                Decimal.TryParse(TotalTextBox.Text, out calculo);
                calculo = Utils.ToDecimal(EfectivoTextBox.Text) - calculo;
                DevueltaTextBox.Text = calculo.ToString();
            }
        }
        //Agrega Combos a la orden
        protected void CombosGridView_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName == "Select")
            {
                int index = Convert.ToInt32(e.CommandArgument);

                Expression<Func<Combos, bool>> filtro = p => true;
                RepositorioBase<Combos> repositorio = new RepositorioBase<Combos>();
                var lista = repositorio.GetList(c => true);

                Ventas ventas = new Ventas();
                var combos = repositorio.Buscar(lista[index].ComboId);

                if (CarritodeCombosGridView.Rows.Count != 0)
                {
                    ventas.DetalleCombo = (List<CombosDetalle>)ViewState["CombosDetalle"];
                }

                ventas.DetalleCombo.Add(new CombosDetalle(combos.NombreCombo, combos.PrecioTotalCombo));

                Decimal.TryParse(TotalTextBox.Text, out decimal calculo);
                calculo = calculo + combos.PrecioTotalCombo;
                TotalTextBox.Text = calculo.ToString();

                ViewState["CombosDetalle"] = ventas.DetalleCombo;
                CarritodeCombosGridView.DataSource = ViewState["CombosDetalle"];
                CarritodeCombosGridView.DataBind();
            }
        }

        //Refescando el grid con los combos agregados
        protected void CarritodeCombosGridView_PageIndexChanged(object sender, EventArgs e)
        {
            CarritodeCombosGridView.DataSource = ViewState["CombosDetalle"];
            CarritodeCombosGridView.DataBind();
        }
        //Refescando el grid con los productos agregados
        protected void CarritodeProductosGridView_PageIndexChanged(object sender, EventArgs e)
        {
            CarritodeProductosGridView.DataSource = ViewState["VentaProductosDetalle"];
            CarritodeProductosGridView.DataBind();
        }

        protected void CarritodeCombosGridView_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            //Removiendo combo y restando el precio del combo removido
            if (e.CommandName == "Select")
            {
                int index = Convert.ToInt32(e.CommandArgument);
                //List<VentaProductosDetalle> detalle2 = new List<VentaProductosDetalle>();
                Expression<Func<Combos, bool>> filtro = p => true;
                RepositorioBase<Combos> repositorio = new RepositorioBase<Combos>();
                var lista = repositorio.GetList(c => true);
                var combos = repositorio.Buscar(lista[index].ComboId);
                decimal Total = 0;
                Total = Convert.ToDecimal(TotalTextBox.Text);
                Total -= combos.PrecioTotalCombo;
                TotalTextBox.Text = Total.ToString();
                ((List<CombosDetalle>)ViewState["CombosDetalle"]).RemoveAt(index);
                CarritodeCombosGridView.DataSource = ViewState["CombosDetalle"];
                CarritodeCombosGridView.DataBind();
            }
        }

        protected void CarritodeProductosGridView_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            //Removiendo Producto y restando el precio del producto removido
            if(e.CommandName == "Select")
            {
                int index = Convert.ToInt32(e.CommandArgument);
                //List<VentaProductosDetalle> detalle = new List<VentaProductosDetalle>();
                //List<CombosDetalle> detalle2 = new List<CombosDetalle>();
                Expression<Func<Productos, bool>> filtro = p => true;
                RepositorioBase<Productos> repositorio = new RepositorioBase<Productos>();
                var lista = repositorio.GetList(c => true);
                var productos = repositorio.Buscar(lista[index].ProductoId);
                decimal Total = 0;
                Total = Convert.ToDecimal(TotalTextBox.Text);
                Total -= productos.Precio;
                TotalTextBox.Text = Total.ToString();
                ((List<VentaProductosDetalle>)ViewState["VentaProductosDetalle"]).RemoveAt(index);
                CarritodeProductosGridView.DataSource = ViewState["VentaProductosDetalle"];
                CarritodeProductosGridView.DataBind();
            }
        }
        //Refescando el grid con los productos eliminados
        protected void CarritodeProductosGridView_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            CarritodeProductosGridView.DataSource = ViewState["VentaProductosDetalle"];
            CarritodeProductosGridView.PageIndex = e.NewPageIndex;
            CarritodeProductosGridView.DataBind();
        }
        //Refescando el grid con los combos eliminados
        protected void CarritodeCombosGridView_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            CarritodeCombosGridView.DataSource = ViewState["CombosDetalle"];
            CarritodeCombosGridView.PageIndex = e.NewPageIndex;
            CarritodeCombosGridView.DataBind();
        }

    }
}
