using Entities;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Linq.Expressions;
using System.Text;
using System.Threading.Tasks;

namespace BLL
{
    public class DetalleVentasRepositorio : RepositorioBase<Ventas>
    {
        public override Ventas Buscar(int id)
        {
            Ventas ventas = new Ventas();
            try
            {
                ventas = _contexto.Ventas.Find(id);
                if (ventas != null)
                {
                    ventas.DetalleProducto.Count();
                    foreach (var item in ventas.DetalleProducto)
                    {

                    }
                    ventas.DetalleCombo.Count();
                    foreach (var item in ventas.DetalleCombo)
                    {

                    }
                }
                _contexto.Dispose();

            }
            catch (Exception)
            {

                throw;
            }
            return ventas;
        }

    }
}
