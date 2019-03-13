using Entities;
using System;
using System.Data.Entity;
using System.Linq;

namespace BLL
{
    public class DetalleComboRepositorio : RepositorioBase<Combos>
    {
        public override Combos Buscar(int id)
        {
            Combos combos = new Combos();
            try
            {
                combos = _contexto.Combos.Find(id);
                if (combos != null)
                {
                    combos.Producto.Count();
                    foreach (var item in combos.Producto)
                    {
                      
                    }
                }
                _contexto.Dispose();
            }
            catch (Exception)
            {

                throw;
            }
            return combos;
        }

        public override bool Modificar(Combos combos)
        {
            bool paso = false;
            try
            {
                //buscar las entidades que no estan para removerlas
                var Anterior = _contexto.Combos.Find(combos.ComboId);
                foreach (var item in Anterior.Producto)
                {
                    if (!combos.Producto.Exists(d => d.ProductosDetalleId == item.ProductosDetalleId))
                    {
                        item.Descripcion = null;
                        _contexto.Entry(item).State = EntityState.Deleted;
                    }
                }

                //recorrer el detalle
                foreach (var item in combos.Producto)
                {
                    //Muy importante indicar que pasara con la entidad del detalle
                    var estado = item.ProductosDetalleId > 0 ? EntityState.Modified : EntityState.Added;
                    _contexto.Entry(item).State = estado;
                }

                //Idicar que se esta modificando el encabezado
                _contexto.Entry(combos).State = EntityState.Modified;

                if (_contexto.SaveChanges() > 0)
                    paso = true;
            }
            catch (Exception)
            {
                throw;
            }
            return paso;
        }

        public override bool Eliminar(int id)
        {
            bool paso = false;
            try
            {
                Combos combos = _contexto.Combos.Find(id);

                var Anterior = _contexto.Combos.Find(combos.ComboId);
                foreach (var item in Anterior.Producto)
                {
                    if (!combos.Producto.Exists(d => d.ProductosDetalleId == item.ProductosDetalleId))
                        _contexto.Entry(item).State = EntityState.Deleted;
                }

                _contexto.Combos.Remove(combos);

                if (_contexto.SaveChanges() > 0)
                {
                    paso = true;
                }
                _contexto.Dispose();
            }
            catch (Exception)
            {
                throw;
            }
            return paso;
        }
    }
}
