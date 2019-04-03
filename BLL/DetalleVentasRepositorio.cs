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
        public override bool Guardar(Ventas ventas)
        {
            bool paso = false;
            decimal monto = 0;
            _contexto = new DAL.Contexto();
            try
            {
                //foreach (var item in ventas.DetalleProducto)
                //{
                //    monto += item.Precio;
                //}
                //_contexto.Usuarios.Find(ventas.UsuarioId).TotalVendido += monto;
                //foreach (var item in ventas.DetalleCombo)
                //{
                //    monto += item.PrecioTotalCombo;
                //}
                //_contexto.Usuarios.Find(ventas.UsuarioId).TotalVendido += monto;
                //_contexto.Ventas.Add(ventas);

                //if (_contexto.SaveChanges() > 0)
                //    paso = true;

            }
            catch (Exception)
            {
                throw;
            }
            return paso;
        }

    }
}
