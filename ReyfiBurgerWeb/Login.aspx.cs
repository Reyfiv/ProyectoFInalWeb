using BLL;
using Entities;
using ReyfiBurgerWeb.Registros;
using ReyfiBurgerWeb.Utiles;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ReyfiBurgerWeb
{
    public partial class Login : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            String Valor = UsuarioTextBox.Text;
            
        }

        protected void LoginButton_Click(object sender, EventArgs e)
        {
            Usuarios user = new Usuarios();
            LoginRepositorio repositorio = new LoginRepositorio();

            if (UsuarioTextBox.Text.Length > 0 && ContraseñaTextBox.Text.Length > 0)
            {


                if (repositorio.Auntenticar(UsuarioTextBox.Text, ContraseñaTextBox.Text))
                {
                    FormsAuthentication.RedirectFromLoginPage(user.NombreUsuario, true);
                }
                else
                    Utils.ShowToastr(this.Page, "Usuario o contraseña Incorrecta", "Error", "error");
            }
            else
            {
                Utils.ShowToastr(this.Page, "Introduzca Usuario & Contraseña", "Error", "error");
            }
        }
    }
}