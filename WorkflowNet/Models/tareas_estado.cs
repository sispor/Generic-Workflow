//------------------------------------------------------------------------------
// <auto-generated>
//     Este código se generó a partir de una plantilla.
//
//     Los cambios manuales en este archivo pueden causar un comportamiento inesperado de la aplicación.
//     Los cambios manuales en este archivo se sobrescribirán si se regenera el código.
// </auto-generated>
//------------------------------------------------------------------------------

namespace WorkflowNet.Models
{
    using System;
    using System.Collections.Generic;
    
    public partial class tareas_estado
    {
        public int id { get; set; }
        public string metodo { get; set; }
        public Nullable<int> id_estado { get; set; }
        public string parametros { get; set; }
        public string ruta_dll { get; set; }
        public string nombre_libreria { get; set; }
        public string nombre_clase { get; set; }
        public Nullable<bool> es_asincrona { get; set; }
    
        public virtual estados estados { get; set; }
    }
}
