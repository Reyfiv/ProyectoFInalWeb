using System;
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
        public int ComboId { get; set; }
        public string NombreProducto { get; set; }
        public string TipoProducto { get; set; }
        public decimal Precio { get; set; }
        public string Descripcion { get; set; }

        [ForeignKey("ProductoId")]
        public virtual Productos Producto { get; set; }

        [ForeignKey("ComboId")]
        public virtual Combos Combos { get; set; }

        public ProductosDetalle(int productosDetalleId, int productoId, int comboId, string nombreProducto, string tipoProducto, decimal precio, string descripcion)
        {
            ProductosDetalleId = productosDetalleId;
            ProductoId = productoId;
            ComboId = comboId;
            this.NombreProducto = nombreProducto;
            this.TipoProducto = tipoProducto;
            this.Precio = precio;
            this.Descripcion = descripcion;
        }

        public ProductosDetalle()
        {
            ProductosDetalleId = 0;
            ProductoId = 0;
            ComboId = 0;
            NombreProducto = string.Empty;
            TipoProducto = string.Empty;
            Precio = 0;
            Descripcion = string.Empty;
        }

    }
}
