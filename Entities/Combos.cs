using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;

namespace Entities
{
    [Serializable]
    public class Combos
    {
        [Key]
        public int ComboId { get; set; }
        public string NombreCombo { get; set; }
        public virtual List<ProductosDetalle> Producto { get; set; }
        public decimal PrecioTotalCombo { get; set; }
        public DateTime Fecha { get; set; }

        public Combos()
        {
            ComboId = 0;
            NombreCombo = string.Empty;
            Producto = new List<ProductosDetalle>();
            PrecioTotalCombo = 0;
            Fecha = DateTime.Now;
        }
        
    }
}
