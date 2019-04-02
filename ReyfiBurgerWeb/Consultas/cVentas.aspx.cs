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
    public partial class cVentas : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                MetodoReporte();
            }
        }

        public static List<Ventas> MetodoBuscar(int index, string criterio, DateTime desde, DateTime hasta)
        {
            Expression<Func<Ventas, bool>> filtro = p => true;
            RepositorioBase<Ventas> repositorio = new RepositorioBase<Ventas>();
            List<Ventas> list = new List<Ventas>();

            int id = Utils.ToInt(criterio);
            decimal pre = Utils.ToDecimal(criterio);
            switch (index)
            {
                case 0://Todo
                    repositorio.GetList(c => true);
                    break;
                case 1://Id
                    filtro = p => p.VentaId == id && p.Fecha >= desde && p.Fecha <= hasta;
                    break;
                case 2://Efectivo
                    filtro = p => p.Efectivo == pre && p.Fecha >= desde && p.Fecha <= hasta;
                    break;
                case 3://Devuelta
                    filtro = p => p.Devuelta == pre && p.Fecha >= desde && p.Fecha <= hasta;
                    break;
                case 4://Todo por fecha
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

        public static List<Ventas> Lista(Expression<Func<Ventas, bool>> Filtro)
        {
            Filtro = r => true;
            RepositorioBase<Ventas> Repositorio = new RepositorioBase<Ventas>();
            List<Ventas> usuarios = new List<Ventas>();
            usuarios = Repositorio.GetList(Filtro);
            return usuarios;
        }

        public void MetodoReporte()
        {
            Expression<Func<Ventas, bool>> Filtra = r => true;
            CombosReportViewer.ProcessingMode = ProcessingMode.Local;
            CombosReportViewer.Reset();
            CombosReportViewer.LocalReport.ReportPath = Server.MapPath(@"~\Reportes\Report_Ventas.rdlc");
            CombosReportViewer.LocalReport.DataSources.Clear();
            CombosReportViewer.LocalReport.DataSources.Add(new ReportDataSource("Ventas", Lista(Filtra)));
            CombosReportViewer.LocalReport.Refresh();
        }
    }
}