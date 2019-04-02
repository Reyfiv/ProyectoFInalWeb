using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Entities
{
    [Serializable]
    public class VentaProductosDetalle
    {
        [Key]
        public int VentaProductosDetalleId { get; set; }
        public int VentaId { get; set; }
        public string NombreProducto { get; set; }
        public string TipoProducto { get; set; }
        public decimal Precio { get; set; }
        public string Descripcion { get; set; }

        [ForeignKey("VentaId")]
        public virtual Ventas Ventas { get; set; }

        public VentaProductosDetalle(string nombreProducto, string tipoProducto, decimal precio, string descripcion)
        {
            this.NombreProducto = nombreProducto;
            this.TipoProducto = tipoProducto;
            this.Precio = precio;
            this.Descripcion = descripcion;
        }

        public VentaProductosDetalle()
        {
            VentaProductosDetalleId = 0;
            VentaId = 0;
            NombreProducto = string.Empty;
            TipoProducto = string.Empty;
            Precio = 0;
            Descripcion = string.Empty;
        }
    }
}
