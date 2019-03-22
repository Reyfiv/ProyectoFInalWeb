﻿using System;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace Entities
{
    [Serializable]
    public class ProductosDetalle
    {
        [Key]
        public int ProductosDetalleId { get; set; }
        public int ProductoId { get; set; }
        public string NombreProducto { get; set; }
        public string TipoProducto { get; set; }
        public decimal Precio { get; set; }
        public string Descripcion { get; set; }
        public DateTime Fecha { get; set; }

        [ForeignKey("ProductoId")]
        public virtual Productos Producto { get; set; }

        public ProductosDetalle(int productosDetalleId, int productoId, string nombreProducto, string tipoProducto, decimal precio, string descripcion, DateTime fecha)
        {
            ProductosDetalleId = productosDetalleId;
            ProductoId = productoId;
            this.NombreProducto = nombreProducto;
            this.TipoProducto = tipoProducto;
            this.Precio = precio;
            this.Descripcion = descripcion;
            this.Fecha = fecha;
        }

        public ProductosDetalle()
        {
            ProductosDetalleId = 0;
            ProductoId = 0;
            NombreProducto = string.Empty;
            TipoProducto = string.Empty;
            Precio = 0;
            Descripcion = string.Empty;
            Fecha = DateTime.Now;
        }
    }
}
