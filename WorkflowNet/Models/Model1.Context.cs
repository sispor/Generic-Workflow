﻿//------------------------------------------------------------------------------
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
    using System.Data.Entity;
    using System.Data.Entity.Infrastructure;
    
    public partial class WorkflowNetEntities : DbContext
    {
        public WorkflowNetEntities()
            : base("name=WorkflowNetEntities")
        {
        }
    
        protected override void OnModelCreating(DbModelBuilder modelBuilder)
        {
            throw new UnintentionalCodeFirstException();
        }
    
        public virtual DbSet<estado_dependencia> estado_dependencia { get; set; }
        public virtual DbSet<estados> estados { get; set; }
        public virtual DbSet<parametro_secuencia_estado> parametro_secuencia_estado { get; set; }
        public virtual DbSet<parametros> parametros { get; set; }
        public virtual DbSet<parametros_estado_dependencia> parametros_estado_dependencia { get; set; }
        public virtual DbSet<proceso_workflow> proceso_workflow { get; set; }
        public virtual DbSet<sysdiagramas> sysdiagrams { get; set; }
        public virtual DbSet<tareas_estado> tareas_estado { get; set; }
        public virtual DbSet<tracks> tracks { get; set; }
        public virtual DbSet<workflow> workflow { get; set; }
    }
}
