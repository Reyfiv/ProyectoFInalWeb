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
    public partial class cCombos : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
           
            if (!Page.IsPostBack)
            {
                MetodoReporte();
            }
        }

        public static List<Combos> MetodoBuscar(int index, string criterio, DateTime desde, DateTime hasta)
        {
            Expression<Func<Combos, bool>> filtro = p => true;
            RepositorioBase<Combos> repositorio = new RepositorioBase<Combos>();
            List<Combos> list = new List<Combos>();

            int id = Utils.ToInt(criterio);
            decimal pre = Utils.ToDecimal(criterio);
            switch (index)
            {
                case 0://Todo
                    repositorio.GetList(c => true);
                    break;
                case 1://Id
                    filtro = p => p.ComboId == id && p.Fecha >= desde && p.Fecha <= hasta;
                    break;
                case 2://Nombres
                    filtro = p => p.NombreCombo.Contains(criterio) && p.Fecha >= desde && p.Fecha <= hasta;
                    break;
                case 3://precio
                    filtro = p => p.PrecioTotalCombo == pre && p.Fecha >= desde && p.Fecha <= hasta;
                    break;
                case 4://Todo por fecha
                    filtro = p => p.Fecha >= desde && p.Fecha <= hasta;
                    break;
            }

            list = repositorio.GetList(filtro);

            return list;
        }
        public static List<Combos> ListaCombos(Expression<Func<Combos, bool>> Filtro)
        {
            Filtro = r => true;
            RepositorioBase<Combos> combosRepositorio = new RepositorioBase<Combos>();
            List<Combos> lCombos = new List<Combos>();
            lCombos = combosRepositorio.GetList(Filtro);
            return lCombos;
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
        public void MetodoReporte()
        {
            Expression<Func<Combos, bool>> filtro = p => true;
            CombosReportViewer.ProcessingMode = ProcessingMode.Local;
            CombosReportViewer.Reset();
            CombosReportViewer.LocalReport.ReportPath = Server.MapPath(@"~\Reportes\Report_Combos.rdlc");
            CombosReportViewer.LocalReport.DataSources.Clear();
            CombosReportViewer.LocalReport.DataSources.Add(new ReportDataSource("DataSet1", ListaCombos(filtro)));
            CombosReportViewer.LocalReport.Refresh();
        }
    }
}