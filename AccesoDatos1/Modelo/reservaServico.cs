//------------------------------------------------------------------------------
// <auto-generated>
//     Este código se generó a partir de una plantilla.
//
//     Los cambios manuales en este archivo pueden causar un comportamiento inesperado de la aplicación.
//     Los cambios manuales en este archivo se sobrescribirán si se regenera el código.
// </auto-generated>
//------------------------------------------------------------------------------

namespace AccesoDatos1.Modelo
{
    using System;
    using System.Collections.Generic;
    
    public partial class reservaServico
    {
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
        public reservaServico()
        {
            this.reservas = new HashSet<reserva>();
        }
    
        public int id_reservaservicio { get; set; }
        public int id_servicio { get; set; }
        public int id_mascota { get; set; }
    
        public virtual mascota mascota { get; set; }
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<reserva> reservas { get; set; }
        public virtual servicio servicio { get; set; }
    }
}
