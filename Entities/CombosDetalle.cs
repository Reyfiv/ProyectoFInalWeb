using System;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;


namespace Entities
{
    [Serializable]
    public class CombosDetalle
    {
        [Key]
        public int ComboDetalleID { get; set; }
        public int VentaId { get; set; }
        public string NombreCombo { get; set; }
        public decimal PrecioTotalCombo { get; set; }

        [ForeignKey("VentaId")]
        public virtual Ventas Ventas { get; set; }

        public CombosDetalle(string nombreCombo, decimal precioTotalCombo)
        {
            NombreCombo = nombreCombo;
            PrecioTotalCombo = precioTotalCombo;
        }

        public CombosDetalle()
        {
            ComboDetalleID = 0;
            VentaId = 0;
            NombreCombo = string.Empty;
            PrecioTotalCombo = 0;
        }
    }
}
