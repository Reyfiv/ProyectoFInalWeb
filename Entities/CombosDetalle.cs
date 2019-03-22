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
        public int ComboId { get; set; }
        public string NombreCombo { get; set; }
        public decimal PrecioTotalCombo { get; set; }
        public DateTime Fecha { get; set; }

        [ForeignKey("ComboId")]
        public virtual Combos Combos { get; set; }

        public CombosDetalle(int comboDetalleID, int comboId, string nombreCombo, decimal precioTotalCombo, DateTime fecha)
        {
            ComboDetalleID = comboDetalleID;
            ComboId = comboId;
            NombreCombo = nombreCombo;
            PrecioTotalCombo = precioTotalCombo;
            this.Fecha = fecha;
        }

        public CombosDetalle()
        {
            ComboDetalleID = 0;
            ComboId = 0;
            NombreCombo = string.Empty;
            PrecioTotalCombo = 0;
            Fecha = DateTime.Now;
        }
    }
}
