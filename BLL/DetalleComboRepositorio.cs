using DAL;
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


        public bool GuardarDetalle(ProductosDetalle producto)
        {
            bool paso = false;
            try
            {
                if (_contexto.ProductosDetalle.Add(producto) != null)
                {
                    _contexto.SaveChanges();
                    _contexto.Dispose();
                    paso = true;
                }

            }
            catch (Exception)
            {

                throw;
            }
            return paso;
        }


        public override bool Modificar(Combos combos)
        {
            bool paso = false;
            bool paso2 = false;
            try
            {
                //Buscamos la Detalle(Productos) anterior convertiendola en una lista
                //OJO:AsNoTracking() sirve para que el conetexto no le de seguimiento a la entidad y hacer porder manipular su estado.
                var DetalleAnterior = _contexto.ProductosDetalle.Where(x => x.ComboId == combos.ComboId).AsNoTracking().ToList();

                //Marcamos como eleminado las celdas que sobran en el Detalle(Cuotas) Anterior de la base de datos
                foreach (var item in DetalleAnterior)
                {
                    if (!combos.Producto.Exists(x => x.ProductosDetalleId.Equals(item.ProductosDetalleId)))
                    {
                        _contexto.Entry(item).State = EntityState.Deleted;
                    }
                }

                foreach (var item in combos.Producto)
                {

                    if (item.ProductosDetalleId == 0)
                    {
                        GuardarDetalle(item);
                    }
                    else
                    {
                        _contexto.Entry(item).State = EntityState.Modified;
                        if (_contexto.SaveChanges() > 0)
                        {
                            paso2 = true;
                            paso = true;
                        }
                    }
                }

                if (paso2 == false)
                {
                    if (_contexto.SaveChanges() > 0)
                    {

                        paso = true;
                    }
                }
                _contexto.Dispose();
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
