using BLL;
using Entities;
using Microsoft.Reporting.WebForms;
using ReyfiBurgerWeb.Utiles;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Linq.Expressions;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ReyfiBurgerWeb.Consultas
{
    public partial class cUsuarios : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                MetodoReporte();
            }
        }

        public static List<Usuarios>MetodoBuscar(int index, string criterio, DateTime desde, DateTime hasta)
        {
            Expression<Func<Usuarios, bool>> filtro = p => true;
            RepositorioBase<Usuarios> repositorio = new RepositorioBase<Usuarios>();
            List<Usuarios> list = new List<Usuarios>();

            int id = Utils.ToInt(criterio);
            switch (index)
            {
                case 0://Todo
                    repositorio.GetList(c => true);
                    break;
                case 1://Id
                    filtro = p => p.UsuarioId == id && p.Fecha >= desde && p.Fecha <= hasta;
                    break;
                case 2://Nombres
                    filtro = p => p.Nombres.Contains(criterio) && p.Fecha >= desde && p.Fecha <= hasta;
                    break;
                case 3://Usuario
                    filtro = p => p.NombreUsuario.Contains(criterio) && p.Fecha >= desde && p.Fecha <= hasta;
                    break;
                case 4://Tipo
                    filtro = p => p.TipoUsuario.Contains(criterio) && p.Fecha >= desde && p.Fecha <= hasta;
                    break;
                case 5://Todo por fecha
                    filtro = p => p.Fecha >= desde && p.Fecha <= hasta;
                    break;
            }

            list = repositorio.GetList(filtro);

            return list;
        }

        protected void BuscarButton_Click(object sender, EventArgs e)
        {
            int id = Utils.ToInt(CriterioTextBox.Text);
            int index = FiltroDropDownList.SelectedIndex;
            DateTime desde = Utils.ToDateTime(DesdeTextBox.Text);
            DateTime hasta = Utils.ToDateTime(HastaTextBox.Text); 

            DatosGridView.DataSource = MetodoBuscar(index, CriterioTextBox.Text, desde, hasta);
            DatosGridView.DataBind();
        }

        public static List<Usuarios> Lista(Expression<Func<Usuarios, bool>> Filtro)
        {
            Filtro = r => true;
            RepositorioBase<Usuarios> Repositorio = new RepositorioBase<Usuarios>();
            List<Usuarios> usuarios = new List<Usuarios>();
            usuarios = Repositorio.GetList(Filtro);
            return usuarios;
        }

        public void MetodoReporte()
        {
            Expression<Func<Usuarios, bool>> Filtra = r => true;
            CombosReportViewer.ProcessingMode = ProcessingMode.Local;
            CombosReportViewer.Reset();
            CombosReportViewer.LocalReport.ReportPath = Server.MapPath(@"~\Reportes\Report_Usuarios.rdlc");
            CombosReportViewer.LocalReport.DataSources.Clear();
            CombosReportViewer.LocalReport.DataSources.Add(new ReportDataSource("Usuarios", Lista(Filtra)));
            CombosReportViewer.LocalReport.Refresh();
        }
    }
}