using BLL;
using Entities;
using ReyfiBurgerWeb.Utiles;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ReyfiBurgerWeb.Registros
{
    public partial class rProductos : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                int id = Utils.ToInt(Request.QueryString["id"]);
                if (id > 0)
                {
                    RepositorioBase<Productos> repositorio = new RepositorioBase<Productos>();
                    var registro = repositorio.Buscar(id);

                    if (registro == null)
                    {
                        Utils.ShowToastr(this.Page, "Registro no encontrado", "Error", "error");
                    }
                    else
                    {
                        LlenaCampos(registro);
                    }
                }
            }
        }

        protected void Limpiar()
        {
            ProductoIdTextBox.Text = "0";
            NombreProductoTextBox.Text = string.Empty;
            PrecioTextBox.Text = "0.00";
        }

        protected Productos LlenaClase(Productos productos)
        {
            productos.ProductoId = Utils.ToInt(ProductoIdTextBox.Text);
            productos.NombreProducto = NombreProductoTextBox.Text;
            productos.TipoProducto = TipoProductoDropDownList.Text;
            productos.Precio = Utils.ToDecimal(PrecioTextBox.Text);
            productos.Descripcion = DescripcionDropDownList.Text;
            bool resultado = DateTime.TryParse(FechaTextBox.Text, out DateTime fecha);
            if (resultado)
                productos.Fecha = fecha;
            return productos;
        }

        protected void LlenaCampos(Productos productos)
        {
            ProductoIdTextBox.Text = Convert.ToString(productos.ProductoId);
            NombreProductoTextBox.Text = productos.NombreProducto;
            TipoProductoDropDownList.Text = productos.TipoProducto;
            PrecioTextBox.Text = Convert.ToString(productos.Precio);
            DescripcionDropDownList.Text = productos.Descripcion;
        }

        protected void NuevoButton_Click(object sender, EventArgs e)
        {
            Limpiar();
        }

        protected void GuardarButton_Click(object sender, EventArgs e)
        {
            RepositorioBase<Productos> repositorio = new RepositorioBase<Productos>();
            Productos productos = new Productos();
            bool paso = false;

            if (IsValid == false)
            {
                Utils.ShowToastr(this.Page, "Revisar todos los campo", "Error", "error");
                return;
            }

            productos = LlenaClase(productos);
            if (productos.ProductoId == 0)
            {

                paso = repositorio.Guardar(productos);
                Utils.ShowToastr(this.Page, "Guardado con exito!!", "Guardado", "success");
                Limpiar();
            }
            else
            {
                paso = repositorio.Modificar(productos);
                Utils.ShowToastr(this.Page, "Modificado con exito!!", "Modificado", "success");
                Limpiar();
            }
        }

        protected void EliminarButton_Click(object sender, EventArgs e)
        {
            int id = Convert.ToInt32(ProductoIdTextBox.Text);
            RepositorioBase<Productos> repositorio = new RepositorioBase<Productos>();
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
            RepositorioBase<Productos> repositorio = new RepositorioBase<Productos>();
            var usuario = repositorio.Buscar(Utils.ToInt(ProductoIdTextBox.Text));

            if (usuario != null)
            {
                Limpiar();
                LlenaCampos(usuario);
                Utils.ShowToastr(this, "Busqueda exitosa", "Exito", "success");
            }
            else
            {
                Utils.ShowToastr(this.Page, "El producto que intenta buscar no existe", "Error", "error");
                Limpiar();
            }
        }
    }
}