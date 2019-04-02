using BLL;
using Entities;
using ReyfiBurgerWeb.Utiles;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Linq.Expressions;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ReyfiBurgerWeb.Registros
{
    public partial class rCombos : System.Web.UI.Page
    {
        
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                LlenaCombo();
            }

        }

        protected void LlenaCombo()
        {
            ViewState["Combos"] = new Combos();
            RepositorioBase<Productos> repositorioBase = new RepositorioBase<Productos>();
            ProductoIdDropDownList.DataSource = repositorioBase.GetList(t => true);
            ProductoIdDropDownList.DataValueField = "ProductoId";
            ProductoIdDropDownList.DataTextField = "NombreProducto";
            ProductoIdDropDownList.DataBind();
        }

        protected void BindGrid()
        {
            DatosGridView.DataSource = ((Combos)ViewState["Combos"]).Producto;
            DatosGridView.DataBind();
        }

        protected void Limpiar()
        {
            CombosIdTextBox.Text = "0";
            NombreCombosTextBox.Text = string.Empty;
            PrecioTotalTextBox.Text = string.Empty;
            ViewState["Combos"] = new Combos();
            this.BindGrid();
        }

        protected void LlenaCampos(Combos combos)
        {
            Limpiar();
            CombosIdTextBox.Text = combos.ComboId.ToString();
            NombreCombosTextBox.Text = combos.NombreCombo;
            ProductoIdDropDownList.Text = combos.ProductoId.ToString();;
            PrecioTotalTextBox.Text = combos.PrecioTotalCombo.ToString();
            ViewState["ProductosDetalle"] = combos.Producto;
            DatosGridView.DataSource = (List<ProductosDetalle>)ViewState["ProductosDetalle"];
            DatosGridView.DataBind();
        }

        protected Combos LlenaClase(Combos combos)
        {
            combos.ComboId = Utils.ToInt(CombosIdTextBox.Text);
            combos.NombreCombo = NombreCombosTextBox.Text;
            combos.ProductoId = Utils.ToInt(ProductoIdDropDownList.Text);
            combos.Producto = (List<ProductosDetalle>)ViewState["ProductosDetalle"];
            combos.PrecioTotalCombo = Utils.ToDecimal(PrecioTotalTextBox.Text);
            bool resultado = DateTime.TryParse(FechaTextBox.Text, out DateTime date);
            if (resultado == true)
                combos.Fecha = date;
            return combos;
        }

        protected bool ValidarNombres(Combos combos)
        {
            bool validar = false;
            Expression<Func<Combos, bool>> filtro = p => true;
            RepositorioBase<Combos> repositorio = new RepositorioBase<Combos>();
            var lista = repositorio.GetList(c => true);
            foreach(var item in lista)
            {
                if(combos.NombreCombo == item.NombreCombo)
                {
                    Utils.ShowToastr(this.Page, "Combo ya Existe", "Error", "error");
                    return validar = true;
                }
            }
            return validar;
        }

        protected void NuevoButton_Click(object sender, EventArgs e)
        {
            Limpiar();
        }

        protected void GuardarButton_Click(object sender, EventArgs e)
        {
            DetalleComboRepositorio repositorio = new DetalleComboRepositorio();
            Combos combos = new Combos();
            bool paso = false;

            if (IsValid == false)
            {
                Utils.ShowToastr(this.Page, "Revisar todos los campo", "Error", "error");
                return;
            }
            combos = LlenaClase(combos);
            if (ValidarNombres(combos))
            {
                return;
            }
            else
            {
                if (combos.ComboId == 0)
                {
                    if (combos.Producto.Count > 1)
                    {
                        paso = repositorio.Guardar(combos);
                        Utils.ShowToastr(this.Page, "Guardado con exito!!", "Guardado", "success");
                        Limpiar();
                    }
                    else
                        Utils.ShowToastr(this.Page, "Debe agregar mas de un prodructo", "Revisar", "info");
                }
                else
                {
                    paso = repositorio.Modificar(combos);
                    Utils.ShowToastr(this.Page, "Modificado con exito!!", "Modificado", "success");
                    Limpiar();
                }
            }
        }

        protected void EliminarButton_Click(object sender, EventArgs e)
        {
            int id = Convert.ToInt32(CombosIdTextBox.Text);
            DetalleComboRepositorio repositorio = new DetalleComboRepositorio();
            if (repositorio.Eliminar(id))
            {
                Utils.ShowToastr(this.Page, "Eliminado con exito!!", "Eliminado", "info");
            }
            else
                Utils.ShowToastr(this.Page, "Fallo al Eliminar :(", "Error", "error");
            Limpiar();
        }

        protected void BuscarButton_Click(object sender, EventArgs e)
        {
            DetalleComboRepositorio repositorio = new DetalleComboRepositorio();
            var combos = repositorio.Buscar(Utils.ToInt(CombosIdTextBox.Text));
            Limpiar();
            if (combos != null)
            {
                LlenaCampos(combos);
                Utils.ShowToastr(this, "Busqueda exitosa", "Exito", "success");
            }
            else
                Utils.ShowToastr(this.Page, "El Prestamo que intenta buscar no existe", "Error", "error");
        }

        protected void AgregarButton_Click(object sender, EventArgs e)
        {
            RepositorioBase<Productos> repositorio = new RepositorioBase<Productos>();
            Combos combos = new Combos();
            var productos = repositorio.Buscar(Utils.ToInt(ProductoIdDropDownList.SelectedValue));

            if (DatosGridView.Rows.Count != 0)
            {
                combos.Producto = (List<ProductosDetalle>)ViewState["ProductosDetalle"];
            }

            combos.Producto.Add(new ProductosDetalle(0, Utils.ToInt(ProductoIdDropDownList.Text), Utils.ToInt(CombosIdTextBox.Text), productos.NombreProducto, productos.TipoProducto, productos.Precio, productos.Descripcion));

            Decimal.TryParse(PrecioTotalTextBox.Text, out decimal calculo);
            calculo = calculo + productos.Precio;
            PrecioTotalTextBox.Text = calculo.ToString();

            ViewState["ProductosDetalle"] = combos.Producto;
            DatosGridView.DataSource = ViewState["ProductosDetalle"];
            DatosGridView.DataBind();

        }


        protected void DatosGridView_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            DatosGridView.DataSource = ViewState["ProductosDetalle"];
            DatosGridView.PageIndex = e.NewPageIndex;
            DatosGridView.DataBind();
        }

        protected void Eliminar_Click(object sender, EventArgs e)
        {

            GridViewRow row = DatosGridView.SelectedRow;
            ((List<ProductosDetalle>)ViewState["ProductosDetalle"]).RemoveAt(row.RowIndex);
            DatosGridView.DataSource = ViewState["ProductosDetalle"];
            DatosGridView.DataBind();

            List<ProductosDetalle> detalle = new List<ProductosDetalle>();

            if (DatosGridView.DataSource != null)
            {
                detalle = (List<ProductosDetalle>)DatosGridView.DataSource;
            }
            decimal Total = 0;
            foreach (var item in detalle)
            {
                Total -= item.Precio;
            }
            Total *= (-1);
            if (DatosGridView.Rows.Count > 0)
                PrecioTotalTextBox.Text = Total.ToString();
            if (DatosGridView.Rows.Count == 0)
                PrecioTotalTextBox.Text = string.Empty;
           
        }

    }
}