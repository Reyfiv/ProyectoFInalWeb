using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;

namespace Entities
{
    [Serializable]
    public class Ventas
    {
        [Key]
        public int VentaId { get; set; }
        public decimal TotalAPagar { get; set; }
        public decimal Efectivo { get; set; }
        public decimal Devuelta { get; set; }
        public DateTime Fecha { get; set; }

        public virtual List<VentaProductosDetalle> DetalleProducto { get; set; }
        public virtual List<CombosDetalle> DetalleCombo { get; set; }

        public Ventas()
        {
            VentaId = 0;
            TotalAPagar = 0;
            Efectivo = 0;
            Devuelta = 0;
            Fecha = DateTime.Now;

            DetalleProducto = new List<VentaProductosDetalle>();
            DetalleCombo = new List<CombosDetalle>();
        }
    }
}
